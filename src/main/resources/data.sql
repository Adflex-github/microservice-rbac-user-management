
DELETE FROM permissions_roles;
DELETE FROM permissions;
DELETE FROM users_roles;
DELETE FROM roles;

DELETE FROM contacts;
DELETE FROM addresses;
DELETE FROM users;

INSERT INTO permissions( permission, note) VALUES ( 'LOGIN', 'User Login');
INSERT INTO permissions( permission, note) VALUES ( 'VIEW_PROFILE', 'View user profile');
INSERT INTO permissions( permission, note) VALUES ( 'ADMIN_USER_DATA', 'Manage user data');

INSERT INTO permissions( permission, note, enabled) VALUES ( 'ADMIN_STATISTICS', 'View statistical graphs', false);

INSERT INTO roles( role) VALUES ( 'USER');
INSERT INTO roles( role) VALUES ( 'ADMINISTRATOR');

INSERT INTO permissions_roles(permission_id, role_id) VALUES (1, 1);
INSERT INTO permissions_roles(permission_id, role_id) VALUES (2, 1);

INSERT INTO permissions_roles(permission_id, role_id) VALUES (1, 2);
INSERT INTO permissions_roles(permission_id, role_id) VALUES (2, 2);
INSERT INTO permissions_roles(permission_id, role_id) VALUES (3, 2);


INSERT INTO users( username, password, name, surname, gender) VALUES ( 'andrea', '1d/NZaEqNgtEomytAPrwm/+QjmbudLg33oeEk77Xh88=', 'Andrea', 'Test', 0);
INSERT INTO users( username, password, name, surname, gender) VALUES ('mario', '1d/NZaEqNgtEomytAPrwm/+QjmbudLg33oeEk77Xh88=', 'Mario', 'Rossi', 0);
INSERT INTO users( username, password, name, surname, gender) VALUES ( 'stefania', '1d/NZaEqNgtEomytAPrwm/+QjmbudLg33oeEk77Xh88=', 'Stefania', 'Verdi', 1);
INSERT INTO users( username, password, name, surname, gender) VALUES ( 'veronica', '1d/NZaEqNgtEomytAPrwm/+QjmbudLg33oeEk77Xh88=', 'Veronica', 'Gialli', 1);
INSERT INTO users( username, password, name, surname, gender) VALUES ( 'mark', '1d/NZaEqNgtEomytAPrwm/+QjmbudLg33oeEk77Xh88=', 'Mark', 'Green', 0);
INSERT INTO users( username, password, name, surname, gender) VALUES ( 'paul', '1d/NZaEqNgtEomytAPrwm/+QjmbudLg33oeEk77Xh88=', 'Paul', 'Ludwing', 0);
INSERT INTO users( username, password, name, surname, gender) VALUES ( 'jennifer', '1d/NZaEqNgtEomytAPrwm/+QjmbudLg33oeEk77Xh88=', 'Jennifer', 'Red', 0);
INSERT INTO users( username, password, name, surname, gender) VALUES ( 'karina', '1d/NZaEqNgtEomytAPrwm/+QjmbudLg33oeEk77Xh88=', 'Karina', 'Yellow', 1);

UPDATE users SET ENABLED = false WHERE id = 6;

UPDATE users SET birth_date = '1977-08-14' WHERE id = 1;
UPDATE users SET secured = true WHERE id = 1;

INSERT INTO users_roles(user_id, role_id) VALUES (1, 1);
INSERT INTO users_roles(user_id, role_id) VALUES (1, 2);

INSERT INTO users_roles(user_id, role_id) VALUES (2, 1);
INSERT INTO users_roles(user_id, role_id) VALUES (3, 1);
INSERT INTO users_roles(user_id, role_id) VALUES (4, 1);
INSERT INTO users_roles(user_id, role_id) VALUES (5, 1);
INSERT INTO users_roles(user_id, role_id) VALUES (6, 1);
INSERT INTO users_roles(user_id, role_id) VALUES (7, 1);
INSERT INTO users_roles(user_id, role_id) VALUES (8, 1);



INSERT INTO contacts(user_id, email, phone, note) VALUES (1, 'andrea.test@gmail.com', NULL, NULL);
INSERT INTO contacts(user_id, email, phone, note) VALUES (2, 'mario.rossi@gmail.com', NULL, 'test contact note on mario rossi');
INSERT INTO contacts(user_id, email, phone, note) VALUES (3, 'stefania.verdi@gmail.com', NULL, NULL);
INSERT INTO contacts(user_id, email, phone, note) VALUES (4, 'veronica.gialli@gmail.com', NULL, NULL);
INSERT INTO contacts(user_id, email, phone, note) VALUES (5, 'mark.green@gmail.com', NULL, NULL);
INSERT INTO contacts(user_id, email, phone, note) VALUES (6, 'paul.ludwing@gmail.com', NULL, NULL);
INSERT INTO contacts(user_id, email, phone, note) VALUES (7, 'jennifer.red@gmail.com', NULL, NULL);
INSERT INTO contacts(user_id, email, phone, note) VALUES (8, 'karina.yellow@gmail.com', NULL, NULL);

insert into addresses(user_id, address, address2, city, country, zip_code) values (2, 'Via Filzi 2', 'Borgo Teresiano', 'Florence', 'Italy', '50100');
insert into addresses(user_id, address, address2, city, country, zip_code) values (7, 'Piazza Grande 12', 'Gran canal', 'Venice', 'Italy', '30100');
insert into addresses(user_id, address, address2, city, country, zip_code) values (8, 'Via Roma 2', 'Borgo Teresiano', 'Trieste', 'Italy', '34100');
