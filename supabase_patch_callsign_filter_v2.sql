-- ══════════════════════════════════════════════════════
-- FinOps Odyssey · Callsign filter patch v2
-- Adds missing words + fixes 8→B leet mapping.
-- Run on an EXISTING deployment via Supabase SQL Editor.
-- Safe to re-run.
-- ══════════════════════════════════════════════════════

DROP TRIGGER IF EXISTS trg_callsign_profanity ON scores;
DROP FUNCTION IF EXISTS check_callsign_profanity();

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
    'RETARD','TARD',
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
    'ANAL','DILDO','SKANK','DOUCHE','DOUCHEBAG',
    'TRANNY','HOMO',
    'TITTY','TITTIES',
    'ORGASM','ORGY',
    'CLOUDABILITY','APPTIO','FLEXERA','VANTAGE','CLOUDZERO'
  ];
  w text;
BEGIN
  -- Normalise leet-speak: 4→A @→A 3→E !→I |→I 1→I 0→O 5→S 7→T $→S 8→B
  normalized := upper(
    translate(NEW.nickname,
      '4@3!|1057$8',
      'AAEIIIOSTS B')
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
