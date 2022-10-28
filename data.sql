/* Populate database with sample data. */

insert into animals(name, date_of_birth, escape_attempts, neutered, weight_kg) values ('Agumon', '2020-02-03', 0, true, 10.23);
insert into animals(name, date_of_birth, escape_attempts, neutered, weight_kg) values ('Gabumon', '2018-11-15', 2, true, 8), ('Pikachu', '2021-01-07', 1, false, 15.04); 
insert into animals(name, date_of_birth, escape_attempts, neutered, weight_kg) values ('Devimon', '2017-05-12', 5, true, 11); 

-- Newly Insertion
insert into animals (name, date_of_birth, escape_attempts, neutered, weight_kg) values ('Charmander','2020-02-08', 0, false, -11), ('Plantmon','2021-11-15', 2, true, -5.7), ('Squirtle','1993-04-02', 3, false, -12.13), ('Angemon','2005-06-12', 1, true, -45), ('Boarmon','2005-06-07', 7, true, 20.4), ('Blossom','1998-10-13', 3, true, 17), ('Ditto','2022-05-14', 4, true, 22);

insert into owners (full_name, age) values ('Sam Smith', 34), ('Jennifer Orwell', 19), ('Bob', 45), ('Melody Pond', 77), ('Dean Winchester', 14), ('Jodie Whittaker', 38);

insert into species ('Pokemon'), ('Digimon');

update animals set species_id = (select id from species where name like 'Digimon' limit 1) where name like '%mon';

update animals set species_id = (select id from species where name like 'Pokemon' limit 1) where name not like '%mon';

update animals set owner_id = (select id from owners where full_name like 'Sam Smith') where name like 'Agumon';
update animals set owner_id = (select id from owners where full_name like 'Jennifer Orwell') 
where name like 'Gabumon' or name like 'Pikachu';

update animals set owner_id = (select id from owners where full_name like 'Bob') 
where name like 'Devimon' or name like 'Plantmon';

update animals set owner_id = (select id from owners where full_name like 'Melody Pond') 
where name like 'Charmander' or name like 'Squirtle' or name like 'Blossom';

update animals set owner_id = (select id from owners where full_name like 'Dean Winchester') 
where name like 'Angemon' or name like 'Boarmon';

-- Insert Data in Vets
insert into vets (name, age, date_of_graduation) values ('William Tatcher', 45, '2000-04-23'), ('Maisy Smith', 26, '2019-01-17'), ('Stephanie Mendez', 64, '1981-04-04'), ('Jack Harkness', 38, '2008-06-08');