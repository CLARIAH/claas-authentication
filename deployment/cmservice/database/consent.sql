PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE consent (
consent_id text primary key,
timestamp text not null,
months_valid integer not null,
attributes text not null);
COMMIT;
