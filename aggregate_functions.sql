-- Aggregate functions

-- Total amount or number of
SELECT COUNT(id)
FROM webinar;

-- Minimum or first date etc
SELECT MIN(starts_on)
FROM webinar;

-- Maximum or last date etc
SELECT MAX(ends_on)
FROM webinar;


-- The total sum of a column
SELECT SUM(audience)
FROM webinar;

-- The average of a column
SELECT AVG(audience)
FROM webinar;

-- Mulitple columns as result 
SELECT 
    COUNT(id),
    MIN(starts_on),
    MAX(ends_on),
    SUM(audience),
    AVG(audience)
FROM webinar
WHERE teacher IN ('Julius Maxim');