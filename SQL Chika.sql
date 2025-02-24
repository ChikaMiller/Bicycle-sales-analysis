---creating a database
CREATE DATABASE StudentDB; 

---creating a table called student
CREATE TABLE student (student_id INT PRIMARY KEY,first_name VARCHAR(50),last_name VARCHAR(50),
birthdate DATE, grade_level INT);

----creating a new table called courses
CREATE TABLE courses (course_id INT PRIMARY KEY, course_name VARCHAR(225) NOT NULL);

----creating a new table called Enrollments
CREATE TABLE Enrollments(student_id INT, course_id INT, 
grade INT);

---inserting values to the tables
--1.)
INSERT INTO	student (student_id,first_name,last_name,
birthdate, grade_level)
VALUES
(1, 'CHANEL', 'BRICKS', '1992-01-01', 3),
(2, 'JADEN', 'DAVID', '2016-11-23', 5),
(3, 'IVAN', 'PRINCE', '2018-09-20', 4);

--2.)
INSERT INTO courses (course_id, course_name)
VALUES
(1, 'CHEMISTRY'),
(2, 'SCIENCE'),
(3, 'MATHEMATICS');

--3.)
INSERT INTO Enrollments(student_id, course_id, 
grade)
VALUES
(1, 2, 100),
(2, 3, 90),
(3, 4, 85),
(4, 5, 80),
(5, 6, 70);

CREATE TABLE Enrollments (
	student_id INT, 
	course_id INT, 
	grade INT,
	PRIMARY KEY (student_id,
course_id),
	FOREIGN KEY (student_id)
REFERENCES student(student_id),
	FOREIGN KEY (course_id)
REFERENCES courses(course_id));

SELECT * FROM Enrollments;
SELECT * FROM student;
SELECT * FROM courses;


---Queries to retrieve and manipulate
--1.) writing query to select students names and grade level

SELECT first_name, last_name,
grade_level
FROM student;

---2.) writing query to calculate average grade for each student using AVG()

SELECT
	student_id,
	AVG(grade) AS average_grade
FROM
	Enrollments
GROUP BY
	student_id;



---3.) Writing query to trim spaces from students names
SELECT
	TRIM(first_name) AS first_name,
	TRIM(last_name) AS last_name,
	grade_level
FROM
	student;

---4.) Writing a query to select all students with a grade greater than 80 in DESC order

SELECT
	student_id,
	course_id,
	grade
FROM
	Enrollments
WHERE
	grade > 80
ORDER BY
	grade DESC;