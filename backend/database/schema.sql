BEGIN TRANSACTION;

DROP TABLE IF EXISTS users;

CREATE TABLE users (
  id serial PRIMARY KEY,
  username varchar(255) NOT NULL UNIQUE,     -- Username
  password varchar(32) NOT NULL,      -- Password
  salt varchar(256) NOT NULL,          -- Password Salt
  role varchar(255) NOT NULL default('user')
);



CREATE SEQUENCE snippets_id_seq START 1;

DROP TABLE IF EXISTS snippets;

CREATE TABLE snippets
(
    id integer NOT NULL DEFAULT nextval('snippets_id_seq'::regclass),
    description character varying(255) COLLATE pg_catalog."default" NOT NULL,
    filename character varying(50) COLLATE pg_catalog."default" NOT NULL,
    sourcecode text COLLATE pg_catalog."default" NOT NULL,
    user_id bigint,
    tags character varying(255) COLLATE pg_catalog."default",
    CONSTRAINT snippets_pkey PRIMARY KEY (id)
);


COMMIT TRANSACTION;
