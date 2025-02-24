CREATE DATABASE CountryDB;
USE CountryDB;
CREATE TABLE Country (
    Country_Id INT PRIMARY KEY AUTO_INCREMENT,
    Country_Name VARCHAR(255) NOT NULL,
    Population INT
);

CREATE TABLE Persons (
    Person_Id INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(255) NOT NULL,
    Country_Id INT,
    Rating DECIMAL(3,1),
    FOREIGN KEY (Country_Id) REFERENCES Country(Country_Id)
);
INSERT INTO Country (Country_Name, Population) VALUES
('USA', 331000000),
('India', 1400000000),
('Germany', 83000000);

INSERT INTO Persons (Name, Country_Id, Rating) VALUES
('John Doe', 1, 4.5),
('Jane Smith', 2, 3.8),
('Max Müller', 3, 2.9),
('Amit Kumar', 2, 4.2),
('Emily Brown', 1, 3.1);
SELECT c.Country_Name, COUNT(p.Person_Id) AS Total_Persons
FROM Persons p
JOIN Country c ON p.Country_Id = c.Country_Id
GROUP BY c.Country_Name;
SELECT c.Country_Name, COUNT(p.Person_Id) AS Total_Persons
FROM Persons p
JOIN Country c ON p.Country_Id = c.Country_Id
GROUP BY c.Country_Name
ORDER BY Total_Persons DESC;
SELECT c.Country_Name, AVG(p.Rating) AS Avg_Rating
FROM Persons p
JOIN Country c ON p.Country_Id = c.Country_Id
GROUP BY c.Country_Name
HAVING Avg_Rating > 3.0;
SELECT Country_Name
FROM Country
WHERE Country_Id IN (
    SELECT Country_Id FROM Persons
    GROUP BY Country_Id
    HAVING AVG(Rating) = (
        SELECT AVG(Rating) FROM Persons WHERE Country_Id = 
            (SELECT Country_Id FROM Country WHERE Country_Name = 'USA')
    )
);
SELECT Country_Name
FROM Country
WHERE Population > (SELECT AVG(Population) FROM Country);
USE Product;
CREATE OR REPLACE VIEW customer_info AS
SELECT CONCAT(First_name, ' ', Last_name) AS Full_Name, Email
FROM Customer;
SELECT * FROM customer_info;
CREATE OR REPLACE VIEW US_Customers AS
SELECT * FROM Customer WHERE Country = 'USA';
CREATE OR REPLACE VIEW Customer_details AS
SELECT 
    CONCAT(First_name, ' ', Last_name) AS Full_Name,
    Email,
    Phone_no,
    State
FROM Customer;
UPDATE Customer
SET Phone_no = '999-999-9999'
WHERE State = 'California';
SELECT State, COUNT(*) AS Customer_Count
FROM Customer
GROUP BY State
HAVING COUNT(*) > 5;
SELECT State, COUNT(*) AS Customer_Count
FROM Customer_details
GROUP BY State;
SELECT * FROM Customer_details ORDER BY State ASC;











