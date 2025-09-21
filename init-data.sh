#!/usr/bin/env bash
set -e

# Script ini otomatis dipanggil oleh Postgres saat pertama bootstrap (jika data dir kosong).

echo "[init-data.sh] applying initial database setup..."

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<'SQL'
-- Extension umum (abaikan jika tidak tersedia)
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
CREATE EXTENSION IF NOT EXISTS "pgcrypto";

-- Parameter performa ringan (hanya untuk contoh; sesuaikan manual di postgresql.conf bila perlu)
-- (Biarkan kosong untuk image resmi; konfigurasi lanjutan sebaiknya via file conf terpisah)
SQL

echo "[init-data.sh] done."
