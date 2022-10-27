/*Queries that provide answers to the questions from all projects.*/

-- Find all animals whose name ends in "mon".
select * from animals where name like '%mon';

-- List the name of all animals born between 2016 and 2019.
SELECT * FROM animals WHERE extract(isoyear from date_of_birth) BETWEEN 2016 AND 2019;

-- List the name of all animals that are neutered and have less than 3 escape attempts.
select * from animals where neutered is true and escape_attempts < 3;

-- List the date of birth of all animals named either "Agumon" or "Pikachu".
select date_of_birth from animals where name like 'Agumon' or name like 'Pikachu';

-- List name and escape attempts of animals that weigh more than 10.5kg
select name, escape_attempts from animals where weight_kg > 10.5;

-- Find all animals that are neutered.
select * from animals where neutered is true;

-- Find all animals not named Gabumon.
select * from animals where name not like 'Gabumon';

-- Find all animals with a weight between 10.4kg and 17.3kg (including the animals with the weights that equals precisely 10.4kg or 17.3kg)
select * from animals where weight_kg BETWEEN 10.4 and 17.3;

BEGIN;
  update animals set species = 'unspecified' where id > 0;
ROLLBACK;

BEGIN;
  update animals set species = 'digimon' where name like '%mon';
  update animals set species = 'pokemon' where  species is NULL;
COMMIT;

BEGIN;
  delete from animals where id > 0;
ROLLBACK;

BEGIN;
  delete from animals where date_of_birth > '2022-01-01';
SAVEPOINT DOB;
  update animals set weight_kg = (weight_kg * (-1)) where id > 0;
ROLLBACK TO DOB;
  update animals set weight_kg = (weight_kg * (-1)) where weight_kg < 0;
COMMIT;

-- How many animals are there?
  select count(*) from animals;
-- How many animals have never tried to escape?
  select count(*) from animals where escape_attempts = 0;
-- What is the average weight of animals?
  select avg(weight_kg) from animals;
-- Who escapes the most, neutered or not neutered animals?
select max(name) as name, escape_attempts from animals group by escape_attempts limit 1;
-- What is the minimum and maximum weight of each type of animal?
  select min(weight_kg), max(weight_kg) from animals;
-- What is the average number of escape attempts per animal type of those born between 1990 and 2000?

select avg(escape_attempts) from animals where extract(isoyear from  date_of_birth) between 1990 and 2000;

 select * from animals as a join owners as o on a.owner_id = o.id where o.full_name like 'Melody Pond';

select * from animals as a join owners as o on a.owner_id = o.id join species as s on a.species_id = s.id where s.name like 'Pokemon';

select * from owners as o left join animals as a on o.id = a.owner_id; 

select count(species_id), s.name from animals as a join species as s on a.species_id = s.id group by (a.species_id, s.name);

select * from animals as a inner join owners as o on a.owner_id = o.id inner join species as s on a.species_id = s.id where s.name like 'Digimon' and o.full_name like 'Jennifer Orwell';

 select * from animals as a inner join owners as o on a.owner_id = o.id  where o.full_name like 'Dean Winchester' and a.escape_attempts = 0;

 select count(a.owner_id) as count, o.full_name from animals as a inner join owners as o on a.owner_id = o.id group by (a.owner_id, o.full_name)order by count desc limit 1;