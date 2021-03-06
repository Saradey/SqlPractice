PRAGMA foreing_keys = on;
PRAGMA auto_vacuum;

CREATE TABLE IF NOT EXISTS _admin (

login TEXT PRIMARY KEY NOT NULL UNIQUE,

pasword TEXT NOT NULL,

lvlAccess INTEGER NOT NULL CHECK (lvlAccess > 0 AND lvlAccess < 4)

); WITHOUT ROWID



CREATE TABLE IF NOT EXISTS user_log (

id_user INTEGER NOT NULL,

_log TEXT NOT NULL

);



CREATE TABLE IF NOT EXISTS admin_log (

id_almin INTEGER NOT NULL,

_log TEXT NOT NULL

);



CREATE TABLE IF NOT EXISTS _user (

login TEXT PRIMARY KEY NOT NULL UNIQUE,

pasword TEXT NOT NULL,

mail TEXT NOT NULL UNIQUE,

GamePrise DEFAULT 0 INTEGER NOT NULL,

isOn DEFAULT 1 INTEGER NOT NULL

); WITHOUT ROWID



CREATE TABLE IF NOT EXISTS about_me (

id_about INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL UNIQUE,

fio TEXT DEFAULT '' NOT NULL,

aboutme TEXT DEFAULT '' NOT NULL,

_login_user TEXT NOT NULL, --FOREIGN KEY

FOREIGN KEY (_login_user) REFERENCES _user(login) ON DELETE CASCADE ON UPDATE CASCADE

); WITHOUT ROWID



CREATE TABLE IF NOT EXISTS all_world (

name TEXT PRIMARY KEY NOT NULL UNIQUE,

description TEXT NOT NULL

); WITHOUT ROWID



CREATE TABLE IF NOT EXISTS region (

name_region TEXT PRIMARY KEY NOT NULL UNIQUE,

description_region TEXT NOT NULL,

position_x INTEGER NOT NULL,

position_y INTEGER NOT NULL,

_name_world TEXT NOT NULL, --FOREIGN KEY

FOREIGN KEY (_name_world) REFERENCES all_world(name) ON DELETE CASCADE ON UPDATE CASCADE

); WITHOUT ROWID



CREATE TABLE IF NOT EXISTS troop (

id_troop INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL UNIQUE,

archer INTEGER NOT NULL CHECK (archer > -1),

swordsman INTEGER NOT NULL CHECK (swordsman > -1),

rider INTEGER NOT NULL CHECK (rider > -1),

catapult INTEGER NOT NULL CHECK (catapult > -1)

); WITHOUT ROWID



CREATE TABLE IF NOT EXISTS garrison (

 garrison_id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL UNIQUE,
 
 _id_troop INTEGER NOT NULL, --FOREIGN KEY
 
 FOREIGN KEY (_id_troop) REFERENCES troop(id_troop) ON DELETE CASCADE ON UPDATE CASCADE

); WITHOUT ROWID



CREATE TABLE IF NOT EXISTS _resource (

id_res INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL UNIQUE,

tree INTEGER NOT NULL CHECK (tree > -1),

people INTEGER NOT NULL CHECK (tree > -1),

iron INTEGER NOT NULL CHECK (tree > -1)

); WITHOUT ROWID



CREATE TABLE IF NOT EXISTS town (

name_town TEXT NOT NULL UNIQUE,

number_town INTEGER NOT NULL,

position_x INTEGER NOT NULL CHECK (position_x > -1 AND position_x < 50),

position_y INTEGER NOT NULL CHECK (position_y > -1 AND position_y < 50),

_id_resource INTEGER NOT NULL, --FOREIGN KEY

_garrison INTEGER NOT NULL, --FOREIGN KEY

_login_user TEXT NOT NULL, --FOREIGN KEY

_name_region TEXT NOT NULL, --FOREIGN KEY

PRIMARY KEY(name_town, number_town),

FOREIGN KEY (_login_user) REFERENCES _user(login) ON DELETE CASCADE ON UPDATE CASCADE,

FOREIGN KEY (_name_region) REFERENCES region(name_region) ON DELETE CASCADE ON UPDATE CASCADE,

FOREIGN KEY (_id_resource) REFERENCES _resource(id_res) ON DELETE CASCADE ON UPDATE CASCADE,

FOREIGN KEY (_garrison) REFERENCES garrison(garrison_id) ON DELETE CASCADE ON UPDATE CASCADE,

); WITHOUT ROWID




CREATE TABLE IF NOT EXISTS army (

id_army INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL UNIQUE,

position_x INTEGER NOT NULL,

position_y INTEGER NOT NULL,

_id_resource INTEGER NOT NULL, --FOREIGN KEY

_name_region TEXT NOT NULL, --FOREIGN KEY

_id_troop INTEGER NOT NULL, --FOREIGN KEY

_name_user TEXT NOT NULL, --FOREIGN KEY

FOREIGN KEY (_id_resource) REFERENCES _resource(id_res) ON DELETE CASCADE ON UPDATE CASCADE,

FOREIGN KEY (_name_region) REFERENCES region(name_region) ON DELETE CASCADE ON UPDATE CASCADE,

FOREIGN KEY (_id_troop) REFERENCES troop(id_troop) ON DELETE CASCADE ON UPDATE CASCADE,

FOREIGN KEY (_name_user) REFERENCES _user(login) ON DELETE CASCADE ON UPDATE CASCADE

); WITHOUT ROWID



CREATE TABLE IF NOT EXISTS object_on_map (

id_object INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL UNIQUE,

position_x INTEGER NOT NULL,

position_y INTEGER NOT NULL,

_id_garrison INTEGER NOT NULL, --FOREIGN KEY

_name_region TEXT NOT NULL, --FOREIGN KEY

_name_user TEXT NULL, --FOREIGN KEY

FOREIGN KEY (_id_garrison) REFERENCES garrison(garrison_id) ON DELETE CASCADE ON UPDATE CASCADE,

FOREIGN KEY (_name_region) REFERENCES region(name_region) ON DELETE CASCADE ON UPDATE CASCADE

FOREIGN KEY (_name_user) REFERENCES _user(login) ON DELETE CASCADE ON UPDATE CASCADE

); WITHOUT ROWID



CREATE TABLE IF NOT EXISTS sawmill (

id_sawmill INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL UNIQUE,

type_object TEXT DEFAULT 'sawmill' NOT NULL,

tree INTEGER DEFAULT 0 NOT NULL CHECK (tree > -1),

lvl INTEGER DEFAULT 1 NOT NULL CHECK (lvl > 0 AND lvl < 11),

_id_object INTEGER NOT NULL, --FOREIGN KEY

FOREIGN KEY (_id_object) REFERENCES object_on_map(id_object) ON DELETE CASCADE ON UPDATE CASCADE

);



CREATE TABLE IF NOT EXISTS mine (

id_mine INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL UNIQUE,

type_object TEXT DEFAULT 'mine' NOT NULL,

iron INTEGER DEFAULT 0 NOT NULL CHECK (iron > -1),

lvl INTEGER DEFAULT 1 NOT NULL CHECK (lvl > 0 AND lvl < 11),

_id_object INTEGER NOT NULL, --FOREIGN KEY

FOREIGN KEY (_id_object) REFERENCES object_on_map(id_object) ON DELETE CASCADE ON UPDATE CASCADE

);