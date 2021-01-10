#!/usr/bin/env bash
set -e

# cria um usuario novo no postgresql
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    CREATE USER pjc with encrypted password '1234';
    GRANT ALL PRIVILEGES ON DATABASE "${POSTGRES_DB}" TO pjc;
EOSQL
