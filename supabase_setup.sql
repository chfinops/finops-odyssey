-- ══════════════════════════════════════════════════════
-- FinOps Odyssey · Supabase Setup SQL
-- Run in: Supabase Dashboard → SQL Editor → New Query
-- ══════════════════════════════════════════════════════

-- ── 1. Tables ───────────────────────────────────────────────────

-- Scores (leaderboard)
CREATE TABLE IF NOT EXISTS scores (
  id            uuid DEFAULT gen_random_uuid() PRIMARY KEY,
  nickname      text NOT NULL,
  score         integer NOT NULL DEFAULT 0,
  phase_reached integer DEFAULT 1,
  efficiency    integer DEFAULT 0,
  combination   text,                    -- combo code handed to player
  removed       boolean DEFAULT false,   -- admin soft-delete
  created_at    timestamptz DEFAULT now()
);

-- Pool config (single row, id=1)
-- pool_numbers = array of ints e.g. [42, 137, 291]
CREATE TABLE IF NOT EXISTS pool_config (
  id            integer PRIMARY KEY DEFAULT 1,
  pool_size     integer NOT NULL DEFAULT 100,
  pool_numbers  integer[] NOT NULL DEFAULT '{}',
  updated_at    timestamptz DEFAULT now(),
  CONSTRAINT single_row CHECK (id = 1)
);

-- Allocations (log of combination numbers handed out)
CREATE TABLE IF NOT EXISTS allocations (
  id            uuid DEFAULT gen_random_uuid() PRIMARY KEY,
  combination   text NOT NULL,   -- e.g. '042'
  created_at    timestamptz DEFAULT now()
);

-- ── 2. Seed initial pool (100 numbers from 001-999) ─────────────
-- Run this once to create the first pool.
-- Admin portal reset will regenerate this any time.
INSERT INTO pool_config (id, pool_size, pool_numbers)
VALUES (
  1,
  100,
  (
    SELECT array_agg(n)
    FROM (
      SELECT n FROM generate_series(1, 999) AS n
      ORDER BY random()
      LIMIT 100
    ) sub
  )
)
ON CONFLICT (id) DO NOTHING;

-- ── 3. Indexes ───────────────────────────────────────────────────
CREATE INDEX IF NOT EXISTS idx_scores_leaderboard
  ON scores (score DESC)
  WHERE removed = false;

CREATE INDEX IF NOT EXISTS idx_allocations_combo
  ON allocations (combination);

-- ── 4. Row Level Security ────────────────────────────────────────
ALTER TABLE scores      ENABLE ROW LEVEL SECURITY;
ALTER TABLE pool_config ENABLE ROW LEVEL SECURITY;
ALTER TABLE allocations ENABLE ROW LEVEL SECURITY;

-- scores: public read (non-removed only)
CREATE POLICY "public leaderboard read"
  ON scores FOR SELECT
  USING (removed = false);

-- scores: authenticated staff can read all rows (incl. removed) — needed
-- for the RETURNING clause after admin soft-delete (otherwise the post-update
-- row fails the public SELECT policy and the UPDATE errors with 42501).
CREATE POLICY "admin select all scores"
  ON scores FOR SELECT
  TO authenticated
  USING (true);

-- scores: anyone can insert (no login to play)
CREATE POLICY "public score insert"
  ON scores FOR INSERT
  WITH CHECK (true);

-- scores: only authenticated staff can soft-delete (update removed=true)
CREATE POLICY "admin remove score"
  ON scores FOR UPDATE
  TO authenticated
  USING (true)
  WITH CHECK (true);

-- pool_config: public read (game needs pool_size for odds display)
CREATE POLICY "public pool read"
  ON pool_config FOR SELECT
  USING (true);

-- pool_config: only authenticated staff can update/reset
CREATE POLICY "admin pool update"
  ON pool_config FOR UPDATE
  TO authenticated
  USING (true);

-- allocations: public insert (game allocates on game end)
CREATE POLICY "public allocation insert"
  ON allocations FOR INSERT
  WITH CHECK (true);

-- allocations: authenticated staff can read (admin portal pool view)
CREATE POLICY "admin allocation read"
  ON allocations FOR SELECT
  TO authenticated
  USING (true);

-- allocations: authenticated staff can delete (during pool reset)
CREATE POLICY "admin allocation delete"
  ON allocations FOR DELETE
  TO authenticated
  USING (true);

-- ── 5. Done ──────────────────────────────────────────────────────
-- Next steps:
--   1. Go to Authentication → Users → Invite staff emails
--   2. Copy Project URL + publishable key from Settings → API
--   3. Paste into index.html and ch-booth-staff.html (SUPABASE_URL / SUPABASE_PUBLISHABLE_KEY)
--   4. Deploy to Vercel
