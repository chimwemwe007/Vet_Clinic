SELECT * FROM animals WHERE name LIKE '%mon';

SELECT * FROM animals WHERE date_of_birth BETWEEN date '2016-01-01' AND date '2019-01-01';

SELECT * FROM animals WHERE neutered=true AND escape_attempts < 3;

SELECT date_of_birth FROM animals WHERE name='Pikachu' OR name='Agumon';

SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;

SELECT * FROM animals WHERE neutered=true;

SELECT * FROM animals WHERE NOT name='Gabumon';

SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3;

-- UPDATES
BEGIN;
UPDATE animals SET species = 'unspecified';
ROLLBACK;

-- species 'digimon' for animals ending with 'mon'

UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon';

-- species 'pokemon' where no species is specified
UPDATE animals SET species = 'pokemon' WHERE species IS NULL;

-- delete all rows in table
BEGIN;
DELETE FROM animals;
ROLLBACK;

-- new transaction
BEGIN;
-- delete animals born after JAN 1st 2022
DELETE FROM animals WHERE date_of_birth > date '2022-01-01';
-- CREATE SAVEPOINT FOR THE TRANSACTION
SAVEPOINT weight_changes;
-- Update all animals' weight to be their weight multiplied by -1.
UPDATE animals SET weight_kg = weight_kg * -1;
-- Rollback to the savepoint
ROLLBACK TO weight_changes;
-- Update weight for negative values
UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;
-- commit
COMMIT;

-- QUERIES TO QUESTIONS
-- Number of animals
SELECT COUNT(*) FROM animals;
-- Animals with zero escape attempts
SELECT COUNT(escape_attempts) FROM animals WHERE escape_attempts = 0;
-- Average weight of all animals
SELECT AVG(weight_kg) FROM animals;
-- who escapes the most
SELECT name FROM animals WHERE escape_attempts = (SELECT MAX(escape_attempts) FROM animals);
-- minimum weight
SELECT MIN(weight_kg) FROM animals;
-- maximum weight
SELECT MAX(weight_kg) FROM animals;
-- Average escape attempts for specific animals
SELECT AVG(escape_attempts) FROM animals WHERE date_of_birth BETWEEN date '1990-01-01' AND date '2000-01-01';