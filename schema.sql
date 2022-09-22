CREATE TABLE animals (
    id INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(250),
    date_of_birth Date,
    escape_attempts INT,
    neutered boolean,
    weight_kg decimal,
    PRIMARY KEY(id)
);

-- add species to animals table --
ALTER TABLE
    animals
ADD
    COLUMN species VARCHAR(250);

-- add new table owners
CREATE TABLE owners (
    id INT GENERATED ALWAYS AS IDENTITY,
    full_name VARCHAR(250),
    age INT,
    PRIMARY KEY(id)
);

-- add new table species 
CREATE TABLE species (
    id INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(250),
    PRIMARY KEY(id)
);

-- update animals table 
ALTER TABLE
    animals DROP COLUMN species;

ALTER TABLE
    animals
ADD
    COLUMN species_id INT,
ADD
    CONSTRAINT species_key FOREIGN KEY (species_id) REFERENCES species(id);

ALTER TABLE
    animals
ADD
    COLUMN owner_id INT,
ADD
    CONSTRAINT owner_key FOREIGN KEY (owner_id) REFERENCES owners(id);
Footer
© 2022 GitHub, Inc.
Footer navigation
Terms
Privacy
Security
Status
Docs
