CREATE DATABASE human_resource;

USE human_resource;

SELECT * FROM hr;

ALTER TABLE hr
CHANGE COLUMN ï»¿id emp_id TEXT NULL;

-- List column names and datatypes.alter
DESCRIBE hr;

-- 2. Explore  Birthdate column
SELECT birthdate FROM hr;

-- set sql safe updates to 0
SET sql_safe_updates = 0; 
SET GLOBAL sql_mode = 'NO_ENGINE_SUBSTITUTION';
SET SESSION sql_mode = 'NO_ENGINE_SUBSTITUTION';

-- birthdate has inconsistent date format, hence needs cleaning.
UPDATE hr
SET birthdate = CASE
	WHEN birthdate LIKE '%/%' THEN date_format(str_to_date(birthdate, '%m/%d/%Y'), '%Y-%m-%d')
	WHEN birthdate LIKE '%/%' THEN date_format(str_to_date(birthdate, '%m-%d-%Y'), '%Y-%m-%d')
    ELSE NULL
END;


SELECT * FROM hr;

 
 -- 3. change birthdate data type from text/string to date data type
 -- ===================================================================
 ALTER TABLE hr
 MODIFY COLUMN birthdate DATE;
 
 DESCRIBE hr;
 
 -- 4. Explore the hire_date column.alter
 -- ===================================== 
 SELECT hire_date From hr;
 
 -- hire_date has inconsistent date format, hence needs cleaning
 UPDATE hr
 SET hire_date = CASE
	WHEN hire_date LIKE '%/%' THEN date_format(str_to_date(hire_date, '%m/%d/%Y'), '%Y-%m-%d')
	WHEN hire_date LIKE '%-%' THEN date_format(str_to_date(hire_date, '%m-%d-%Y'), '%Y-%m-%d')
    ELSE NULL
END;

SELECT * FROM hr;
DROP TABLE hr;

SELECT * FROM hr;
DROP TABLE hr;

SELECT * FROM hr;

SELECT termdate FROM 

DESCRIBRE hr;

-- 7. change termdate data type from text/string to data type.alter
-- ================================================================
ALTER TABLE hr
MODIFY COLUMN termdate DATE;

DESCRIBE hr;

-- 8. Add a column for Age
-- =======================
ALTER TABLE hr ADD COLUMN age INT;

DESCRIBE hr;

UPDATE hr
SET age = timestampdiff(YEAR, birthdate, CURDATE());

SELECT age FROM hr;    
