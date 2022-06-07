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

/* all size data is relative to Earth, and all time 
measurement is relative to Earth's day length
*/

DROP TABLE if exists ARTIFICIAL_SATELLITE;
CREATE TABLE ARTIFICIAL_SATELLITE ( 
    Satid INTEGER NOT NULL,
    Sat_name VARCHAR(50) NOT NULL,
    Country_origin VARCHAR(50) NOT NULL,
    Task VARCHAR(50) NOT NULL,
    PRIMARY KEY (Satid)
);

DROP TABLE if exists SATELLITE_TASKS;
CREATE TABLE SATELLITE_TASKS (
    Satid INTEGER NOT NULL,
    Task VARCHAR(50) NOT NULL,
    PRIMARY KEY (Satid, Task),
    FOREIGN KEY (Satid) REFERENCES ARTIFICIAL_SATELLITE(Satid) ON DELETE CASCADE
);

DROP TABLE if exists ALIEN_LIFE;
CREATE TABLE ALIEN_LIFE (
    Satid INTEGER NOT NULL,
    Alien_name VARCHAR(50) NOT NULL,
    Sentient BOOLEAN NOT NULL,
    PRIMARY KEY (Satid, Alien_name),
    FOREIGN KEY (Satid) REFERENCES ARTIFICIAL_SATELLITE(Satid)
);

DROP TABLE if exists STAR;
CREATE TABLE STAR (
    Sid INTEGER NOT NULL,
    Star_name VARCHAR(50) NOT NULL,
    Mass DOUBLE PRECISION(10,6) NOT NULL,
    Luminosity DOUBLE PRECISION(10,6) NOT NULL,
    Radius DOUBLE PRECISION(10,6) NOT NULL,
    PRIMARY KEY (Sid)
);

DROP TABLE if exists PLANET;
CREATE TABLE PLANET (
    Pid INTEGER NOT NULL,
    Planet_name VARCHAR(50) NOT NULL,
    Mass DOUBLE PRECISION(10,6) NOT NULL,
    Diameter DOUBLE PRECISION(10,6) NOT NULL,
    Gravity DOUBLE PRECISION(10,6) NOT NULL,
    Orbital_period DOUBLE PRECISION(10,6) NOT NULL,
    Day_length DOUBLE PRECISION(10,6) NOT NULL,
    Dwarf_planet TINYINT(1) NOT NULL DEFAULT 0,
    PRIMARY KEY (Pid)
);

DROP TABLE if exists MOON;
CREATE TABLE MOON (
    Mid INTEGER NOT NULL,
    Moon_name VARCHAR(50) NOT NULL,
    Pid INTEGER NOT NULL,
    Mass DOUBLE PRECISION(10,6) NOT NULL,
    Radius DOUBLE PRECISION(10,6) NOT NULL,
    Gravity DOUBLE PRECISION(10,6) NOT NULL,
    Albedo DOUBLE PRECISION(10,6) NOT NULL,
    PRIMARY KEY (Mid),
    FOREIGN KEY (Pid) REFERENCES PLANET(Pid)
);

DROP TABLE if exists MOON_ORBITS;
CREATE TABLE MOON_ORBITS (
    Pid INTEGER NOT NULL,
    Mid INTEGER NOT NULL,
    PRIMARY KEY (Pid, Mid),
    FOREIGN KEY (Pid) REFERENCES PLANET(Pid),
    FOREIGN KEY (Mid) REFERENCES MOON(Mid)
);

DROP TABLE if exists ASTEROID;
CREATE TABLE ASTEROID (
    Aid INTEGER NOT NULL,
    Name VARCHAR(50) NOT NULL,
    Mass DOUBLE PRECISION(10,6) NOT NULL, 
    Diameter DOUBLE PRECISION(10,6) NOT NULL, 
    Rotation_period DOUBLE PRECISION(10,6) NOT NULL,
    PRIMARY KEY (Aid)
);

DROP TABLE if exists COMET;
CREATE TABLE COMET (
    Cid INTEGER NOT NULL,
    Name VARCHAR(50) NOT NULL,
    Mass DOUBLE PRECISION(10,6) NOT NULL,
    PRIMARY KEY (Cid)
);

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

/* Satellite data from links here:
https://en.wikipedia.org/wiki/Category:Lists_of_satellites
*/
INSERT INTO ARTIFICIAL_SATELLITE VALUES
(1,'Aqua','USA','Carries six instruments to observe interactions among the four spheres for Earth systems: oceans, land, atmosphere, and biosphere.'),
(2,'CALIPSO','France','Studies thickness of clouds and aerosols for understanding of how much air pollution is present and changes in compositions in the atmosphere.'),
(3,'Chollian-2A','South Korea','Also known as Communication, Ocean and Meteorological Satellites (COMS). Used for communication, oceanography, and meteorological observation.'),
(4, 'COSMO-SkyMed 4','Italy','Used for defense and security assurance in Italy and other countries, seismic hazard analysis, environmental disaster monitoring, and agricultural mapping.'),
(5, 'NigeriaSat-1','Nigeria','Part of the worldwide Disaster Monitoring Constellation System.');
