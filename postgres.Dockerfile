FROM postgres:13-alpine
COPY mygpo/initdb.sql /docker-entrypoint-initdb.d/mygpo-init.sql
