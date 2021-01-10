FROM postgres:12

RUN apt update && \
  # apt upgrade -y && \
  apt install -y pgbackrest

# Copia o arquivo de configuracao do sistema de backup (pgbackrest) para /etc
COPY ./pgbackrest/pgbackrest.conf /etc/

# Copia o arquivo de environment variables para /etc/profile.d para que fiquem disponiveis para
# todo sistema
COPY ./postgresql/postgresql.sh /etc/profile.d/

# Copia o arquivo de scripts e parametros do PostgreSQL para /tmp
COPY ./postgresql/scripts.sh /tmp
COPY ./postgresql/postgresql.conf /tmp

# Escala a permissao do arquivo de scripts do PostgreSQL para execucao e depois o executa para criar
# uma estrutura de diretorios para os dados do banco de dados
RUN chmod +x /tmp/scripts.sh && /tmp/scripts.sh
