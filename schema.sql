/* Database schema to keep the structure of entire database. */

-- Create schema
create database vet_clinic;

-- Connect the database
\c vet_clinic;

-- Create animals Table
create table animals (id int GENERATED ALWAYS AS IDENTITY, name varchar(255), date_of_birth date, escape_attempts int, neutered boolean, weight_kg float, PRIMARY KEY (id));

create table owners (
  id serial PRIMARY KEY,
  full_name varchar(255),
  age int
);

create table species (
  id serial primary key,
  name varchar(255)
);

-- Add column Spcies
alter table animals
add column species varchar(255);

alter table animals
drop species;

alter table animals
add column species_id int references species(id);

alter table animals
add column owner_id int references owners(id);

create table vets(id serial primary key, name varchar(255), age int, date_of_graduation date);
create table specializations (
  species_id int references species(id),
  vets_id int references vets(id)
);

create table visits (
  animals_id int references animals(id),
  vets_id int references vets(id),
  date_of_visit date
);

alter table owners add column email varchar(120);