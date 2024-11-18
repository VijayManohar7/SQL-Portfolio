Use SalesData;
ALTER TABLE Persons
ADD DOB DATE;
UPDATE Persons SET DOB = '1980-05-15' WHERE Id = 1;
UPDATE Persons SET DOB = '1985-10-22' WHERE Id = 2;
UPDATE Persons SET DOB = '1992-07-10' WHERE Id = 3;
UPDATE Persons SET DOB = '1998-12-03' WHERE Id = 4;
UPDATE Persons SET DOB = '1995-09-14' WHERE Id = 5;
UPDATE Persons SET DOB = '1989-11-20' WHERE Id = 6;
UPDATE Persons SET DOB = '1990-03-05' WHERE Id = 7;
UPDATE Persons SET DOB = '2000-06-25' WHERE Id = 8;
UPDATE Persons SET DOB = '1996-08-12' WHERE Id = 9;
UPDATE Persons SET DOB = '1987-01-30' WHERE Id = 10;
SELECT * FROM Persons;
DELIMITER //

CREATE FUNCTION CalculateAge(DOB DATE) 
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE age INT;
    SET age = TIMESTAMPDIFF(YEAR, DOB, CURDATE());
    RETURN age;
END //

DELIMITER ;
SELECT Id, Fname, Lname, DOB, CalculateAge(DOB) AS Age
FROM Persons;
SELECT Id, Country_name, LENGTH(Country_name) AS Name_Length
FROM Country;
SELECT Id, Country_name, LEFT(Country_name, 3) AS First_Three_Chars
FROM Country;
SELECT Id, Country_name, UPPER(Country_name) AS Uppercase_Name
FROM Country;
SELECT Id, Country_name, LOWER(Country_name) AS Lowercase_Name
FROM Country;

