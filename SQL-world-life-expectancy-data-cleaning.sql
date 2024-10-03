/*  World life expectancy - Data cleaning project by Virginia Herrero */

/*	This project focuses on cleaning and preparing the dataset for further analysis. 
	The cleaning process entails removing duplicate data, populating missing values in key columns and ensuring the overall integrity of the dataset. 
	The cleaned data will provide more accurate and insightful analysis, leading to a better understanding of global health trends and differences.
*/

/*	----- DATA LOADING ----- */

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

/*	----- DATA STAGING ----- */
/*	This step is essential to ensure that the original data is not modified or deleted by mistake. */

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

/*	----- DUPLICATES -----*/

-- Identify duplicate values based on Country, Year, and Status
-- This query finds records where country, year and status is repeated
SELECT Country, COUNT(Country), `Year`, COUNT(`Year`), `Status`, COUNT(`Status`)
FROM life_expectancy_staging
GROUP BY Country, `Year`, `Status`
HAVING COUNT(Country) > 1 AND COUNT(`Year`) > 1 AND COUNT(`Status`) > 1;

-- Select rows based on Row Id rows which are not duplicates
-- This query selects the minimum value of the Row ID for the combinations of Country, Year and Status
-- This query does not retrive the duplicate values
SELECT MIN(`Row ID`)
FROM life_expectancy_staging
GROUP BY CONCAT(Country, `Year`, `Status`);

-- Delete duplicates
-- This query selects the duplicated values retrieved by the previous query and deletes them
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

