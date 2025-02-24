CREATE DATABASE library;
USE library;

-- 1. Branch Table
CREATE TABLE Branch (
    Branch_no INT PRIMARY KEY,
    Manager_Id INT,
    Branch_address VARCHAR(255),
    Contact_no VARCHAR(15)
);

-- 2. Employee Table
CREATE TABLE Employee (
    Emp_Id INT PRIMARY KEY,
    Emp_name VARCHAR(255),
    Position VARCHAR(255),
    Salary INT,
    Branch_no INT,
    FOREIGN KEY (Branch_no) REFERENCES Branch(Branch_no)
);

-- 3. Books Table
CREATE TABLE Books (
    ISBN INT PRIMARY KEY,
    Book_title VARCHAR(255),
    Category VARCHAR(100),
    Rental_Price DECIMAL(10,2),
    Status ENUM('Yes', 'No'),
    Author VARCHAR(255),
    Publisher VARCHAR(255)
);

-- 4. Customer Table
CREATE TABLE Customer (
    Customer_Id INT PRIMARY KEY,
    Customer_name VARCHAR(255),
    Customer_address VARCHAR(255),
    Reg_date DATE
);

-- 5. IssueStatus Table
CREATE TABLE IssueStatus (
    Issue_Id INT PRIMARY KEY,
    Issued_cust INT,
    Issued_book_name VARCHAR(255),
    Issue_date DATE,
    Isbn_book INT,
    FOREIGN KEY (Issued_cust) REFERENCES Customer(Customer_Id),
    FOREIGN KEY (Isbn_book) REFERENCES Books(ISBN)
);

-- 6. ReturnStatus Table
CREATE TABLE ReturnStatus (
    Return_Id INT PRIMARY KEY,
    Return_cust INT,
    Return_book_name VARCHAR(255),
    Return_date DATE,
    Isbn_book2 INT,
    FOREIGN KEY (Return_cust) REFERENCES Customer(Customer_Id),
    FOREIGN KEY (Isbn_book2) REFERENCES Books(ISBN)
);

INSERT INTO Branch VALUES
(1, 101, 'MG Road, Kochi', '9876543210'),
(2, 102, 'Brigade Road, Bangalore', '8765432109');

INSERT INTO Employee VALUES
(201, 'Arjun Kumar', 'Manager', 60000, 1),
(202, 'Ravi Sharma', 'Librarian', 45000, 1),
(203, 'Sonia Reddy', 'Clerk', 35000, 2),
(204, 'Rahul Mehta', 'Manager', 70000, 2);

INSERT INTO Books VALUES
(1001, 'History of India', 'History', 30.00, 'Yes', 'Bipin Chandra', 'Oxford'),
(1002, 'Introduction to Python', 'Programming', 50.00, 'No', 'Guido van Rossum', 'O Reilly'),
(1003, 'Harry Potter', 'Fiction', 40.00, 'Yes', 'J.K. Rowling', 'Bloomsbury');

INSERT INTO Customer VALUES
(301, 'Aditya Verma', 'Delhi', '2021-12-15'),
(302, 'Neha Jain', 'Mumbai', '2023-01-05'),
(303, 'Vikram Singh', 'Chennai', '2020-11-20');

INSERT INTO IssueStatus VALUES
(401, 302, 'Harry Potter', '2023-06-12', 1003),
(402, 303, 'Introduction to Python', '2023-06-18', 1002);

INSERT INTO ReturnStatus VALUES
(501, 302, 'Harry Potter', '2023-07-10', 1003);

SELECT Book_title, Category, Rental_Price
FROM Books
WHERE Status = 'Yes';

SELECT Emp_name, Salary
FROM Employee
ORDER BY Salary DESC;

SELECT i.Issued_book_name, c.Customer_name
FROM IssueStatus i
JOIN Customer c ON i.Issued_cust = c.Customer_Id;

SELECT Category, COUNT(*) AS Total_Books
FROM Books
GROUP BY Category;

SELECT Emp_name, Position
FROM Employee
WHERE Salary > 50000;

SELECT c.Customer_name
FROM Customer c
LEFT JOIN IssueStatus i ON c.Customer_Id = i.Issued_cust
WHERE c.Reg_date < '2022-01-01' AND i.Issue_Id IS NULL;

SELECT Branch_no, COUNT(*) AS Employee_Count
FROM Employee
GROUP BY Branch_no;

SELECT c.Customer_name
FROM IssueStatus i
JOIN Customer c ON i.Issued_cust = c.Customer_Id
WHERE i.Issue_date BETWEEN '2023-06-01' AND '2023-06-30';

SELECT Book_title
FROM Books
WHERE Book_title LIKE '%History%';

SELECT Branch_no, COUNT(*) AS Employee_Count
FROM Employee
GROUP BY Branch_no
HAVING COUNT(*) > 5;

SELECT e.Emp_name, b.Branch_address
FROM Employee e
JOIN Branch b ON e.Emp_Id = b.Manager_Id;

SELECT DISTINCT c.Customer_name
FROM IssueStatus i
JOIN Customer c ON i.Issued_cust = c.Customer_Id
JOIN Books b ON i.Isbn_book = b.ISBN
WHERE b.Rental_Price > 25;





