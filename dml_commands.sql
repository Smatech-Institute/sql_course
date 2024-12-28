-- Add a single student
INSERT INTO students (student_name, admissionDate)
VALUES ('Alice Johnson', '2000-05-14', 'alice.johnson@example.com');

-- Add multiple students
INSERT INTO students (student_name, date_of_birth, email) VALUES
('Bob Smith', '1999-11-22', 'bob.smith@example.com'),
('Carol Davis', '2001-03-08', 'carol.davis@example.com'),
('David Brown', '1998-07-30', 'david.brown@example.com');

INSERT INTO courses (course_name, course_duration, course_description) VALUES
('Computer Science', 48, 'A comprehensive program covering topics in software development, algorithms, and systems.'),
('Mechanical Engineering', 60, 'An in-depth program focused on mechanics, thermodynamics, and material science.'),
('Mathematics', 36, 'A focused program on advanced mathematics, statistics, and computational techniques.'),
('Physics', 48, 'A program exploring the principles of classical and modern physics.');

INSERT INTO units (unit_name) VALUES
('Programming Fundamentals'),
('Thermodynamics'),
('Linear Algebra'),
('Quantum Mechanics');

INSERT INTO registration (student_id, course_id, unit_id) VALUES
(1, 1, 1), -- Alice registered for Computer Science: Programming Fundamentals
(2, 2, 2), -- Bob registered for Mechanical Engineering: Thermodynamics
(3, 3, 3), -- Carol registered for Mathematics: Linear Algebra
(4, 4, 4), -- David registered for Physics: Quantum Mechanics
(1, 1, 3); -- Alice registered for Computer Science: Linear Algebra


-- Check the updated table
SELECT * FROM students;

-- Correcting the admission date for a student
UPDATE students
SET date_of_birth = '2000-11-22'
WHERE student_id = 2;

-- Remove students admitted before September 1, 2023
DELETE FROM Students
WHERE admissionYear < '2000-01-01';

-- Verify the deletion
SELECT * FROM Students;
