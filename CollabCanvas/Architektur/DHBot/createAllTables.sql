/* Author: Hillmann, Ermis, Hartmann */

CREATE TABLE IF NOT EXISTS meme (
    pk_memes SERIAL NOT NULL PRIMARY KEY,
    link     varchar(255)
);

CREATE TABLE IF NOT EXISTS dualislogin (
    pk_dualislogin SERIAL NOT NULL PRIMARY KEY,
    nutzername     varchar(255),
    passwort       varchar(255)
);

CREATE TABLE IF NOT EXISTS kurs (
    pk_kurs            SERIAL NOT NULL PRIMARY KEY,
    name               varchar(255),
    vorlesungsplan_uid varchar(255)
);

CREATE TABLE IF NOT EXISTS nutzer (
    pk_nutzer      SERIAL NOT NULL PRIMARY KEY,
    name           varchar(255),
    chat_ID        bigint,
    send_morning   bool default True,
    send_reminders bool default True,
    fk_dualislogin int references dualislogin(pk_dualislogin),
    fk_kurs        int references kurs(pk_Kurs)
);

CREATE TABLE IF NOT EXISTS termin (
    pk_termine SERIAL NOT NULL PRIMARY KEY,
    titel      varchar(255),
    start      timestamp,
    ende       timestamp,
    fk_nutzer  int references nutzer(pk_nutzer)
);

CREATE TABLE IF NOT EXISTS fetched_lectures (
    fk_course           int references kurs(pk_kurs),
    calendar_week       int,
    last_fetched        timestamp,
    PRIMARY KEY (fk_course, calendar_week)
);

CREATE TABLE IF NOT EXISTS vorlesungstermin (
    pk_vorlesungstermine SERIAL NOT NULL PRIMARY KEY,
    titel                varchar(255),
    start                timestamp,
    ende                 timestamp,
    raum                 varchar(255),
    beschreibung         text,
    fk_kurs              int references kurs(pk_kurs)
);