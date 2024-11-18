Use SalesData;
SELECT 
    Persons.Id AS Person_Id, 
    Persons.Fname, 
    Persons.Lname, 
    Country.Country_name, 
    Persons.Rating
FROM Persons
INNER JOIN Country
ON Persons.Country_Id = Country.Id;
SELECT 
    Persons.Id AS Person_Id, 
    Persons.Fname, 
    Persons.Lname, 
    Country.Country_name, 
    Persons.Rating
FROM Persons
LEFT JOIN Country
ON Persons.Country_Id = Country.Id;
SELECT 
    Persons.Id AS Person_Id, 
    Persons.Fname, 
    Persons.Lname, 
    Country.Country_name, 
    Persons.Rating
FROM Persons
RIGHT JOIN Country
ON Persons.Country_Id = Country.Id;
SELECT DISTINCT Country_name
FROM Country
UNION
SELECT DISTINCT Country_name
FROM Persons;
SELECT Country_name
FROM Country
UNION ALL
SELECT Country_name
FROM Persons;
SELECT Id, Fname, Lname, ROUND(Rating) AS Rounded_Rating
FROM Persons;
UPDATE Persons
SET Rating = ROUND(Rating);
