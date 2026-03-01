-- =========================
-- UP migration
-- =========================
BEGIN;

ALTER TABLE users
    ADD COLUMN IF NOT EXISTS username VARCHAR(255) NULL;

ALTER TABLE users
    ADD COLUMN IF NOT EXISTS created_at TIMESTAMPTZ NULL;

COMMIT;
