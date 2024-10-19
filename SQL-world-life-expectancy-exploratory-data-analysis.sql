/* World life expectancy - Exploratory data analysis project by Virginia Herrero */

/* This project focuses on exploring the variables to find insightful information, patterns and trends. */

-- Use the desired schema
USE world_life_expectancy;

-- Select all the data from the previously cleaned dataset
SELECT *
FROM life_expectancy_staging;

/* UNIVARIATE EXPLORATION : This analysis consist of analyzing every variable individually. */

-- COUNTRY EXPLORATION
-- Number of unique countries 
-- This query calculates the count of distinct countries
SELECT COUNT(DISTINCT (Country)) AS `Total Amount of Countries`
FROM life_expectancy_staging;

-- YEAR EXPLORATION
-- Period of time
-- This query retrieves the period of time in which this data was recorded
SELECT MIN(`Year`), MAX(`Year`)
FROM life_expectancy_staging;

-- STATUS EXPLORATION
-- Types of status per country
-- This query obtains the unique status values of the countries
SELECT DISTINCT (`Status`)
FROM life_expectancy_staging;

-- Status distribution
-- This query calculates the count of developing countries
SELECT COUNT(DISTINCT (Country)) AS `Total Count Developing Countries`
FROM life_expectancy_staging
WHERE `Status` = "Developing";

-- This query calculates the count of developed countries
SELECT COUNT(DISTINCT (Country)) AS `Total Count Developed Countries`
FROM life_expectancy_staging
WHERE `Status` = "Developed";

-- LIFE EXPECTANCY EXPLORATION
-- Lowest life expectancy
-- This query obtains the lowest life expectancy in the dataset
SELECT MIN(`Life expectancy`) AS `Lowest Life Expectancy`
FROM life_expectancy_staging;

-- Info of the country with lowest life expectancy
-- This query selects country, year and status of the lowest expectancy value
SELECT Country, `Year`, `Status`, `Life expectancy`
FROM life_expectancy_staging
WHERE `life expectancy` =  ( SELECT MIN(`Life expectancy`) FROM life_expectancy_staging );

-- Highest life expectancy
-- This query obtains the highest life expectancy in the dataset
SELECT MAX(`Life expectancy`) AS `Highest Life Expectancy`
FROM life_expectancy_staging;

-- Info of the countries with highest life expectancy
-- This query selects countries, years and statuses of the highest expectancy value
SELECT Country, `Year`, `Status`, `Life expectancy`
FROM life_expectancy_staging
WHERE `Life expectancy` =  ( SELECT MAX(`Life expectancy`) FROM life_expectancy_staging );

-- Life expectancy range for each country
-- This query finds the minimum and maximum life expectancy for each country, and calculates the increase in life expectancy over a 15-year period
SELECT Country, MIN(`Life expectancy`) AS MIN_LE, MAX(`Life expectancy`) AS MAX_LE, ROUND(MAX(`Life expectancy`)-MIN(`Life expectancy`), 1) AS `Life Expectancy Increase` 
FROM life_expectancy_staging
GROUP BY Country
ORDER BY `Life Expectancy Increase` ASC;

-- Average life expectancy for each year
-- This query computes the average life expectancy globally for each year in the dataset
SELECT `Year`, ROUND(AVG(`Life expectancy`), 1) AS `AVG Life Expectancy`
FROM  life_expectancy_staging
GROUP BY `Year`
ORDER BY `Year`;

-- ADULT MORTALITY EXPLORATION
-- Top 5 countries with the highest adult mortality rate
-- This query select the top 5 countries with the highest adult mortality rate
SELECT Country, MAX(`Adult mortality`) AS `Highest Mortality Rate`
FROM life_expectancy_staging
GROUP BY Country
ORDER BY 2 DESC
LIMIT 5;

-- INFANT DEATHS EXPLORATION
-- Top 5 countries with the highest infant death rate
-- This query select the top 5 countries with the highest infant death rate
SELECT Country, MAX(`Infant deaths`) AS `Highest Infant Death Rate`
FROM life_expectancy_staging
GROUP BY Country
ORDER BY 2 DESC
LIMIT 5;

-- PERCENTAGE EXPENDITURE EXPLORATION
-- Lowest expenditure percentage with highest life expectancy
-- This query select the countries with the lowest expenditure percentage and highest life expectancy
SELECT Country, `Year`, `Status`, `Life expectancy`, `Percentage expenditure`
FROM life_expectancy_staging
WHERE `Percentage expenditure` =  ( SELECT MIN(`Percentage expenditure`)  FROM life_expectancy_staging )
ORDER BY 4 DESC
LIMIT 5;

-- Highest expenditure percentage with the highest life expectancy
-- This query select the country with the highest expenditure percentage and highest life expectancy
SELECT Country, `Year`, `Status`, `Life expectancy`, `Percentage expenditure`
FROM life_expectancy_staging
WHERE `Percentage expenditure` =  ( SELECT MAX(`Percentage expenditure`)  FROM life_expectancy_staging )
ORDER BY 4 DESC;

-- MEASLES EXPLORATION
-- Count of developed countries with measles
-- This query calculates the count of developed countries with Measles Cases
SELECT COUNT(DISTINCT(Country)) AS `Total Developed Countries with Measles`
FROM (
	SELECT Country, `Status`, `Measles`
	FROM life_expectancy_staging
	WHERE STATUS = "Developed"
	) AS Measles_Developed;

-- Top 5 developed countries with highest measles rate
-- This query retrieves the top 5 developed countries with most measles rate
SELECT Country, MAX(`Measles`) AS `Measles Rate`
FROM life_expectancy_staging
WHERE `Status` = "Developed"
GROUP BY Country
ORDER BY 2 DESC
LIMIT 5;
    
-- Count of developing countries with measles
-- This query calculates the count of developing countries with measles cases
SELECT COUNT(DISTINCT(Country)) AS `Total Developing Countries with Measles`
FROM (
	SELECT Country, `Status`, `Measles`
	FROM life_expectancy_staging
	WHERE `Status` = "Developing"
	) AS Measles_Developing;

-- Top 5 developing countries with highest measles rate
-- This query retrieves the top 5 developed countries with most measles cases
SELECT Country, MAX(`Measles`) AS `Measles Rate`
FROM life_expectancy_staging
WHERE `Status` = "Developing"
GROUP BY Country
ORDER BY 2 DESC
LIMIT 5;

-- BMI EXPLORATION
-- Highest BMI
-- This query retrieves all information for the highest BMI in the dataset
SELECT Country, `Year`, `Status`, `Life expectancy`, BMI
FROM life_expectancy_staging
WHERE BMI =  ( SELECT MAX(BMI) FROM life_expectancy_staging );
/* The highest BMI obtained is extremely high
   BMI values above 35 indicate extreme obesity
*/

-- BMI in Kiribati, the countri with highest BMI
/* Let's have a look at all the value for Kiribati
   All values are surprisingly high
*/
SELECT BMI, `Life expectancy`
FROM life_expectancy_staging
WHERE Country = "Kiribati"
ORDER BY 1 DESC;

-- BMI in countries with highest life expectancy 
-- This query select all contries with highest life expectancy and 
SELECT Country, BMI, `Life expectancy`
FROM life_expectancy_staging
WHERE `Life Expectancy` =  ( SELECT MAX(`Life Expectancy`) FROM life_expectancy_staging )
ORDER BY Country ASC;

/* The BMI values are unusually high for all the countries with high life expectancies
   Values above 35 BMI are considered extremely obese
   Portugal has an average BMI of its population very low (6.9)
   These unusual values indicates that something might be wrong with this column
*/

-- BMI in the country with lowest life expectancy
-- This query select all contries with highest life expectancy and 
SELECT Country, BMI, `Life expectancy`
FROM life_expectancy_staging
WHERE `life expectancy` =  ( SELECT MIN(`life expectancy`) FROM life_expectancy_staging )
ORDER BY Country ASC;

-- UNDER FIVE DEATHS EXPLORATION
-- Top 5 countries with highest under-five death rates
-- This query selects the top 5 countries with the highest under-five death rate
SELECT Country, MAX(`Under-five deaths`)
FROM life_expectancy_staging
GROUP BY Country
ORDER BY 2 DESC
LIMIT 5;

-- Top 5 countries with lowest under-five death rates
-- This query selects the top 5 countries with the lowest under-five death rate
SELECT Country, MIN(`Under-five deaths`)
FROM life_expectancy_staging
GROUP BY Country
ORDER BY 2 ASC
LIMIT 5;

-- POLIO EXPLORATION
-- Highest inmunization against polio
-- This query retrieves the countries with the highest inmunization rates against polio
SELECT Country, MAX(`Polio`) AS `MAX Polio Rate`
FROM (
	SELECT Country, `Polio`
	FROM life_expectancy_staging) AS Polio_per_country 
WHERE `Polio` =  ( SELECT MAX(`Polio`) FROM life_expectancy_staging )
GROUP BY Country;

-- Lowest inmunization rate against polio
-- This query shows the countries with the lowest inmunization rates against polio
SELECT Country, MIN(`Polio`) AS `MIN Polio Rate`
FROM (
	SELECT Country, `Polio`
	FROM life_expectancy_staging) AS Diphtheria_per_country 
WHERE `Polio` =  ( SELECT MIN(`Polio`) FROM life_expectancy_staging )
GROUP BY Country;

-- DIPHTHERIA EXPLORATION
-- Highest inmunization against diphtheria
-- This query retrieves the countries with the highest inmunization rates against diphtheria
SELECT Country, MAX(`Diphtheria`)
FROM (
	SELECT Country, `Diphtheria`
	FROM life_expectancy_staging) AS Diphtheria_per_country 
WHERE `Diphtheria` =  ( SELECT MAX(`Diphtheria`) FROM life_expectancy_staging )
GROUP BY Country;

-- Lowest inmunization rate against diphtheria
-- This query shows the countries with the lowest inmunization rates against diphtheria
SELECT Country, MIN(`Diphtheria`)
FROM (
	SELECT Country, `Diphtheria`
	FROM life_expectancy_staging) AS Diphtheria_per_country 
WHERE `Diphtheria` =  ( SELECT MIN(`Diphtheria`) FROM life_expectancy_staging )
GROUP BY Country;

-- HIV/AIDS EXPLORATION
-- Highest HIV/AIDS death rate
-- This query retrieves the country with the highest HIV/AIDS death rate
SELECT Country, MAX(`HIV/AIDS`) AS `Highest HIV/AIDS Rate`
FROM (
	SELECT Country, `HIV/AIDS`
	FROM life_expectancy_staging) AS HIV_per_country 
WHERE `HIV/AIDS` =  ( SELECT MAX(`HIV/AIDS`) FROM life_expectancy_staging )
GROUP BY Country;

-- Lowest HIV/AIDS death rate
-- This query shows the countries with the lowest HIV/AIDS death rates
SELECT Country, MIN(`HIV/AIDS`) AS `Lowest HIV/AIDS rate`
FROM (
	SELECT Country, `HIV/AIDS`
	FROM life_expectancy_staging) AS HIV_per_country 
WHERE `HIV/AIDS` =  ( SELECT MIN(`HIV/AIDS`) FROM life_expectancy_staging )
GROUP BY Country;

-- THINNESS 1-19 YEARS EXPLORATION
--
--
SELECT Country, MAX(`Thinness 1-19 years`) AS `Thinness 1-19 years`
FROM (
	SELECT Country, `Thinness 1-19 years`
	FROM life_expectancy_staging) AS Thiness_per_country 
WHERE `Thinness 1-19 years` =  ( SELECT MAX(`Thinness 1-19 years`) FROM life_expectancy_staging )
GROUP BY Country;

SELECT Country, MIN(`Thinness 1-19 years`) AS `Thinness 1-19 years`
FROM (
	SELECT Country, `Thinness 1-19 years`
	FROM life_expectancy_staging) AS Thiness_per_country 
WHERE `Thinness 1-19 years` =  ( SELECT MIN(`Thinness 1-19 years`) FROM life_expectancy_staging )
GROUP BY Country;