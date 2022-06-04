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
 *
 */

CREATE TABLE ARTIFICIAL_SATELLITE ( 
    Satid INTEGER NOT NULL,
    Sat_name VARCHAR(50) NOT NULL, /* Do all Artificial Satellites have names? */
    Country_origin VARCHAR(50) NOT NULL,
    Task VARCHAR(50) NOT NULL,
    PRIMARY KEY (Satid)
);

CREATE TABLE MONITORS (
    Cid INTEGER NOT NULL,
    Aid INTEGER NOT NULL,
    Mid INTEGER NOT NULL,
    Satid INTEGER NOT NULL,
    Alien_name VARCHAR(50) NOT NULL,
    Sid INTEGER NOT NULL,
    Pid INTEGER NOT NULL,
    PRIMARY KEY (Cid, Aid, Mid, Satid, Alien_name, Sid, Pid);
    FOREIGN KEY (Cid) REFERENCES COMET(Cid),
    FOREIGN KEY (Aid) REFERENCES ASTEROID(Aid),
    FOREIGN KEY (Mid) REFERENCES MOON(Mid),
    FOREIGN KEY (Satid) REFERENCES ARTIFICIAL_SATELLITE(Satid),
    FOREIGN KEY (Alien_name) REFERENCES ALIEN_LIFE(Alien_name),
    FOREIGN KEY (Sid) REFERENCES STAR(Sid),
    FOREIGN KEY (Pid) REFERENCES PLANET(Pid),
);

CREATE TABLE ORBITS (
    Aid INTEGER NOT NULL,
    Pid INTEGER NOT NULL,
    Sid INTEGER NOT NULL,
    PRIMARY KEY (Aid, Pid, Sid);
    FOREIGN KEY (Aid) REFERENCES ASTEROID(Aid),
    FOREIGN KEY (Pid) REFERENCES PLANET(Pid),
    FOREIGN KEY (Sid) REFERENCES STAR(Sid),
);

CREATE TABLE COLLIDES (
    Pid INTEGER NOT NULL,
    Mid INTEGER NOT NULL,
    Aid INTEGER NOT NULL,
    PRIMARY KEY (Pid, Mid, Aid);
    FOREIGN KEY (Pid) REFERENCES PLANET(Pid),
    FOREIGN KEY (Mid) REFERENCES MOON(Mid),
    FOREIGN KEY (Aid) REFERENCES ASTEROID(Aid),
);

DROP TABLE ARTIFICIAL_SATELLITE;
DROP TABLE MONITORS;
DROP TABLE ORBITS;
DROP TABLE COLLIDES;

