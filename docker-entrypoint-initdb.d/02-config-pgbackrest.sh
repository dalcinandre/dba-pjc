#!/usr/bin/env bash
set -e

pgbackrest stanza-create --stanza=${POSTGRES_STANZA}
