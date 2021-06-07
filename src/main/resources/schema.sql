-- SQLINES DEMO *** sktop version to convert large SQL scripts,
-- SQLINES DEMO *** ny issues with Online conversion.
DROP TABLE IF EXISTS contacts CASCADE;
DROP TABLE IF EXISTS addresses CASCADE;

DROP TABLE IF EXISTS permissions_roles CASCADE;
DROP TABLE IF EXISTS users_roles;

DROP TABLE IF EXISTS permissions;
DROP TABLE IF EXISTS roles;
DROP TABLE IF EXISTS users;

DROP SEQUENCE IF EXISTS roles_seq;
DROP SEQUENCE IF EXISTS permissions_seq;
DROP SEQUENCE IF EXISTS users_seq;

CREATE SEQUENCE roles_seq;

CREATE TABLE roles (
  id BIGINT NOT NULL DEFAULT NEXTVAL ('roles_seq') PRIMARY KEY,
  role varchar(80) NOT NULL UNIQUE
);

CREATE SEQUENCE permissions_seq;

CREATE TABLE permissions (
  id BIGINT NOT NULL DEFAULT NEXTVAL ('permissions_seq') PRIMARY KEY,
  permission varchar(80) NOT NULL UNIQUE,
  enabled BOOLEAN DEFAULT true,
  note varchar(255) DEFAULT NULL
);

CREATE TABLE permissions_roles (
  permission_id BIGINT NOT NULL,
  role_id BIGINT NOT NULL,
  PRIMARY KEY (permission_id, role_id),
  FOREIGN KEY (permission_id) REFERENCES permissions(id),
  FOREIGN KEY (role_id) REFERENCES roles(id)
);

CREATE SEQUENCE users_seq;

CREATE TABLE users (
  id BIGINT NOT NULL DEFAULT NEXTVAL ('users_seq') PRIMARY KEY,
  username varchar(100) NOT NULL UNIQUE,
  password varchar(255) NOT NULL,
  name varchar(100) DEFAULT NULL,
  surname varchar(100) DEFAULT NULL,
  gender SMALLINT DEFAULT NULL,
  birth_date DATE DEFAULT NULL,
  enabled BOOLEAN DEFAULT true,
  creation_dt timestamp(0) NOT NULL DEFAULT current_timestamp,
  updated_dt timestamp(0) DEFAULT current_timestamp,
  login_dt timestamp(0) NULL,
  note varchar(255) DEFAULT NULL,
  secured BOOLEAN DEFAULT false
);

CREATE TABLE users_roles (
  user_id BIGINT NOT NULL,
  role_id BIGINT NOT NULL,
  PRIMARY KEY (user_id, role_id),
  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (role_id) REFERENCES roles(id)
);

CREATE TABLE contacts (
  user_id BIGINT NOT NULL PRIMARY KEY,
  email varchar(255) NOT NULL UNIQUE,
  phone varchar(20) DEFAULT NULL,
  skype varchar(255) DEFAULT NULL,
  facebook varchar(255) DEFAULT NULL,
  linkedin varchar(255) DEFAULT NULL,
  website varchar(255) DEFAULT NULL,
  note varchar(255) DEFAULT NULL,
  FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE addresses (
  user_id BIGINT NOT NULL PRIMARY KEY,
  address varchar(255) DEFAULT NULL,
  address2 varchar(255) DEFAULT NULL,
  city varchar(20) DEFAULT NULL,
  country varchar(20) DEFAULT NULL,
  zip_code varchar(20) DEFAULT NULL,
  FOREIGN KEY (user_id) REFERENCES users(id)
);

DROP VIEW IF EXISTS enabled_users;

CREATE VIEW enabled_users AS
SELECT username, contacts.email, contacts.phone,creation_dt, updated_dt, login_dt, secured
FROM users
INNER JOIN contacts on contacts.user_id = users.id
WHERE
enabled IS TRUE;
