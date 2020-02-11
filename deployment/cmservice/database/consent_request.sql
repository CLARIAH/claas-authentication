PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE consent_request (
ticket text primary key,
data text not null,
timestamp text not null);
COMMIT;
