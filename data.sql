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

-- Insert Data in Specialization
insert into specializations (species_id, vets_id) values ((select id from species where name like 'Pokemon'), (select id from vets where name like 'William Tatcher'));

insert into specializations (species_id, vets_id) values ((select id from species where name like 'Digimon'), (select id from vets where name like 'Stephanie Mendez')), ((select id from species where name like 'Pokemon'), (select id from vets where name like 'Stephanie Mendez'));

insert into specializations (species_id, vets_id) values ((select id from species where name like 'Digimon'), (select id from vets where name like 'Jack Harkness'));

-- Insert Data in Visits Table
insert into Visits (animals_id, vets_id, date_of_visit) 
values 
((select id from animals where name like 'Agumon'), (select id from vets where name like 'William Tatcher'),'2020-05-24'), 
((select id from animals where name like 'Agumon'), (select id from vets where name like 'Stephanie Mendez'), '2020-06-22'), 
((select id from animals where name like 'Gabumon'), (select id from vets where name like 'Jack Harkness'), '2021-02-02'), 
((select id from animals where name like 'Pikachu'), (select id from vets where name like 'Maisy Smith'), '2020-01-05'),
((select id from animals where name like 'Pikachu'), (select id from vets where name like 'Maisy Smith'), '2020-03-08'),
((select id from animals where name like 'Pikachu'), (select id from vets where name like 'Maisy Smith'), '2020-05-14'),
((select id from animals where name like 'Devimon'), (select id from vets where name like 'Stephanie Mendez'), '2021-05-04'),
((select id from animals where name like 'Charmander'), (select id from vets where name like 'Jack Harkness'), '2021-02-24'),
((select id from animals where name like 'Plantmon'), (select id from vets where name like 'Maisy Smith'), '2019-12-21'),
((select id from animals where name like 'Plantmon'), (select id from vets where name like 'William Tatcher'), '2020-08-10'),
((select id from animals where name like 'Plantmon'), (select id from vets where name like 'Maisy Smith'), '2021-04-07'),
((select id from animals where name like 'Squirtle'), (select id from vets where name like 'Stephanie Mendez'), '2019-09-29'),
((select id from animals where name like 'Angemon'), (select id from vets where name like 'Jack Harkness'), '2020-10-03'),
((select id from animals where name like 'Angemon'), (select id from vets where name like 'Jack Harkness'), '2020-11-04'),
((select id from animals where name like 'Boarmon'), (select id from vets where name like 'Maisy Smith'), '2019-01-24'),
((select id from animals where name like 'Boarmon'), (select id from vets where name like 'Maisy Smith'), '2019-05-15'),
((select id from animals where name like 'Boarmon'), (select id from vets where name like 'Maisy Smith'), '2020-02-27'),
((select id from animals where name like 'Boarmon'), (select id from vets where name like 'Maisy Smith'), '2020-08-03'),
((select id from animals where name like 'Blossom'), (select id from vets where name like 'Stephanie Mendez'), '2020-05-24'),
((select id from animals where name like 'Blossom'), (select id from vets where name like 'William Tatcher'), '2021-01-11');



-- This will add 3.594.280 visits considering you have 10 animals, 4 vets, and it will use around ~87.000 timestamps (~4min approx.)
INSERT INTO visits (animals_id, vets_id, date_of_visit) SELECT * FROM (SELECT id FROM animals) animal_ids, (SELECT id FROM vets) vets_ids, generate_series('1980-01-01'::timestamp, '2021-01-01', '4 hours') visit_timestamp;

-- This will add 2.500.000 owners with full_name = 'Owner <X>' and email = 'owner_<X>@email.com' (~2min approx.)
insert into owners (full_name, email) select 'Owner ' || generate_series(1,2500000), 'owner_' || generate_series(1,2500000) || '@mail.com';



After explain analyze SELECT full_name, age, email FROM owners where email = 'owner_18327@mail.com';