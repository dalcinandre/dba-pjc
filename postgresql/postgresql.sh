#!/usr/bin/env bash
#

# Configuração do banco de dados padrão do SGDB
export PGDATABASE='dbpolicia'

# Aqui configura-se o diretorio padrão dos dados do banco criado!
export PGDATA='/pg/data'

# Aqui setando o Timezone para manter data e hora corretas no SGDB.
export PGTZ='America/Cuiaba' # podendo claro ser mudado para atender as localidades desejadas!

# stanza padrao do sistema de backups
export PGBACKREST_STANZA='dbpolicia'
