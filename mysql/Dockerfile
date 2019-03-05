FROM mysql:8.0.13

LABEL maintainer="zaharia.c.alexandru@gmail.com"

# root password for mysql database.
ENV MYSQL_ROOT_PASSWORD=root

# copy sql scripts (dumps from other dbs)
COPY ./sql_scripts/ /docker-entrypoint-initdb.d/

EXPOSE 7000:3306
EXPOSE 33060:33060