INSERT INTO _admin (login, pasword, lvlAccess) VALUES ('admin', 'admin', 3);

INSERT INTO _admin (login, pasword, lvlAccess) VALUES ('admin2', 'admin2', 1);




INSERT INTO all_world (name, description) VALUES ('World1', 'Какое то описание мира');




INSERT INTO _user (login, pasword, mail) VALUES ('user1', '123', 'ggg@gmain.ru');

INSERT INTO about_me (fio, aboutme, _login_user) VALUES ('Antonov VV', 'About me', 'user1');


INSERT INTO _user (login, pasword, mail) VALUES ('user2', '123', 'ggg2@gmain.ru');

INSERT INTO about_me (fio, aboutme, _login_user) VALUES ('Valoshin VV', 'About me', 'user2');


INSERT INTO _user (login, pasword, mail) VALUES ('user3', '123', 'ggg3@gmain.ru');

INSERT INTO about_me (fio, aboutme, _login_user) VALUES ('Denisov VV', 'About me', 'user3');




INSERT INTO region (name_region, description_region, position_x, position_y, _name_world) VALUES ('Region1', 'Тут описание реагиона', 0, 0, 'World1');

INSERT INTO region (name_region, description_region, position_x, position_y, _name_world) VALUES ('Region2', 'Тут описание реагиона', 0, 1, 'World1');

INSERT INTO region (name_region, description_region, position_x, position_y, _name_world) VALUES ('Region3', 'Тут описание реагиона', 0, 2, 'World1');

INSERT INTO region (name_region, description_region, position_x, position_y, _name_world) VALUES ('Region4', 'Тут описание реагиона', 0, 3, 'World1');




INSERT INTO _resource (tree, people, iron) VALUES (100, 100, 100);

INSERT INTO troop (archer, swordsman, rider, catapult) VALUES (0, 0, 0, 0);

INSERT INTO garrison (_id_troop) VALUES (1);

INSERT INTO town (name_town, number_town, position_x, position_y, _id_resource, _garrison, _login_user, _name_region) VALUES ('town1', 1, 0, 1, 1, 1, 'user1', 'Region1');


INSERT INTO _resource (tree, people, iron) VALUES (100, 100, 100);

INSERT INTO troop (archer, swordsman, rider, catapult) VALUES (0, 0, 0, 0);

INSERT INTO garrison (_id_troop) VALUES (2);

INSERT INTO town (name_town, number_town, position_x, position_y, _id_resource, _garrison, _login_user, _name_region) VALUES ('town2', 2, 0, 2, 2, 2, 'user2', 'Region1');


INSERT INTO _resource (tree, people, iron) VALUES (100, 100, 100);

INSERT INTO troop (archer, swordsman, rider, catapult) VALUES (0, 0, 0, 0);

INSERT INTO garrison (_id_troop) VALUES (3);

INSERT INTO town (name_town, number_town, position_x, position_y, _id_resource, _garrison, _login_user, _name_region) VALUES ('town3', 3, 0, 3, 3, 3, 'user3', 'Region1');




INSERT INTO _resource (tree, people, iron) VALUES (0, 0, 0);

INSERT INTO troop (archer, swordsman, rider, catapult) VALUES (100, 100, 0, 0);

INSERT INTO army (position_x, position_y, _id_resource, _name_region, _id_troop, _name_user) VALUES (1, 0, 4, 'Region1', 4, 'user1');




INSERT INTO troop (archer, swordsman, rider, catapult) VALUES (0, 0, 0, 0);

INSERT INTO garrison (_id_troop) VALUES (4);

INSERT INTO object_on_map (position_x, position_y, _id_garrison, _name_region, _name_user) VALUES (1, 1, 5, 'Region1', NULL);

INSERT INTO sawmill (_id_object) VALUES (1);


INSERT INTO troop (archer, swordsman, rider, catapult) VALUES (0, 0, 0, 0);

INSERT INTO garrison (_id_troop) VALUES (6);

INSERT INTO object_on_map (position_x, position_y, _id_garrison, _name_region, _name_user) VALUES (1, 2, 5, 'Region1', NULL);

INSERT INTO sawmill (_id_object) VALUES (2);


INSERT INTO troop (archer, swordsman, rider, catapult) VALUES (0, 0, 0, 0);

INSERT INTO garrison (_id_troop) VALUES (7);

INSERT INTO object_on_map (position_x, position_y, _id_garrison, _name_region, _name_user) VALUES (1, 3, 6, 'Region1', NULL);

INSERT INTO mine (_id_object) VALUES (3);









SELECT lvlAccess FROM _admin WHERE login = 'admin' AND pasword = 'admin'


SELECT GamePrise, isOn FROM _user WHERE login = 'user1' AND pasword = '123'


SELECT fio, aboutme FROM about_me WHERE login = 'user1' UNION SELECT name, description FROM all_world WHERE name = 'World1'


SELECT MAX(GamePrise) FROM _user WHERE GamePrise NOT IN (SELECT MAX(GamePrise) FROM  _user);


SELECT name_town FROM town WHERE _id_resource = (SELECT id_res FROM _resource WHERE MAX(people))








