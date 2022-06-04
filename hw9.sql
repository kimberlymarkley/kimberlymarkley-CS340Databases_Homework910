/* Homework 9
 * Name: Melissa Swearingen & Kimberly Markley
 *
 * SQL Schema for homework 9.
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

CREATE TABLE "ARTIFICIAL_SATELLITE"
    (
        Satid INTEGER NOT NULL PRIMARY KEY,
        Sat_name VARCHAR(50) NOT NULL, /* Do all Artificial Satellites have names? */
        Country_origin VARCHAR(50) NOT NULL,
        Task VARCHAR(50) NOT NULL,
    );


