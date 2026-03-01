-- =========================
-- DOWN migration
-- =========================
BEGIN;

ALTER TABLE users
    DROP COLUMN IF EXISTS created_at;

ALTER TABLE users
    DROP COLUMN IF EXISTS username;

COMMIT;
