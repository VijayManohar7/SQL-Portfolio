Use SalesData;
SELECT LEFT(Country_name, 3) AS First_Three_Characters 
FROM Country;
SELECT CONCAT(Fname, ' ', Lname) AS Full_Name 
FROM Persons;
SELECT COUNT(DISTINCT Country_name) AS Unique_Countries 
FROM Persons;
SELECT MAX(Population) AS Max_Population 
FROM Country;
SELECT MIN(Population) AS Min_Population 
FROM Persons;
INSERT INTO Persons (Id, Fname, Lname, Population, Rating, Country_Id, Country_name)
VALUES 
(11, 'Chris', NULL, 120000, 4.2, 1, 'USA'),
(12, 'Anna', NULL, 80000, 4.1, 2, 'India');


SELECT COUNT(Lname) AS Non_Null_LastNames 
FROM Persons;
SELECT COUNT(*) AS Total_Rows 
FROM Persons;
SELECT Population 
FROM Country
LIMIT 3;
SELECT * 
FROM Country
ORDER BY RAND()
LIMIT 3;
SELECT * 
FROM Persons
ORDER BY Rating DESC;
SELECT Country_name, SUM(Population) AS Total_Population 
FROM Persons
GROUP BY Country_name;
SELECT Country_name, SUM(Population) AS Total_Population 
FROM Persons
GROUP BY Country_name
HAVING SUM(Population) > 50000;
SELECT Country_name, COUNT(*) AS Total_Persons, AVG(Rating) AS Avg_Rating
FROM Persons
GROUP BY Country_name
HAVING COUNT(*) > 2
ORDER BY Avg_Rating ASC;


