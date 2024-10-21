# 👴🏻 Worldwide life expectancy: data cleaning and exploratory analysis

This repository contains a data cleaning project and an exploratory analysis of global life expectancy data using SQL. 

## Table of content
 - [Intro](https://github.com/herrerovir/SQL-world-life-expectancy/blob/main/README.md#Introduction)
 - [Goal](https://github.com/herrerovir/SQL-world-life-expectancy/blob/main/README.md#Goal)
 - [Project Overview](https://github.com/herrerovir/SQL-world-life-expectancy/blob/main/README.md#Project-Overview)
 - [Dependencies](https://github.com/herrerovir/SQL-world-life-expectancy/blob/main/README.md#Dependencies)
 - [Technical skills](https://github.com/herrerovir/SQL-world-life-expectancy/blob/main/README.md#Technical-skills)
 - [Data set](https://github.com/herrerovir/SQL-world-life-expectancy/blob/main/README.md#Data-set)
 - [Data Cleaning](https://github.com/herrerovir/SQL-world-life-expectancy/blob/main/README.md#Data-cleaning)
 - [Data Exploration](https://github.com/herrerovir/SQL-world-life-expectancy/blob/main/README.md#Data-exploration)
 - [Insights](https://github.com/herrerovir/SQL-world-life-expectancy/blob/main/README.md#Insights)

## Introduction
This project consists of performing an analysis of life expectancy and the multiple factors that influence it using SQL to find relevant and meaningful information. 

The workflow of this analysis comprises the following steps: creation of the database, loading the data into MySQL Workbench, data cleaning and data exploration using MySQL's powerful queries.

## Goal
The main objective of this project is to perform an exploratory data analysis to obtain all relevant information on life expectancy around the world, as well as the factors that have an influence on it.

First, the data must be properly loaded into MySQL Workbench and carefully preprocessed for further analysis.

Through data exploration, it is expected to find answers to the following points:

* Lowest and highest life expectancy
* Increase in life expectancy over the last 15 years 
* Average life expectancy per year in the last 15 years
* Overview of factors influencing life expectancy
* Impact of other factors on life expectancy:
    - Relationship between the state of development of the country and life expectancy
    - Relationship between adult mortality and life expectancy
    - Relationship between healthcare expenditure and life expectancy
    - Relationship between GDP and life expectancy
    - Relationship between measles and life expectancy
    - Relationship between HIV/AIDS and life expectancy
    - Relationship between immunization against polio and diphtheria, and life expectancy  

## Project overview
   1. Data loading
   2. Data cleaning
   3. Data exploration
   4. Insights

## Dependencies
The following software is required to carry out this project:

* MySQL Workbench 8.0 CE

## Technical skills
The following skills were used throughout the implementation of this project:

* Database creation
* Data definition
* Data manipulation
* Data querying

## Data set
The World Life Expectancy dataset is a thorough compilation of data related to life expectancy in different countries, and it consists of:
* 2928 entries
* 18 columns

The dataset for this analysis can be found uploaded in this repository as life-world-expectancy.cvs.

## Data cleaning
The first step of the project was to create the schema in MySQL Workbench. This was followed by loading the cvs data file into the database. After successfully loading the data, it had to be cleaned to ensure its integrity and reliability. Due to MySQL's powerful query functions, the raw dataset was transformed into a clean, structured and reliable dataset suitable for further analysis.

## Data exploration
To obtain useful information from this dataset, an in-depth exploratory analysis was carried out. 

A univariate analysis was carried out to find relevant information for each of the variables. Subsequently, a bivariate analysis was performed to find possible relationships between life expectancy and the rest of the variables. 

## Insights
During this project, a large amount of data on life expectancy around the world was successfully analyzed. 

As would be expected from this analysis, valuable and insightful information was obtained. These findings obtained through SQL queries are well documented in the sql file named SQL-world-life-expectancy-exploratory-analysis.sql. Due to the large volume of data retrieved for some of the queries, only the most relevant information is presented in this ReadMe file. These findings and results are presented below.

### **Number of countries**

185 countries were analyzed in this project.

### **Time span**

The data was collected between 2007 and 2012.

### **Developing Status**

The countries studied in this project are in two different developing status: developing and developed. 151 countries were in a developed status, and 32 under developing status.

### **Lowest life expectancy**

Haiti had in 2017 the lowest life expectancy: 36.3 years old.

### **Highest life expectancy** 

The highest life expectancy in the dataset is 89 years old. 10 developed countries had this life expectancy as the highest: Belgium, Finland, France, Germany, Italy, New Zealand, Norway, Portugal, Spain and Sweden.

### **Impact of other factors on life expectancy**

* **Relationship between the state of development of the country and life expectancy**

During the study of the posible correlation between developing status and life expectancy, it was found that life expectancy is higher in countries in developing countries, whereas it decreases in countries which are in developing status. This means there is a positive relationship between the developed status of the country and life expectancy.

<small> Table 1. Average life expectancy for developed and developing countries </small>

| Status          | Life expectancy |
| --------------- | --------------- |
| Developing      | 67.1            |
| Developed       | 79.2            |

* **Relationship between adult mortality and life expectancy**

In the bivariate study between adult mortality and life expectancy it was seen that the higher the death rate amongst adults, the lower the life expectancy. Therefore there is a negative relationship between life expectancy and adult mortality rate. 

<small> Table 2. Top 5 countries with highest average adult mortality </small>

| Country         | Life expectancy | Adult mortality |
| --------------- | --------------- | ----------------|
| Lesotho         | 48.8            | 550             |
| Zimbabwe        | 50.5            | 462             |
| Botswana        | 56.0            | 448             |
| Malawi          | 49.9            | 424             |
| Cote d'Ivoire   | 50.4            | 417             |

<small> Table 3. Top 5 countries with lowest average adult mortality </small>

| Country         | Life expectancy | Adult mortality |
| --------------- | --------------- | ----------------|
| Tunisia         | 74.4            | 19              |
| Albania         | 75.2            | 45              |
| Iceland         | 82.4            | 49              |
| Saudi Arabia    | 73.5            | 52              |
| Cyprus          | 79.7            | 54              |

* **Relationship between healthcare expenditure and life expectancy**

Through the SQL query that retrieves the life expectancy, healthcare expenditure for each country, it was observed that the higher the health expenditure, the higher the life expectancy. Thus, there is a positive relationship between life expectancy and healthcare expenditure. 

<small> Table 4. Top 5 countries with the average highest healthcare expenditure </small>

| Country         | Life expectancy | Expenditure     |
| --------------- | --------------- | ----------------|
| Switzerland     | 82.3            | 9802            |
| Luxembourg      | 80.8            | 8178            |
| Australia       | 81.8            | 5332            |
| Denmark         | 79.3            | 5313            |
| Iceland         | 82.4            | 4992            |

<small> Table 5. Top 5 countries with the average lowest healthcare expenditure </small>

| Country         | Life expectancy | Expenditure     |
| --------------- | --------------- | ----------------|
| Eritrea         | 60.7            | 6               |
| South Sudan     | 53.9            | 8               |
| Myanmar         | 64.2            | 13              |
| Burundi         | 55.5            | 15              |
| Guinea          | 56.0            | 16              |

* **Relationship between GDP and life expectancy**

In this study was observed that the higher the GDP of a country, its life expectancy increases. Consequently, a positive relationship exists between life expectancy and GP. 

<small> Table 6. Top 5 countries with the average lowest GDP </small>

| Country         | Life expectancy | GDP             |
| --------------- | --------------- | ----------------|
| Somalia         | 53.3            | 55.8            |
| Burundi         | 55.5            | 137.9           |
| Eritrea         | 60.7            | 194.6           |
| Malawi          | 49.9            | 237.6           |
| Liberia         | 57.5            | 246.3           |

<small> Table 7. Top 5 countries with the average highest GDP </small>

| Country         | Life expectancy | GDP             |
| --------------- | --------------- | ----------------|
| Switzerland     | 82.3            | 57363.1         |
| Luxembourg      | 80.8            | 53257.1         |
| Qatar           | 77.0            | 40748.6         |
| Netherlands     | 81.1            | 34964.8         |
| Australia       | 81.8            | 34637.6         |

* **Relationship between measles and life expectancy**

During the study of the relationship between measles cases and life expectancy, it was observed that the higher the measles cases rate, the lower the life expectancy was. However, there was one exception for China. In this particular case, the measles case is the highest in the whole dataset but the life expectancy is higher than other countries with similar measles rate. 

From the data results, it can then be stated that there is a negative relationship between life expectancy and measles cases.

<small> Table 8. Top 5 countries with the average highest measles case rate </small>

| Country         | Life expectancy | Measles         |
| --------------- | --------------- | ----------------|
| China           | 74.3            | 65857.9         |
| Nigeria         | 51.4            | 51653.9         |
| Dem. Rep. Congo | 55.7            | 48922.7         |
| India           | 65.4            | 46454.2         |
| Indonesia       | 67.6            | 16244.9         |

<small> Table 9. Top 5 countries with the average lowest measles case rate </small>

| Country         | Life expectancy | Measles         |
| --------------- | --------------- | ----------------|
| Cabo Verde      | 72.5            | 0.1             |
| El Salvador     | 71.7            | 0.1             |
| Costa Rica      | 78.6            | 0.2             |
| Jamaica         | 74.3            | 0.2             |
| Panama          | 76.5            | 0.3             |

* **Relationship between HIV/AIDS deaths and life expectancy**

There is a negative relationship between HIV deaths and life expectancy. In the analysis it was observed that countries with higher HIV deaths had lower life expectancies.
   
It was also observed that the HIV death rate in Afghanistan was the lowest, however, their life expectancy was really low in comparison with other countries with similar HIV death rates. It is understood that many other factors affect life expectancy in Afghanistan. 

<small> Table 10. Top 5 countries with the average highest HIV death rate </small>

| Country         | Life expectancy | HIV Deaths      |
| --------------- | --------------- | ----------------|
| Swaziland       | 51.3            | 32.9            |
| Zimbabwe        | 50.5            | 23.3            |
| Lesotho         | 48.8            | 23.0            |
| South Africa    | 57.5            | 18.5            |
| Malawi          | 49.9            | 16.7            |

<small> Top 11. Top 5 countries with the average lowest HIV death rate </small>

| Country             | Life expectancy | HIV Deaths      |
| ------------------- | --------------- | ----------------|
| Afganishtan         | 58.3            | 0.1             |
| Albania             | 75.2            | 0.1             |
| Algeria             | 73.6            | 0.1             |
| Antigua and Barbuda | 75.1            | 0.1             |
| Argentina           | 75.2            | 0.1             |

* **Relationship between polio and diphtheria inmunization and life expectancy**
 
Polio and diphtheria vaccination rates tend to have the same order magnitude for all countries in the data set. During the study of the relationship between vaccination rates and life expectancy, it was observed that the higher the polio and diphtheria vaccination rates, the higher the life expectancy. Hence, the relationship between immunization by vaccination has a positive relationship with life expectancy. 

<small> Table 12. Top 5 countries with the average highest polio vaccination rate </small>

| Country         | Life expectancy | Polio Vacc. Rate | Diphtheria Vacc. Rate |
| --------------- | --------------- | ---------------- | --------------------- |
| Hungary         | 73.7            | 98.9             | 99.0                  |
| Cuba            | 78.0            | 98.7             | 93.9                  |
| Uzbekistan      | 68.0            | 98.6             | 98.4                  |
| Oman            | 74.8            | 98.5             | 98.8                  |
| Seychelles      | 72.4            | 98.5             | 98.5                  |

<small> Table 13. Top 5 countries with the average lowest polio vaccination rate </small>

| Country            | Life expectancy | Polio Vacc. Rate | Diphtheria Vacc. Rate |
| ------------------ | --------------- | ---------------- | --------------------- |
| South Sudan        | 53.9            | 13.8             | 14.7                  |
| Somalia            | 53.3            | 29.8             | 29.3                  |
| Chad               | 50.4            | 32.9             | 26.8                  |
| Equatorial Guinea  | 55.3            | 36.9             | 29.9                  |
| Central Africa Rep | 48.5            | 41.3             | 42.4                  |


Looking ahead, there are several areas that merit further exploration:
* **Develop advanced predictive models:** use machine learning algorithms to build predictive models that can accurately estimate life expectancy.
* **Expand the data set:** Increase the robustness of the analysis by incorporating a larger and more diverse data set.
* **Visualization:** this data analysis project can be more comprehensive with proper visualization of the queries employed during this study using a suitable BI tool. 
