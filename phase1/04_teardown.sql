-- Phase 1 | Teardown
-- Drops the learn_library database entirely.
--
-- When to run this:
--   - You want a clean reset (re-run 01_schema.sql + 02_seed.sql after)
--   - You're done with Phase 1 and want to free up space
--
-- When NOT to run this:
--   - You're moving to Phase 2 but want to keep learn_library around for reference
--
-- IMPORTANT: Run this connected to the `postgres` database, NOT learn_library.
-- You cannot drop a database you are currently connected to.

DROP DATABASE IF EXISTS learn_library;
