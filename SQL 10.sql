CREATE DATABASE SchoolDB;
USE SchoolDB;

CREATE TABLE teachers (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    subject VARCHAR(50),
    experience INT,
    salary INT
);

CREATE TABLE teacher_log (
    log_id INT PRIMARY KEY AUTO_INCREMENT,
    teacher_id INT,
    action VARCHAR(50),
    timestamp DATETIME DEFAULT CURRENT_TIMESTAMP
);
INSERT INTO teachers (name, subject, experience, salary) VALUES
('Alice Johnson', 'Math', 12, 70000),
('Bob Smith', 'Science', 8, 60000),
('Charlie Brown', 'English', 5, 50000),
('David Wilson', 'History', 15, 75000),
('Emma Davis', 'Physics', 7, 62000),
('Frank Martin', 'Chemistry', 9, 64000),
('Grace Lee', 'Biology', 11, 71000),
('Henry White', 'Computer Science', 6, 58000);

DELIMITER //

CREATE TRIGGER before_insert_teacher
BEFORE INSERT ON teachers
FOR EACH ROW
BEGIN
    IF NEW.salary < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Salary cannot be negative';
    END IF;
END //

DELIMITER ;

INSERT INTO teachers (name, subject, experience, salary) 
VALUES ('John Doe', 'Geography', 4, 50000);

DELIMITER //

CREATE TRIGGER after_insert_teacher
AFTER INSERT ON teachers
FOR EACH ROW
BEGIN
    INSERT INTO teacher_log (teacher_id, action, timestamp)
    VALUES (NEW.id, 'INSERT', NOW());
END //

DELIMITER ;

INSERT INTO teachers (name, subject, experience, salary) 
VALUES ('Liam Scott', 'Economics', 3, 55000);

SELECT * FROM teacher_log;  

DELIMITER //

CREATE TRIGGER before_delete_teacher
BEFORE DELETE ON teachers
FOR EACH ROW
BEGIN
    IF OLD.experience > 10 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Cannot delete a teacher with more than 10 years of experience';
    END IF;
END //

DELIMITER ;

DELETE FROM teachers WHERE id = 1;  -- Alice Johnson has 12 years experience

DELIMITER //

CREATE TRIGGER after_delete_teacher
AFTER DELETE ON teachers
FOR EACH ROW
BEGIN
    INSERT INTO teacher_log (teacher_id, action, timestamp)
    VALUES (OLD.id, 'DELETE', NOW());
END //

DELIMITER ;

DELETE FROM teachers WHERE id = 3;  

SELECT * FROM teacher_log;  
