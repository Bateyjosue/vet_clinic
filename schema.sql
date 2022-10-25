/* Database schema to keep the structure of entire database. */

-- Create schema
create database vet_clinic;

-- Connect the database
\c vet_clinic;

-- Create animals Table
create table animals (id int GENERATED ALWAYS AS IDENTITY, name varchar(255), date_of_birth date, escape_attempts int, neutered boolean, weight_kg float, PRIMARY KEY (id));