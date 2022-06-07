/*
Name: Melissa Swearingen & Kimberly Markley
SQL Tables for 'Sol' System
Databases 340
Homework 9 & 10
*/


/* 
 * For each table created, you should include: 
 * 
 *    -name (be descriptive) of each attribute
 *    -type of each attribute (consider the storage space implications of each choice)
 *    -attribute constraints (e.g., NOT NULL, uniqueness, default value)
 *    -primary key
 *    -foreign keys (all of them)
 *    -referential integrity constraints
 *    -CHECK clauses (if needed)
 *    -short comment linking the table creation command to the entity name of your ER diagram
 *    -include a DROP TABLE command before each CREATE TABLE command, to facilitate quick database re-generation
 *    used the command "sqlite3 hw9.db < hw9.sql" to run and check for syntax errors
 */

CREATE TABLE ARTIFICIAL_SATELLITE ( 
    Satid INTEGER NOT NULL,
    Sat_name VARCHAR(50) NOT NULL,
    Country_origin VARCHAR(50) NOT NULL,
    Task VARCHAR(50) NOT NULL,
    PRIMARY KEY (Satid)
);

CREATE TABLE SATELLITE_TASKS (
    Satid INTEGER NOT NULL,
    Task VARCHAR(50) NOT NULL,
    PRIMARY KEY (Satid, Task),
    FOREIGN KEY (Satid) REFERENCES ARTIFICIAL_SATELLITE(Satid)
);

CREATE TABLE ALIEN_LIFE (
    Satid INTEGER NOT NULL,
    Alien_name VARCHAR(50) NOT NULL,
    Sentient BOOLEAN NOT NULL,
    PRIMARY KEY (Satid, Alien_name),
    FOREIGN KEY (Satid) REFERENCES ARTIFICIAL_SATELLITE(Satid)
);

CREATE TABLE STAR (
    Sid INTEGER NOT NULL,
    Star_name VARCHAR(50) NOT NULL,
    Nass DOUBLE PRECISION NOT NULL,
    Luminosity DOUBLE PRECISION NOT NULL,
    Radius DOUBLE PRECISION NOT NULL,
    PRIMARY KEY (Sid)
);

CREATE TABLE PLANET (
    Pid INTEGER NOT NULL,
    Planet_name VARCHAR(50) NOT NULL,
    Mass DOUBLE PRECISION NOT NULL,
    Diameter DOUBLE PRECISION NOT NULL,
    Gravity DOUBLE PRECISION NOT NULL,
    Orbital_period DOUBLE PRECISION NOT NULL,
    Day_length DOUBLE PRECISION NOT NULL,
    Dwarf_planet BOOLEAN NOT NULL,
    PRIMARY KEY (Pid)
);

CREATE TABLE MOON (
    Mid INTEGER NOT NULL,
    Moon_name VARCHAR(50) NOT NULL,
    Pid INTEGER NOT NULL,
    Mass DOUBLE PRECISION NOT NULL,
    Radius DOUBLE PRECISION NOT NULL,
    Gravity DOUBLE PRECISION NOT NULL,
    Albedo DOUBLE PRECISION NOT NULL,
    PRIMARY KEY (Mid),
    FOREIGN KEY (Pid) REFERENCES PLANET(Pid)
);

CREATE TABLE MOON_ORBITS (
    Pid INTEGER NOT NULL,
    Mid INTEGER NOT NULL,
    PRIMARY KEY (Pid, Mid),
    FOREIGN KEY (Pid) REFERENCES PLANET(Pid),
    FOREIGN KEY (Mid) REFERENCES MOON(Mid)
);

CREATE TABLE ASTEROID (
    Aid INTEGER NOT NULL,
    Name VARCHAR(50) NOT NULL,
    Mass INTEGER, 
    Diameter INTEGER, 
    Rotation_period INTEGER,
    PRIMARY KEY (Aid)
);

CREATE TABLE COMET (
    Cid INTEGER NOT NULL,
    Name VARCHAR(50) NOT NULL,
    Mass INTEGER,
    PRIMARY KEY (Cid)
);

CREATE TABLE MONITORS (
    Cid INTEGER NOT NULL,
    Aid INTEGER NOT NULL,
    Mid INTEGER NOT NULL,
    Satid INTEGER NOT NULL,
    Alien_name VARCHAR(50) NOT NULL,
    Sid INTEGER NOT NULL,
    Pid INTEGER NOT NULL,
    PRIMARY KEY (Cid, Aid, Mid, Satid, Alien_name, Sid, Pid),
    FOREIGN KEY (Cid) REFERENCES COMET(Cid),
    FOREIGN KEY (Aid) REFERENCES ASTEROID(Aid),
    FOREIGN KEY (Mid) REFERENCES MOON(Mid),
    FOREIGN KEY (Satid) REFERENCES ARTIFICIAL_SATELLITE(Satid),
    FOREIGN KEY (Alien_name) REFERENCES ALIEN_LIFE(Alien_name),
    FOREIGN KEY (Sid) REFERENCES STAR(Sid),
    FOREIGN KEY (Pid) REFERENCES PLANET(Pid)
);

CREATE TABLE ORBITS (
    Aid INTEGER NOT NULL,
    Pid INTEGER NOT NULL,
    Sid INTEGER NOT NULL,
    PRIMARY KEY (Aid, Pid, Sid),
    FOREIGN KEY (Aid) REFERENCES ASTEROID(Aid),
    FOREIGN KEY (Pid) REFERENCES PLANET(Pid),
    FOREIGN KEY (Sid) REFERENCES STAR(Sid)
);

CREATE TABLE COLLIDES (
    Pid INTEGER NOT NULL,
    Mid INTEGER NOT NULL,
    Aid INTEGER NOT NULL,
    PRIMARY KEY (Pid, Mid, Aid),
    FOREIGN KEY (Pid) REFERENCES PLANET(Pid),
    FOREIGN KEY (Mid) REFERENCES MOON(Mid),
    FOREIGN KEY (Aid) REFERENCES ASTEROID(Aid)
);

DROP TABLE ARTIFICIAL_SATELLITE;
DROP TABLE SATELLITE_TASKS;
DROP TABLE ALIEN_LIFE;
DROP TABLE STAR;
DROP TABLE PLANET;
DROP TABLE MOON;
DROP TABLE MOON_ORBITS;
DROP TABLE ASTEROID;
DROP TABLE COMET;
DROP TABLE MONITORS;
DROP TABLE ORBITS;
DROP TABLE COLLIDES;
