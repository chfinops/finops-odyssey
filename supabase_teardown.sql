-- ══════════════════════════════════════════════════════
-- FinOps Odyssey · Supabase Teardown SQL
-- Drops all tables, policies, and indexes.
-- Run BEFORE supabase_setup.sql to start fresh.
-- ══════════════════════════════════════════════════════

-- Drop policies first (required before table drop)
DROP POLICY IF EXISTS "public leaderboard read"    ON scores;
DROP POLICY IF EXISTS "admin select all scores"    ON scores;
DROP POLICY IF EXISTS "public score insert"        ON scores;
DROP POLICY IF EXISTS "admin remove score"         ON scores;

DROP POLICY IF EXISTS "public pool read"           ON pool_config;
DROP POLICY IF EXISTS "admin pool update"          ON pool_config;

DROP POLICY IF EXISTS "public allocation insert"   ON allocations;
DROP POLICY IF EXISTS "admin allocation read"      ON allocations;
DROP POLICY IF EXISTS "admin allocation delete"    ON allocations;

-- Drop tables (CASCADE removes dependent indexes)
DROP TABLE IF EXISTS allocations  CASCADE;
DROP TABLE IF EXISTS pool_config  CASCADE;
DROP TABLE IF EXISTS scores       CASCADE;
