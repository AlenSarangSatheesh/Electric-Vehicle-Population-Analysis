-- Select all vehicles of Tesla
SELECT 
    *
FROM
    mytable
WHERE
    Company = 'TESLA';

-- when tesla started making Electric vehicles
SELECT 
    model_year
FROM
    mytable
ORDER BY Model_Year ASC
LIMIT 1;

-- which tesla electric model gives highest range
SELECT 
    Model
FROM
    mytable
WHERE
    Company = 'TESLA'
ORDER BY Electric_Rangekm DESC
LIMIT 1;

-- what is the average range of tesla cars till manufactured
SELECT 
    AVG(Electric_Rangekm)
FROM
    mytable
WHERE
    Company = 'TESLA';

-- number of cars produced year wise
SELECT 
    Model_Year, COUNT(Model_Year) AS no_of_cars
FROM
    mytable
WHERE
    Company = 'TESLA'
GROUP BY Model_Year
ORDER BY no_of_cars DESC;

-- which is the least range vehicle
SELECT 
    MIN(Electric_Rangekm)
FROM
    mytable
WHERE
    Company = 'TESLA'
        AND Electric_Rangekm <> 0;

-- cities produces tesla
SELECT 
    city
FROM
    mytable
WHERE
    Company = 'TESLA'
GROUP BY City;

-- no of cars manufactured city wise in desc order
SELECT 
    city, COUNT(City) AS Number_of_cars_manufactured
FROM
    mytable
WHERE
    Company = 'TESLA'
GROUP BY City
ORDER BY Number_of_cars_manufactured DESC;

-- percent of car produced in an year
SELECT 
    Model_Year,
    COUNT(Model_Year) AS no_of_cars,
    (COUNT(Model_Year) / 57124) * 100 AS '%'
FROM
    mytable
WHERE
    Company = 'TESLA'
GROUP BY Model_Year
ORDER BY no_of_cars DESC;

-- total count of cars manufacured
SELECT 
    COUNT(Company)
FROM
    mytable
WHERE
    Company = 'TESLA';
