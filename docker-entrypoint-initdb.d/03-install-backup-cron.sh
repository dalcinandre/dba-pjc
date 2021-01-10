#!/usr/bin/env bash
set -e

mv /tmp/run-{dump,full}.sh /pg/backup/

crontab <<EOF
00 20 * * * /pg/backup/run-dump.sh
30 00 * * * /pg/backup/run-full.sh
EOF
