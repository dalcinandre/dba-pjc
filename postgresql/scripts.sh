#!/usr/bin/env bash
#

# cria uma estrutura de diretorios para alocar os dados do cluster de dados
# e arquivos de backup e logs
mkdir -pv /pg/{data,log,wal,backup/{full,dump}}

# Altera o proprietario dos arquivos e diretorios para o usuario postgres e grupo postgres
chown -v postgres:postgres -R /pg
chown -v postgres:postgres /tmp/postgresql.conf
chown -v postgres:postgres /etc/pgbackrest.conf
