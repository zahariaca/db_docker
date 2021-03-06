##How to use

**PREREQUISITE** Docker installed

1. Cd into mysql folder
   `cd mysql`
2. Run:
   `docker build -t zahariaca/mysql .`
3. After image is build, run:
   `docker rm -vf az-mysql && docker run --name az-mysql -p 7000:3306 -d zahariaca/mysql`

##How to alter databases

You can add any sql dumps into the `sql_scripts` folder.

E.g (with a full dump, sql script does contain `CREATE DB/USE DB`):

1. You have a `dump.sql`, which is a dump of a mysql server, contains multiple dbs. Copy `*.sql` to `sql_scripts`
2. Build the docker image
3. Run your newly built image

E.g (with a dump of only 1 database, sql script doesn't contain `CREATE DB/USE DB`):

1. You have a `dump.sql`, which is a dump of a database called `testdb`. Copy `*.sql` to `sql_scripts`
2. Open `sql_scripts/dump.sql` in a text editor.
3. Added as the first lines:
   ```
   --
   -- USER ADDED AREA
   --
   CREATE DATABASE IF NOT EXISTS testdb;
   USE testdb;
   --
   -- USER ADDED AREA
   -----------------------------------------
   ```
4. Build the docker image
5. Run your newly built image

##How to work with your mysql server from cli:

####Executing sql queries

1. Run:
   `docker exec -it az-mysql bash`
2. Run:
   `mysql -uroot -proot -P 7000`
3. Business as usual...

####Working with the container

- To stop the container run:
  `docker stop az-mysql`
- To start the container run:
  `docker start az-mysql`
- To delete the container run (cautions: you will loose your databases):
  `docker rm -vf az-mysql`

##How to dump databases from container

####Dump all databases:

1. On your host machine run:
   `docker exec az-mysql sh -c 'exec mysqldump --all-databases -uroot -proot' > /some/path/on/your/host/all-databases.sql`

####Dump only 1 table:

1. On your host machine run:
   `docker exec az-mysql sh -c 'exec mysqldump cli_login -uroot -proot' > /some/path/on/your/host/cli_login.sql`

**NOTE** `az-mysql` = your container name

##References

- https://hub.docker.com/_/mysql/?tab=description
- https://docs.docker.com/engine/reference/builder/
