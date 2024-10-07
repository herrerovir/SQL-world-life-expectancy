/* World life expectancy - Data cleaning project by Virginia Herrero */

/* This project focuses on cleaning and preparing the dataset for further analysis. 
   The cleaning process entails removing duplicate data, populating missing values in key columns and ensuring the overall integrity of the dataset. 
   The cleaned data will provide more accurate and insightful analysis, leading to a better understanding of global health trends and differences.
*/

-- DATA LOADING
-- Create schema
CREATE SCHEMA world_life_expectancy;

-- Use the newly created schema
USE world_life_expectancy;
 
-- Create a new table in the schema
CREATE TABLE `life_expectancy`(
`Country` TEXT, 
`Year` INT, 
`Status` TEXT, 
`Life expectancy` TEXT, 
`Adult mortality` INT, 
`Infant deaths` INT, 
`Percentage expenditure` DOUBLE,
`Measles` INT, 
`BMI` DOUBLE, 
`Under-five deaths` INT, 
`Polio` INT, 
`Diphtheria` INT, 
`HIV/AIDS` DOUBLE, 
`GDP` INT,
`Thinness 1-19 years` DOUBLE, 
`Thinness 5-9 years` DOUBLE, 
`Schooling` DOUBLE, 
`Row ID` INT
);

-- Load the data from the csv file into the table just created
LOAD DATA INFILE "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/World-life-expectancy.csv"
INTO TABLE life_expectancy
FIELDS TERMINATED BY ","
ENCLOSED BY '"'
LINES TERMINATED BY "\n"
IGNORE 1 ROWS;

-- Select all the data from the table to check if the dataset has been loaded correctly
SELECT *
FROM life_expectancy;

-- Describe the datasest
DESCRIBE life_expectancy;

-- DATA STAGING
-- This step is essential to ensure that the original data is not modified or deleted by mistake
-- Create staging table
CREATE TABLE life_expectancy_staging
LIKE life_expectancy;

-- Insert the data from the original table into the staging table
INSERT life_expectancy_staging
SELECT * 
FROM life_expectancy;

-- Show all the data from the staging table to check everything is copied correctly
SELECT *
FROM life_expectancy_staging;

-- DUPLICATES
-- Identify duplicate values based on Country, Year, and Status
-- This query finds records where country, year and status is repeated
SELECT Country, COUNT(Country), `Year`, COUNT(`Year`), `Status`, COUNT(`Status`)
FROM life_expectancy_staging
GROUP BY Country, `Year`, `Status`
HAVING COUNT(Country) > 1 AND COUNT(`Year`) > 1 AND COUNT(`Status`) > 1;

-- Select rows based on the Row Id column which are not duplicated
-- This query selects the minimum value of the Row ID for the ows containin a combination of Country, Year and Status
-- This query does not retrive the duplicate values
SELECT MIN(`Row ID`)
FROM life_expectancy_staging
GROUP BY CONCAT(Country, `Year`, `Status`);

-- Delete duplicates
-- This query selects the duplicated values not retrieved by the previous query and deletes them
DELETE 
FROM life_expectancy_staging
WHERE `Row ID` NOT IN
(
	SELECT `Row ID`
	FROM 
	(
		SELECT MIN(`Row ID`) as `Row ID`
		FROM life_expectancy_staging
		GROUP BY CONCAT(Country, `Year`, `Status`)
	) AS duplicate_rows
);

-- NULL VALUES
-- Select null, blank or zero values in the life expectancy column
SELECT * 
FROM life_expectancy_staging
WHERE `life expectancy` IS NULL
	OR `life expectancy` = ""
    OR `life expectancy` = 0;

-- Populate blank values in the life expectancy column
-- This query calculates the average life expectancy of the blank values from the previous and following years
SELECT t1.Country, t1.YEAR, t1.`life expectancy`, 
       t2.Country, t2.YEAR, t2.`life expectancy`,
       t3.Country, t3.YEAR, t3.`life expectancy`,
       ROUND((t2.`life expectancy` + t3.`life expectancy`)/2,1)
FROM life_expectancy_staging AS t1
JOIN life_expectancy_staging AS t2
    ON t1.Country = t2.Country
    AND t1.YEAR = t2.YEAR -1
JOIN life_expectancy_staging AS t3
    ON t1.Country = t3.Country
    AND t1.YEAR = t3.YEAR +1
WHERE t1.`life expectancy` = "";   

-- Update blank Life Expectancy values with average values
-- This query updates the table with the new average values calculated in the previous query
UPDATE life_expectancy_staging AS t1
JOIN life_expectancy_staging AS t2
    ON t1.Country = t2.Country
    AND t1.YEAR = t2.YEAR -1
JOIN life_expectancy_staging AS t3
    ON t1.Country = t3.Country
    AND t1.YEAR = t3.YEAR +1
SET t1.`life expectancy` = ROUND((t2.`life expectancy` + t3.`life expectancy`)/2,1)
WHERE t1.`life expectancy` = "";

-- Delete life expectancy values that are zero
-- This query eliminates rows with life expectancy values 0 since they do not offer any insight for this study
DELETE
FROM life_expectancy_staging
WHERE `life expectancy`= 0;

-- Select null or blank values in the Status column
-- This query selects all rows with a blank Status
SELECT * 
FROM life_expectancy_staging
WHERE `Status` IS NULL
	OR `Status` = "";

-- Select unique Status values that are not blank
-- This query retrieves all unique Status values to be able to populate blank values correctly
SELECT DISTINCT `Status`
FROM life_expectancy_staging
WHERE `Status` <> "";

-- Show countries with status as "Developing"
-- This query shows all countries with  Status as "Developing"
SELECT DISTINCT Country
FROM life_expectancy_staging
WHERE `Status` = "Developing";

-- Update blank Status values to "Developing"
-- This query updates records with blank Status to "Developing" for countries that already have a "Developing" status 
UPDATE life_expectancy_staging t1
JOIN life_expectancy_staging t2
    ON t1.Country = t2.Country
SET t1.`Status` = "Developing"
WHERE t1.`Status` = ""
AND t2.`Status` <> ""
AND t2.`Status` = "Developing";

-- Select all values for "United States of America"
-- The purpose of this query is to check that all blank values are updated
SELECT * 
FROM life_expectancy_staging
WHERE Country = "United States of America";

-- Update blank Status values to "Developed"
-- This query updates records with blank Status to "Developed" for countries that already have a "Developed" status
UPDATE life_expectancy_staging t1
JOIN life_expectancy_staging t2
    ON t1.Country = t2.Country
SET t1.`Status` = "Developed"
WHERE t1.`Status` = ""
AND t2.`Status` <> ""
AND t2.`Status` = "Developed";

