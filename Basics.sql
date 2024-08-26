CREATE DATABASE school;
USE school;

CREATE TABLE students (
    student_id INT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    age INT,
    grade VARCHAR(5),
    enrollment_date DATE
);

-- 1. Create command

INSERT INTO students (first_name, last_name, age, grade, enrollment_date)
VALUES 
('Michael', 'Brown', 17, '12th', '2022-09-01'),
('Sarah', 'Davis', 15, '10th', '2023-09-01'),
('David', 'Wilson', 16, '11th', '2023-09-01'),
('Ashley', 'Miller', 14, '9th', '2023-09-01'),
('Chris', 'Taylor', 18, '12th', '2022-09-01'),
('Jessica', 'Anderson', 17, '11th', '2023-09-01'),
('Daniel', 'Thomas', 16, '10th', '2023-09-01'),
('Laura', 'Jackson', 15, '9th', '2023-09-01'),
('Kevin', 'Moore', 18, '12th', '2022-09-01'),
('Sophia', 'Martin', 14, '9th', '2023-09-01');

-- 2.Read Command


SELECT * FROM students;
SELECT first_name, age FROM students;
SELECT * FROM students WHERE age > 15;

-- 3. Update Command

UPDATE students
SET grade = '11th'
WHERE student_id = 1;

-- 4. Delete Command

DELETE FROM students
WHERE student_id = 7;

-- 5.Select students in the 10th grade with 'WHERE' clause
SELECT * FROM students WHERE grade = '10th';

-- 6. Select all students, ordered by last name using 'ORDER BY'
SELECT * FROM students ORDER BY last_name ASC;

-- 7. Grouping Data with GROUP BY and HAVING
SELECT grade, COUNT(*) AS num_students
FROM students
GROUP BY grade;

SELECT grade, COUNT(*) AS num_students
FROM students
GROUP BY grade
HAVING COUNT(*) > 1;

-- 8. Create a new table to perform Join operations

CREATE TABLE student_details (
    student_id INT,
    address VARCHAR(255),
    phone_number VARCHAR(15),
    FOREIGN KEY (student_id) REFERENCES students(student_id)
);

-- Add data into that table

INSERT INTO student_details (student_id, address, phone_number)
VALUES 
(1, '123 Elm St, Springfield', '123-456-7890'),
(2, '456 Oak St, Springfield', '234-567-8901'),
(3, '789 Maple St, Springfield', '345-678-9012'),
(4, '101 Pine St, Springfield', '456-789-0123'),
(5, '202 Birch St, Springfield', '567-890-1234'),
(6, '303 Cedar St, Springfield', '678-901-2345'),
(8, '505 Willow St, Springfield', '890-123-4567'),
(9, '606 Poplar St, Springfield', '901-234-5678'),
(10, '707 Ash St, Springfield', '012-345-6789');

-- 1. inner Join
SELECT s.student_id, s.first_name, s.last_name, s.age, s.grade, sd.address, sd.phone_number
FROM students s
INNER JOIN student_details sd ON s.student_id = sd.student_id;

-- 2.Left Join
SELECT s.student_id, s.first_name, s.last_name, s.age, s.grade, sd.address, sd.phone_number
FROM students s
LEFT JOIN student_details sd ON s.student_id = sd.student_id;

-- 3.Right Join
SELECT s.student_id, s.first_name, s.last_name, s.age, s.grade, sd.address, sd.phone_number
FROM students s
RIGHT JOIN student_details sd ON s.student_id = sd.student_id;

-- 4. Full outer join using union
SELECT s.student_id, s.first_name, s.last_name, s.age, s.grade, sd.address, sd.phone_number
FROM students s
LEFT JOIN student_details sd ON s.student_id = sd.student_id

UNION

SELECT s.student_id, s.first_name, s.last_name, s.age, s.grade, sd.address, sd.phone_number
FROM students s
RIGHT JOIN student_details sd ON s.student_id = sd.student_id;






