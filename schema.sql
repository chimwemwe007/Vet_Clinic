
CREATE TABLE animals (
  id INT NOT NULL PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  date_of_birth DATE NOT NULL,
  escape_attempts INT NOT NULL,
  neutered BOOLEAN NOT NULL,
  weight_kg NUMERIC(5, 2) NOT NULL,
);
-- add species to animals table
ALTER TABLE animals
ADD COLUMN species VARCHAR(100);