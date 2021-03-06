/*
Name: Melissa Swearingen & Kimberly Markley
SQL Tables for 'Sol' System
Databases 340
Homework 9 & 10

Note:
    - all size data is relative to Earth, and all time 
    measurement is relative to Earth's day length
*/

/* Entity Name:
Artificial Satellite
*/
DROP TABLE if exists ARTIFICIAL_SATELLITE;
CREATE TABLE ARTIFICIAL_SATELLITE ( 
    Satid INTEGER NOT NULL UNIQUE,
    Name VARCHAR(50) NOT NULL,
    Country_origin VARCHAR(50) NOT NULL,
    PRIMARY KEY (Satid)
);

/* Multivalued Attribute:
Task
*/
DROP TABLE if exists SATELLITE_TASK;
CREATE TABLE SATELLITE_TASK (
    Satid INTEGER NOT NULL,
    Task VARCHAR(50) NOT NULL,
    PRIMARY KEY (Satid, Task),
    FOREIGN KEY (Satid) REFERENCES ARTIFICIAL_SATELLITE(Satid) ON DELETE CASCADE
);

/* Entity Name:
Alien Life
*/
DROP TABLE if exists ALIEN_LIFE;
CREATE TABLE ALIEN_LIFE (
    Satid INTEGER NOT NULL,
    Name VARCHAR(50) NOT NULL,
    Sentient TINYINT(1) NOT NULL DEFAULT 0,
    PRIMARY KEY (Satid, Name),
    FOREIGN KEY (Satid) REFERENCES ARTIFICIAL_SATELLITE(Satid)
);

/* Entity Name:
Star
*/
DROP TABLE if exists STAR;
CREATE TABLE STAR (
    Sid INTEGER NOT NULL UNIQUE,
    Name VARCHAR(50) NOT NULL,
    Mass DOUBLE PRECISION(10,6) NOT NULL,
    Luminosity DOUBLE PRECISION(10,6) NOT NULL,
    Radius DOUBLE PRECISION(10,6) NOT NULL,
    PRIMARY KEY (Sid)
);

/* Entity Name:
Planet
*/
DROP TABLE if exists PLANET;
CREATE TABLE PLANET (
    Pid INTEGER NOT NULL UNIQUE,
    Name VARCHAR(50) NOT NULL,
    Mass DOUBLE PRECISION(10,6) NOT NULL,
    Diameter DOUBLE PRECISION(10,6) NOT NULL,
    Gravity DOUBLE PRECISION(10,6) NOT NULL,
    Orbital_period DOUBLE PRECISION(10,6) NOT NULL,
    Day_length DOUBLE PRECISION(10,6) NOT NULL,
    Dwarf_planet TINYINT(1) NOT NULL DEFAULT 0,
    PRIMARY KEY (Pid)
);

/* Entity Name:
Moon
*/
DROP TABLE if exists MOON;
CREATE TABLE MOON (
    Mid INTEGER NOT NULL UNIQUE,
    Name VARCHAR(50) NOT NULL,
    Pid INTEGER NOT NULL,
    Radius DOUBLE PRECISION(10,6) NOT NULL,
    Gravity DOUBLE PRECISION(10,6) NOT NULL,
    Albedo DOUBLE PRECISION(10,6) NOT NULL,
    PRIMARY KEY (Mid),
    FOREIGN KEY (Pid) REFERENCES PLANET(Pid)
);

/* Relationship:
Orbits
*/
DROP TABLE if exists MOON_ORBIT;
CREATE TABLE MOON_ORBIT (
    Pid INTEGER NOT NULL,
    Mid INTEGER NOT NULL,
    PRIMARY KEY (Pid, Mid),
    FOREIGN KEY (Pid) REFERENCES PLANET(Pid),
    FOREIGN KEY (Mid) REFERENCES MOON(Mid)
);

/* Entity Name:
Arsteroid
*/
DROP TABLE if exists ASTEROID;
CREATE TABLE ASTEROID (
    Aid INTEGER NOT NULL UNIQUE,
    Name VARCHAR(50) NOT NULL,
    Mass DOUBLE PRECISION(10,6) NOT NULL, 
    Diameter DOUBLE PRECISION(10,6) NOT NULL, 
    Rotation_period DOUBLE PRECISION(10,6) NOT NULL,
    PRIMARY KEY (Aid)
);

/* Entity Name:
Comet
*/
DROP TABLE if exists COMET;
CREATE TABLE COMET (
    Cid INTEGER NOT NULL UNIQUE,
    Name VARCHAR(50) NOT NULL,
    Mass DOUBLE PRECISION(10,6),
    PRIMARY KEY (Cid)
);

/* Relationship:
Monitors
*/
DROP TABLE if exists MONITORS;
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

/* Relationship:
Orbits
*/
DROP TABLE if exists ORBITS;
CREATE TABLE ORBITS (
    Aid INTEGER NOT NULL,
    Pid INTEGER NOT NULL,
    Sid INTEGER NOT NULL,
    PRIMARY KEY (Aid, Pid, Sid),
    FOREIGN KEY (Aid) REFERENCES ASTEROID(Aid),
    FOREIGN KEY (Pid) REFERENCES PLANET(Pid),
    FOREIGN KEY (Sid) REFERENCES STAR(Sid)
);

/* Relationship:
Collides
*/
DROP TABLE if exists COLLIDES;
CREATE TABLE COLLIDES (
    Pid INTEGER NOT NULL,
    Mid INTEGER NOT NULL,
    Aid INTEGER NOT NULL,
    PRIMARY KEY (Pid, Mid, Aid),
    FOREIGN KEY (Pid) REFERENCES PLANET(Pid),
    FOREIGN KEY (Mid) REFERENCES MOON(Mid),
    FOREIGN KEY (Aid) REFERENCES ASTEROID(Aid)
);

/* Planet data from: 
https://www.windows2universe.org/?page=/our_solar_system/planets_table.html
and
https://en.wikipedia.org/wiki/List_of_gravitationally_rounded_objects_of_the_Solar_System#endnote_Fnone
*/
INSERT INTO PLANET VALUES
(1,'Mercury',0.055,0.382,0.38,87.969,58.646225,0),
(2,'Venus',0.815,0.949,0.9,224.701,243.0187,0),
(3,'Earth',1,1,1,365.256363,0.99726968,0),
(4,'Mars',0.107,0.532,0.38,686.971,1.02595675,0),
(5,'Jupiter',318,11.209,2.64,4332.59,0.41354,0),
(6,'Saturn',95,9.44,0.93,10759.22,0.44401,0),
(7,'Uranus',14.5,4.007,0.89,30688.5,0.71833,0),
(8,'Neptune',17,3.883,1.12,60182,0.67125,0),
(9,'Pluto',0.0022,0.180,0.06,9090483.5,6.3872,1);

/* Satellite data from:
https://en.wikipedia.org/wiki/Category:Lists_of_satellites
*/
INSERT INTO ARTIFICIAL_SATELLITE VALUES
(1,'Aqua','USA'),
(2,'CALIPSO','France'),
(3,'Chollian-2A','South Korea'),
(4,'COSMO-SkyMed 4','Italy'),
(5,'NigeriaSat-1','Nigeria');

/* Satellite data from:
https://en.wikipedia.org/wiki/Category:Lists_of_satellites
*/
INSERT INTO SATELLITE_TASK VALUES
(1,'Carries six instruments to observe interactions among the four spheres for Earth systems: oceans, land, atmosphere, and biosphere.'),
(2,'Studies thickness of clouds and aerosols for understanding of how much air pollution is present and changes in compositions in the atmosphere.'),
(3,'Also known as Communication, Ocean and Meteorological Satellites (COMS). Used for communication, oceanography, and meteorological observation.'),
(4,'Used for defense and security assurance in Italy and other countries, seismic hazard analysis, environmental disaster monitoring, and agricultural mapping.'),
(5,'Part of the worldwide Disaster Monitoring Constellation System.');

/* 
Fictional data used for Alien Life values.
*/
INSERT INTO ALIEN_LIFE VALUES
(1,'Poleepkwa',1),
(2,'Ewok',1),
(3,'Vulcan',1),
(4,'Xenomorph',1),
(5,"Na'vi",1);

/*
Star data from:
https://en.wikipedia.org/wiki/List_of_gravitationally_rounded_objects_of_the_Solar_System
*/
INSERT INTO STAR VALUES
(1,'Sol',332978.9,3.828,109.3);

/* Moon data from: 
https://en.wikipedia.org/wiki/List_of_gravitationally_rounded_objects_of_the_Solar_System
*/
INSERT INTO MOON VALUES
(1,'Moon',3,0.272,0.1654,0.12),
(2,'Io',5,0.285,0.1831,0.63),
(3,'Ganymede',5,0.413,0.1456,0.43),
(4,'Dione',6,0.088,0.0236,0.998),
(5,'Mimas',6,0.031,0.00649,0.962);

/* Moon data from: 
https://en.wikipedia.org/wiki/List_of_gravitationally_rounded_objects_of_the_Solar_System
*/
INSERT INTO MOON_ORBIT VALUES
(3,1),
(5,2),
(5,3),
(6,4),
(6,5);

/* Asteroid data from: 
https://en.wikipedia.org/wiki/List_of_exceptional_asteroids
and fictionalized
*/
INSERT INTO ASTEROID VALUES
(1,'Ceres',0.939,0.00072,0.0046),
(2,'Psyche',0.223,0.0361,0.0051),
(3,'Elektra',0.453,0.0724,0.0855),
(4,'Hektor',0.648,0.00042,0.00005),
(5,'Vesta',0.525,0.00835,0.00245);

/* Comet data from: 
https://en.wikipedia.org/wiki/Great_comet#List_of_great_comets
*/
INSERT INTO COMET VALUES
(1,'Comet Skjellerup???Maristany',NULL),
(2,'Comet Halley',0.0638),
(3,'Comet Donati',NULL),
(4,'Coggia',NULL),
(5,'Comet Hale???Bopp',NULL);

/* Part 4: Sample Data */
SELECT * FROM ARTIFICIAL_SATELLITE ORDER BY RANDOM() LIMIT 5;
SELECT * FROM SATELLITE_TASK ORDER BY RANDOM() LIMIT 5;
SELECT * FROM ALIEN_LIFE ORDER BY RANDOM() LIMIT 5;
SELECT * FROM STAR ORDER BY RANDOM() LIMIT 5;
SELECT * FROM MOON ORDER BY RANDOM() LIMIT 5;
SELECT * FROM ASTEROID ORDER BY RANDOM() LIMIT 5;
SELECT * FROM COMET ORDER BY RANDOM() LIMIT 5;
SELECT * FROM PLANET ORDER BY RANDOM() LIMIT 5;
SELECT * FROM MOON_ORBIT ORDER BY RANDOM() LIMIT 5;
