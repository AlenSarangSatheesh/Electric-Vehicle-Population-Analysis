-- select table that contains all details of electric vehicle population
use vehiclepopulation;
SELECT 
    *
FROM
    mytable;
    
-- electric vehicles before 2000
SELECT 
    *
FROM
    mytable
WHERE
    Model_Year < 2000;

-- select years in asc order
SELECT DISTINCT
    Model_Year
FROM
    mytable
ORDER BY Model_Year ASC;

-- find which year most electric vehicles produced
SELECT 
    Model_Year, COUNT(*) cars_produced_in_year
FROM
    mytable
GROUP BY Model_Year
ORDER BY cars_produced_in_year DESC;

-- which are the car companies produced electric vehicles

SELECT DISTINCT
    Company
FROM
    mytable;

-- which company has produced more cars

SELECT 
    company, COUNT(*) AS vehicle_count
FROM
    mytable
GROUP BY Company
ORDER BY vehicle_count DESC;

-- which company has produced more cars year wise
SELECT 
    Model_Year, Company, COUNT(*) AS car_count
FROM
    mytable
GROUP BY Model_Year , Company
HAVING COUNT(*) = (SELECT 
        MAX(car_count)
    FROM
        (SELECT 
            Model_Year, Company, COUNT(*) AS car_count
        FROM
            mytable
        GROUP BY Model_Year , Company) AS car_counts
    WHERE
        car_counts.Model_Year = mytable.Model_Year)
ORDER BY Model_Year;

-- select all countries where  vehicle manufactured
SELECT DISTINCT
    country
FROM
    mytable
ORDER BY Country;

-- total count of vehicles manufacured
SELECT 
    COUNT(VIN_110)
FROM
    mytable;

-- which vehicle gives maximum range
SELECT 
    Company, Model, MAX(Electric_Rangekm) AS max_range
FROM
    mytable
GROUP BY Company , Model
ORDER BY max_range DESC;

-- which vehicle gives least range
SELECT 
    Company, Model, MAX(Electric_Rangekm) AS max_range
FROM
    mytable
WHERE
    Electric_Rangekm <> 0
GROUP BY Company , Model
ORDER BY max_range;

-- select all details of vehicles manufacutured in washington
SELECT 
    *
FROM
    mytable
WHERE
    State = 'WA';

-- how many pure battery and hybrid tilll manufactured
SELECT 
    Electric_Vehicle_Type, COUNT(*) AS Count
FROM
    mytable
WHERE
    Electric_Vehicle_Type IN ('Plug-in Hybrid Electric Vehicle (PHEV)' , 'Battery Electric Vehicle (BEV)')
GROUP BY Electric_Vehicle_Type;

-- find all null values

SELECT 
    *
FROM
    mytable
WHERE
    VIN_110 IS NULL OR Country IS NULL
        OR City IS NULL
        OR State IS NULL
        OR Model_Year IS NULL
        OR Company IS NULL
        OR Model IS NULL
;

-- select vehicles that dont have proper details
SELECT 
    *
FROM
    mytable
WHERE
    Model IS NULL OR Electric_Rangekm = 0;

-- how many vehicles that dont have proper details
SELECT 
    COUNT(*)
FROM
    mytable
WHERE
    Model IS NULL OR Electric_Rangekm = 0;

-- find top 10 vehicles that have higher range
SELECT DISTINCT
    Electric_Rangekm, Company, Model
FROM
    mytable
ORDER BY Electric_Rangekm DESC
LIMIT 10;

-- find top 10 vehicles that have higher range excluding tesla
SELECT DISTINCT
    Electric_Rangekm, Company, Model
FROM
    mytable
WHERE
    Company <> 'TESLA'
ORDER BY Electric_Rangekm DESC
LIMIT 10;

-- list first 10 companies that started manufacturing in beggining
SELECT DISTINCT
    Company, Model_Year
FROM
    mytable
ORDER BY Model_Year
LIMIT 10;

-- what are the tesla models
SELECT DISTINCT
    Model
FROM
    mytable
WHERE
    Company = 'TESLA'
GROUP BY Model;


