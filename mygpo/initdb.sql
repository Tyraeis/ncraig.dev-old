CREATE USER mygpo WITH PASSWORD 'mygpo';
CREATE DATABASE mygpo;
GRANT ALL PRIVILEGES ON DATABASE mygpo to mygpo;
ALTER DATABASE mygpo OWNER TO mygpo;
ALTER ROLE mygpo SET statement_timeout = 5000;
