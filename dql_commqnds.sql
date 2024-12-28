/*
SELECT STATEMENT
*/
--Retrieve all columns from the Students table
SELECT * FROM Students;

-- Retrieve specific columns
SELECT student_name, date_of_birth
FROM Students;

-- Retrieve all courses
SELECT * FROM Courses;

/*
LIMIT: Restricting Rows
*/
-- Fetch the first 3 students
SELECT * FROM Students
LIMIT 3;
-- Fetch the second batch of 3 students (pagination)
SELECT * FROM Students
LIMIT 3 OFFSET 3;

/*
WHERE CLAUSE
*/
SELECT * FROM Students WHERE student_name = 'Alice Johnson';
SELECT * FROM Students WHERE student_id < 10;

/*
AND, OR, NOT 
*/
-- Students admitted in 2023 and named Emma
SELECT * FROM Students
WHERE admissionYear = '2023-09-01' AND student_name = 'Emma Brown';

-- Students admitted before 2024 or named Jonathan Doe
SELECT * FROM Students
WHERE admissionYear < '2024-01-01' OR student_name = 'Jonathan Doe';

-- Students not admitted in 2023
SELECT * FROM Students
WHERE NOT YEAR(admissionYear) = 2023;

/* 
ORDER BY: Sorting Query Results
*/
-- Sort students by name in ascending order
SELECT * FROM Students
ORDER BY student_name ASC;

-- Sort students by admission year in descending order
SELECT * FROM Students
ORDER BY admissionYear DESC;

/*
using GROUP BY with aggregate functions
*/
SELECT * FROM students GROUP BY studentName

/* 
MIN
*/
-- Find the earliest admission year
SELECT MIN(admissionYear) AS earliest_admission
FROM Students;

-- Find the minimum course ID
SELECT MIN(course_id) AS min_course_id
FROM Courses;

/*
MAX
*/
-- Find the most recent admission year
SELECT MAX(admissionYear) AS latest_admission
FROM Students;

-- Find the maximum number of units in a course
SELECT MAX(unit_id) AS max_units
FROM Units;

/*
COUNT
*/
-- Count the total number of students
SELECT COUNT(*) AS total_students
FROM Students;

-- Count students admitted in 2023
SELECT COUNT(*) AS students_2023
FROM Students
WHERE YEAR(admissionYear) = 2023;

/*
SUM
*/
-- Calculate total course IDs
SELECT SUM(course_id) AS total_courses
FROM Courses;

-- Total units across all courses
SELECT SUM(unit_id) AS total_units
FROM Units;

-- Find the average course ID
SELECT AVG(course_id) AS avg_course_id
FROM Courses;

/*
AVG
*/
-- Average number of units per course
SELECT AVG(unit_id) AS avg_units
FROM Units;

/*
using GROUP BY with aggregate functions
*/
-- Count students admitted each year
SELECT YEAR(admissionYear) AS admission_year, COUNT(*) AS student_count
FROM Students
GROUP BY YEAR(admissionYear);

-- Find the maximum units and average units per course
SELECT course_id, MAX(unit_id) AS max_units, AVG(unit_id) AS avg_units
FROM Units
GROUP BY course_id;

/*
WILD CARDS: Pattern Matching
*/
-- Find students with names starting with 'J'
SELECT * FROM Students
WHERE student_name LIKE 'J%';

-- Find students whose names contain 'son'
SELECT * FROM Students
WHERE student_name LIKE '%son%';

-- Find students with exactly 5-character names
SELECT * FROM Students
WHERE student_name LIKE '_____';

/*
UNIONS: Combining Results
Combine names of students and courses
*/
SELECT student_name AS name FROM Students
UNION
SELECT course_name AS name FROM Courses;

-- Combine students admitted in 2023 and 2024
SELECT * FROM Students WHERE YEAR(admissionYear) = 2023
UNION
SELECT * FROM Students WHERE YEAR(admissionYear) = 2024;

/*
INNER JOIN - Retrieve matching rows from both tables.
*/
SELECT Students.StudentName, Courses.CourseName
FROM Students
INNER JOIN Registrations ON Students !!

SELECT Students.StudentID, Students.StudentName, Courses.CourseName
FROM Students
INNER JOIN Registrations ON Students.StudentID = Registrations.StudentID
INNER JOIN Courses ON Registrations.CourseID = Courses.CourseID;

/*
LEFT JOIN (LEFT OUTER JOIN) - Retrieve all rows from the left table and matches from the right.
*/
SELECT Students.StudentName, Courses.CourseName
FROM Students
LEFT JOIN Registrations ON Students.StudentID = Registrations.StudentID
LEFT JOIN Courses ON Registrations.CourseID = Courses.CourseID;

/*
RIGHT JOIN (RIGHT OUTER JOIN) - Retrieve all rows from the right table and matches from the left.
*/
SELECT Courses.CourseName, Students.StudentName
FROM Courses
RIGHT JOIN Registrations ON Courses.CourseID = Registrations.CourseID
RIGHT JOIN Students ON Registrations.StudentID = Students.StudentID;

/*
FULL JOIN (FULL OUTER JOIN) - Combine all data, showing matches and non-matches from both tables.
*/
SELECT Students.StudentID, Students.StudentName, Courses.CourseName
FROM Students
LEFT JOIN Registrations ON Students.StudentID = Registrations.StudentID
LEFT JOIN Courses ON Registrations.CourseID = Courses.CourseID
UNION
SELECT Students.StudentID, Students.StudentName, Courses.CourseName
FROM Students
RIGHT JOIN Registrations ON Students.StudentID = Registrations.StudentID
RIGHT JOIN Courses ON Registrations.CourseID = Courses.CourseID;

/*
CROSS JOIN (CROSS JOIN) - Generate all possible combinations of rows between two tables.
*/
SELECT Students.StudentName, Courses.CourseName
FROM Students
CROSS JOIN Courses;

/*
SELF JOIN - Compare rows within the same table.
*/
SELECT S1.StudentName AS Student1, S2.StudentName AS Student2, YEAR(S1.admissionDate) AS AdmissionYear
FROM Students S1
JOIN Students S2 ON YEAR(S1.admissionDate) = YEAR(S2.admissionDate) AND S1.StudentID <> S2.StudentID;
