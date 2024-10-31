CREATE DATABASE School;
USE School;
CREATE TABLE STUDENT (
    Roll_No INT PRIMARY KEY,
    Name VARCHAR(50),
    Marks INT,
    Grade CHAR(1)
);
INSERT INTO STUDENT (Roll_No, Name, Marks, Grade)
VALUES 
    (1, 'Rahul', 85, 'A'),
    (2, 'Anjali', 78, 'B'),
    (3, 'Vikram', 92, 'A'),
    (4, 'Priya', 67, 'C'),
    (5, 'Sanjay', 74, 'B');
ALTER TABLE STUDENT 
ADD Contact VARCHAR(15);
ALTER TABLE STUDENT 
DROP COLUMN Grade;
RENAME TABLE STUDENT TO CLASSTEN;
TRUNCATE TABLE CLASSTEN;
DROP TABLE CLASSTEN;
