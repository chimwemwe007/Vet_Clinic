/* Database schema to keep the structure of entire database. */
CREATE TABLE animals (
    id INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(250),
    date_of_birth Date,
    escape_attempts INT,
    neutered boolean,
    weight_kg decimal,
    PRIMARY KEY(id)
);

-- add species to animals table
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

-- add vets table 
CREATE TABLE vets (
    id INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(250),
    age INT,
    date_of_graduation DATE,
    PRIMARY KEY(id)
);

-- add specializations table
CREATE TABLE specializations (
    vet_id INT,
    species_id INT,
    FOREIGN KEY (vet_id) REFERENCES vets(id),
    FOREIGN KEY (species_id) REFERENCES species (id),
    PRIMARY KEY (vet_id, species_id)
);

-- add visits table
CREATE TABLE visits (
    animal_id INT,
    vet_id INT,
    visit_date DATE,
    FOREIGN KEY (animal_id) REFERENCES animals (id),
    FOREIGN KEY (vet_id) REFERENCES vets (id)
);