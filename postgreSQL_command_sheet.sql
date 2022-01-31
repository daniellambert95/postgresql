createdb -h localhost -- createdb -h <db_name>
psql -h localhost  -- psql -h <db_name>


-- Creating DB and Connecting
--
DROP DATABASE IF EXISTS file_name;
CREATE DATABASE file_name;

\c file_name

CREATE TABLE table_name (
    first_name VARCHAR(40),
    last_name VARCHAR(40),
    date_of_birth TIMESTAMP,
    instrument varchar(100)
);
--

CREATE DATABASE vehicles;

-- \l to list databases
-- \c vehicles (to connect to database)

CREATE TABLE car_model (
name
varchar(25),
make
varchar(25),
year_of_checkin
varchar(20),
engine_type
varchar(50),
stock
integer
);

-- \d table_name to show table

-- Adding column
ALTER TABLE car_model
ADD COLUMN number_of_doors integer;

-- Changing column name
ALTER TABLE car_model
RENAME year_of_checkin TO year_of_manufacture;

-- Changing column row type
ALTER TABLE car_model 
ALTER COLUMN year_of_manufacture
TYPE integer USING (year_of_manufacture::integer);

-- Deleting column
ALTER TABLE car_model
DROP COLUMN year_of_manufacture CASCADE; 


-- Will show all items in the table
SELECT * FROM car_model;


-- Will show the first 10 items in the table
SELECT * FROM car_model
LIMIT 10;


-- Will sort table order by column name in ascending or descending order
SELECT * FROM car_model
WHERE BY date_of_birth ASC;

SELECT * FROM car_model
WHERE BY date_of_birth DESC;


-- Delete rows of data with conditionals
DELETE FROM musician 
WHERE first_name = 'Jimmy' AND last_name = 'Hendrix';


-- Order by conditional with a limit
SELECT * FROM musician
ORDER BY date_of_birth DESC LIMIT 10;


-- Setting a column value to 'xyz' with a conditional
UPDATE musician 
SET instrument = 'Saxophone'
WHERE instrument = 'Guitar';


-- Setting the instrument for a specific person
UPDATE musician 
SET instrument = 'Piano'
WHERE first_name = 'Bernhard' AND last_name = 'Schwarzenegger';


-- Showing a specific column
SELECT instrument FROM musician           
WHERE first_name = 'Bernhard' AND last_name = 'Schwarzenegger';


-- Select multiple columns with subquery
SELECT last_name, date_of_birth FROM musician
WHERE first_name = 'Araceli';


-- Selecting Guitar/Piano players and ordering by instrument, last_name
SELECT first_name, last_name, instrument FROM musician
WHERE instrument = 'Guitar' OR instrument = 'Piano'
ORDER BY instrument, last_name;


-- Slecting 3 youngest piano/guitar players
SELECT * FROM musician
WHERE first_name = 'Araceli' AND instrument = 'Piano'
OR first_name = 'Araceli' AND instrument = 'Guitar'
ORDER BY date_of_birth DESC LIMIT 3;


-- Listing all different data in a table with DISTINCT
SELECT DISTINCT instrument FROM musician
ORDER BY instrument;


-- Showing 4th youngest Harp player whos name starts with M
-- Showing 3 columns and changing name of each column with AS
SELECT first_name AS "Name", last_name AS "Family Name", date_of_birth AS "Date of birth" FROM musician
WHERE last_name LIKE 'M%' AND instrument = 'Harp'
ORDER BY date_of_birth DESC LIMIT 1 OFFSET 3;


-- Showing list that does not contain names that start with xyz
-- Ordering by last and then first name showing rows 5 - 10
SELECT * FROM musician
WHERE last_name NOT LIKE 'Y%'
AND last_name NOT LIKE 'M%'
AND last_name NOT LIKE 'C%'
AND last_name NOT LIKE 'A%'
ORDER BY last_name, first_name
OFFSET 5 LIMIT 5;


-- Selecting all data that has  x,y,z in instrument column
SELECT * FROM musician
WHERE instrument IN ('Guitar', 'Saxophone', 'Cello', 'Violin', 'Harp');

-- Delete all rows from a table
TRUNCATE table_name;