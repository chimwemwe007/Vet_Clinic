/* Populate database with sample data. */
INSERT INTO
    animals (
        name,
        date_of_birth,
        escape_attempts,
        neutered,
        weight_kg
    )
VALUES
    (
        'Agumon',
        TO_DATE('2020-02-03', 'YYYY-MM-DD'),
        0,
        true,
        10.23
    );

INSERT INTO
    animals (
        name,
        date_of_birth,
        escape_attempts,
        neutered,
        weight_kg
    )
VALUES
    (
        'Gabumon',
        TO_DATE('2018-11-15', 'YYYY-MM-DD'),
        2,
        false,
        8
    );

INSERT INTO
    animals (
        name,
        date_of_birth,
        escape_attempts,
        neutered,
        weight_kg
    )
VALUES
    (
        'Pikachu',
        TO_DATE('2021-1-7', 'YYYY-MM-DD'),
        1,
        false,
        15.04
    );

INSERT INTO
    animals (
        name,
        date_of_birth,
        escape_attempts,
        neutered,
        weight_kg
    )
VALUES
    (
        'Devimon',
        TO_DATE('2017-5-12', 'YYYY-MM-DD'),
        5,
        true,
        11
    );

-- add more data into animals
INSERT INTO
    animals (
        name,
        date_of_birth,
        escape_attempts,
        neutered,
        weight_kg
    )
VALUES
    ('Charmander', '2020-02-08', 0, 'false', -11);

INSERT INTO
    animals (
        name,
        date_of_birth,
        escape_attempts,
        neutered,
        weight_kg
    )
VALUES
    ('Plantmon', '2021-11-15', 2, 'true', -5.7);

INSERT INTO
    animals (
        name,
        date_of_birth,
        escape_attempts,
        neutered,
        weight_kg
    )
VALUES
    ('Squirtle', '1993-04-02', 3, 'false', -12.13);

INSERT INTO
    animals (
        name,
        date_of_birth,
        escape_attempts,
        neutered,
        weight_kg
    )
VALUES
    ('Angemon', '2005-06-12', 1, 'true', -45);

INSERT INTO
    animals (
        name,
        date_of_birth,
        escape_attempts,
        neutered,
        weight_kg
    )
VALUES
    ('Boarmon', '2005-06-07', 7, 'true', 20.4);

INSERT INTO
    animals (
        name,
        date_of_birth,
        escape_attempts,
        neutered,
        weight_kg
    )
VALUES
    ('Blossom', '1998-10-13', 3, 'true', 17);

INSERT INTO
    animals (
        name,
        date_of_birth,
        escape_attempts,
        neutered,
        weight_kg
    )
VALUES
    ('Ditto', '2022-05-14', 4, 'true', 22);

-- insert data into owners table -- 
INSERT INTO
    owners (full_name, age)
VALUES
    ('Sam Smith', 34);

INSERT INTO
    owners (full_name, age)
VALUES
    ('Jennifer Orwell', 19);

INSERT INTO
    owners (full_name, age)
VALUES
    ('Bob', 45);

INSERT INTO
    owners (full_name, age)
VALUES
    ('Melody Pond', 77);

INSERT INTO
    owners (full_name, age)
VALUES
    ('Dean Winchester', 14);

INSERT INTO
    owners (full_name, age)
VALUES
    ('Jodie Whittaker', 38);

-- insert data into species table 
INSERT INTO
    species (name)
VALUES
    ('Pokemon');

INSERT INTO
    species (name)
VALUES
    ('Digimon');

-- All other animals are Pokemon -
UPDATE
    animals
SET
    species_id = 1;

-- If the name ends in "mon" it will be Digimon
UPDATE
    animals
SET
    species_id = 2
WHERE
    name LIKE '%mon';

-- Sam Smith owns Agumon.
UPDATE
    animals
SET
    owner_id = 1
WHERE
    name LIKE 'Agumon';

-- Jennifer Orwell owns Gabumon and Pikachu.
UPDATE
    animals
SET
    owner_id = 2
WHERE
    name LIKE 'Gabumon'
    OR name LIKE 'Pikachu';

-- Bob owns Devimon and Plantmon.
UPDATE
    animals
SET
    owner_id = 3
WHERE
    name IN ('Devimon', 'Plantmon');

-- Melody Pond owns Charmander, Squirtle, and Blossom.
UPDATE
    animals
SET
    owner_id = 4
WHERE
    name IN ('Charmander', 'Squirtle', 'Blossom');

-- Dean Winchester owns Angemon and Boarmon.
UPDATE
    animals
SET
    owner_id = 5
WHERE
    name IN ('Angemon', 'Boarmon');