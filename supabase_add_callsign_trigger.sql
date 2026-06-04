-- ══════════════════════════════════════════════════════
-- FinOps Odyssey · Add callsign profanity trigger
-- Run on an EXISTING deployment (already ran supabase_setup.sql).
-- Safe to re-run: uses CREATE OR REPLACE + DROP IF EXISTS.
-- ══════════════════════════════════════════════════════

-- Drop old trigger first (idempotent re-run safety)
DROP TRIGGER IF EXISTS trg_callsign_profanity ON scores;
DROP FUNCTION IF EXISTS check_callsign_profanity();

-- Normalises leet-speak then blocks bad words before INSERT commits.
-- RAISE EXCEPTION 'callsign_blocked' is caught by index.html and shown
-- to the player as an invalid-callsign error.
CREATE OR REPLACE FUNCTION check_callsign_profanity()
RETURNS trigger LANGUAGE plpgsql AS $$
DECLARE
  normalized text;
  bad_words text[] := ARRAY[
    'FUCK','FUK','FUCC','FCK','FVCK',
    'SHIT','SHYT',
    'ASS','AZZ','ARSE',
    'CUNT','CVNT',
    'DICK','DIK','DYCK',
    'COCK','COK',
    'BITCH','BYTCH','BIATCH',
    'PUSSY','PUSS',
    'NIGGA','NIGGER',
    'FAGGOT','FAGOT','FAG',
    'RETARD',
    'WHORE','SLUT',
    'PRICK','BASTARD',
    'DAMN','CRAP',
    'NAZI','RAPE','RAPIST',
    'KILL','HITLER','JIHAD',
    'PENIS','VAGINA','BOOB','TITS','TIT',
    'CUMSHOT','CUM','JIZZ',
    'MASTURBAT','HANDJOB','BLOWJOB',
    'NWORD','KIKE','SPIC','CHINK','WETBACK',
    'SUCKS','SUCK','BALLS','PISS',
    'FCUK',
    'WANK','WANKER','TWAT','KNOB','KNOBHEAD','BOLLOCKS','TOSSER',
    'TURD','FART','POOP',
    'STUPID','IDIOT','MORON',
    'SEX','PORN','NUDE','BONER',
    'CLOUDABILITY','APPTIO','FLEXERA','VANTAGE','CLOUDZERO'
  ];
  w text;
BEGIN
  normalized := upper(
    translate(NEW.nickname,
      '4@3!|1057$',
      'AAEIIIOSTS')
  );
  FOREACH w IN ARRAY bad_words LOOP
    IF normalized LIKE '%' || w || '%' THEN
      RAISE EXCEPTION 'callsign_blocked';
    END IF;
  END LOOP;
  RETURN NEW;
END;
$$;

CREATE TRIGGER trg_callsign_profanity
  BEFORE INSERT ON scores
  FOR EACH ROW EXECUTE FUNCTION check_callsign_profanity();
