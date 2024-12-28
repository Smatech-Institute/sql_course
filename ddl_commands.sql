--School Database
CREATE DATABASE SchoolDB;
USE SchoolDB;

-- Students table
CREATE TABLE Students (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    student_name VARCHAR(100) NOT NULL
);

-- Courses table
CREATE TABLE Courses (
    course_id INT PRIMARY KEY AUTO_INCREMENT,
    course_name VARCHAR(100) NOT NULL
);

-- Units table
CREATE TABLE Units (
    unit_id INT PRIMARY KEY AUTO_INCREMENT,
    unit_name VARCHAR(100) NOT NULL
);

-- Registration table
CREATE TABLE Registration (
    registration_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT NOT NULL,
    course_id INT NOT NULL,
    unit_id INT NOT NULL,
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id),
    FOREIGN KEY (unit_id) REFERENCES Units(unit_id)
);

--Updating Existing tables with create constraints

--Drop Database 
DROP DATABASE school;

--Drop Table students
DROP TABLE students;

--ALTER Table
ALTER TABLE students
ADD admissionDate date;

ALTER TABLE students
DROP COLUMN admissionDate;

ALTER TABLE students CHANGE admissionDate admissionYear VARCHAR(255);

/*Assignment
Add date of birth and email columns on students table
Add course duration and course description columns on course table