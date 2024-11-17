CREATE DATABASE SalesData;
Use SalesData;
CREATE TABLE Country (
    Id INT PRIMARY KEY,
    Country_name VARCHAR(50),
    Population INT,
    Area INT
);
CREATE TABLE Persons (
    Id INT PRIMARY KEY,
    Fname VARCHAR(50),
    Lname VARCHAR(50),
    Population INT,
    Rating DECIMAL(2, 1),
    Country_Id INT,
    Country_name VARCHAR(50),
    FOREIGN KEY (Country_Id) REFERENCES Country(Id)
);
INSERT INTO Country (Id, Country_name, Population, Area)
VALUES 
(1, 'USA', 331000000, 9833520),
(2, 'India', 1380000000, 3287263),
(3, 'Canada', 38000000, 9984670),
(4, 'Australia', 25600000, 7692024),
(5, 'UK', 67000000, 243610),
(6, 'France', 67000000, 551695),
(7, 'Germany', 83000000, 357022),
(8, 'Brazil', 212000000, 8515767),
(9, 'Japan', 126000000, 377975),
(10, 'South Korea', 52000000, 100210);
INSERT INTO Persons (Id, Fname, Lname, Population, Rating, Country_Id, Country_name)
VALUES 
(1, 'John', 'Doe', 331000000, 4.5, 1, 'USA'),
(2, 'Aaliya', 'Khan', 1380000000, 3.8, 2, 'India'),
(3, 'David', 'Smith', 38000000, 4.6, 3, 'Canada'),
(4, 'Maria', 'Garcia', 25600000, 4.2, 4, 'Australia'),
(5, 'Liam', 'Johnson', 67000000, 3.9, 5, 'UK'),
(6, 'Emma', 'Wilson', 67000000, 4.3, 6, 'France'),
(7, 'Noah', 'Brown', 83000000, 4.0, 7, 'Germany'),
(8, 'Sophia', 'Taylor', 212000000, 4.8, 8, 'Brazil'),
(9, 'James', 'Anderson', 126000000, 4.7, 9, 'Japan'),
(10, 'Mia', 'Thomas', 52000000, 4.9, 10, 'South Korea');
SELECT DISTINCT Country_name FROM Persons;
SELECT Fname AS First_Name, Lname AS Last_Name FROM Persons;
SELECT * FROM Persons WHERE Rating > 4.0;
SELECT * FROM Country WHERE Population > 1000000;
SELECT * FROM Persons WHERE Country_name = 'USA' OR Rating > 4.5;
SELECT * FROM Persons WHERE Country_name IS NULL;
SELECT * FROM Persons WHERE Country_name IN ('USA', 'Canada', 'UK');
SELECT * FROM Persons WHERE Country_name NOT IN ('India', 'Australia');
SELECT * FROM Country WHERE Population BETWEEN 500000 AND 2000000;
SELECT * FROM Country WHERE Country_name NOT LIKE 'C%';









