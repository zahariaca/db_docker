FROM mysql:8.0.13

LABEL maintainer="zaharia.c.alexandru@gmail.com"

# root password for mysql database.
ENV MYSQL_ROOT_PASSWORD=root

# this is needed, add here all databases that should be created (ones you will import)
ENV MYSQL_DATABASE cli_login

# copy sql scripts (dumps from other dbs)
COPY ./sql_scripts/ /docker-entrypoint-initdb.d/