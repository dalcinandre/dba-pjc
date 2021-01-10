FROM postgres:12

ENV TZ='America/Cuiaba'

RUN apt update                                              && \
  # apt upgrade -y && \
  apt install -y pgbackrest vim iproute2 tzdata cron        && \
  rm -fr /etc/localtime                                     && \
  ln -sfn /usr/share/zoneinfo/${TZ} /etc/localtime          && \
  dpkg-reconfigure -f noninteractive tzdata                 && \
  apt-get clean

# Copia o arquivo de configuracao do sistema de backup (pgbackrest) para /etc
COPY ./pgbackrest/pgbackrest.conf /etc/

# Copia o arquivo de environment variables para /etc/profile.d para que fiquem disponiveis para
# todo sistema
COPY ./postgresql/postgresql.sh /etc/profile.d/

# Copia o arquivo de scripts e parametros do PostgreSQL para /tmp
COPY ./postgresql/scripts.sh /tmp
COPY ./postgresql/postgresql.conf /tmp
COPY ./postgresql/run-full.sh /tmp
COPY ./postgresql/run-dump.sh /tmp

# Altera a permissao do arquivo de scripts do PostgreSQL para execucao e em seguida executa-o para criar
# a estrutura de diretorios para os dados do banco de dados.
RUN chmod +x /tmp/scripts.sh && /tmp/scripts.sh
