CREATE DATABASE Sales;
USE Sales;
CREATE TABLE Managers (
    Manager_Id INT PRIMARY KEY,
    First_name VARCHAR(50) NOT NULL,
    Last_Name VARCHAR(50) NOT NULL,
    DOB DATE NOT NULL,
    Age INT CHECK (Age > 0),
    Last_update TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Gender CHAR(1) CHECK (Gender IN ('M', 'F')),
    Department VARCHAR(50) NOT NULL,
    Salary DECIMAL(10, 2) NOT NULL
);
INSERT INTO Managers (Manager_Id, First_name, Last_Name, DOB, Age, Gender, Department, Salary)
VALUES 
(1, 'John', 'Doe', '1980-01-15', 44, 'M', 'IT', 30000),
(2, 'Aaliya', 'Khan', '1985-06-10', 39, 'F', 'Finance', 28000),
(3, 'David', 'Smith', '1975-03-22', 49, 'M', 'HR', 32000),
(4, 'Maria', 'Garcia', '1988-08-11', 36, 'F', 'IT', 27000),
(5, 'Liam', 'Johnson', '1990-12-19', 33, 'M', 'Sales', 26000),
(6, 'Emma', 'Wilson', '1982-11-30', 42, 'F', 'IT', 30000),
(7, 'Noah', 'Brown', '1978-05-25', 46, 'M', 'Marketing', 24000),
(8, 'Sophia', 'Taylor', '1986-09-14', 38, 'F', 'IT', 29000),
(9, 'James', 'Anderson', '1992-04-03', 32, 'M', 'HR', 27000),
(10, 'Mia', 'Thomas', '1991-07-07', 33, 'F', 'Finance', 25000);
SELECT First_name, Last_Name, DOB
FROM Managers
WHERE Manager_Id = 1;
SELECT First_name, Last_Name, Salary * 12 AS Annual_Income
FROM Managers;
SELECT *
FROM Managers
WHERE First_name <> 'Aaliya';
SELECT *
FROM Managers
WHERE Department = 'IT' AND Salary > 25000;
SELECT *
FROM Managers
WHERE Salary BETWEEN 10000 AND 35000;