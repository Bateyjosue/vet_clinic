/* Database schema to keep the structure of entire database. */

-- Create schema
create database vet_clinic;

-- Connect the database
\c vet_clinic;

-- Create animals Table
create table animals (id int GENERATED ALWAYS AS IDENTITY, name varchar(255), date_of_birth date, escape_attempts int, neutered boolean, weight_kg float, PRIMARY KEY (id));

create table owners (
  id int autoincrement PRIMARY KEY,
  full_name varchar(255),
  age int
)

-- Add column Spcies
alter table animals
add column species varchar(255);