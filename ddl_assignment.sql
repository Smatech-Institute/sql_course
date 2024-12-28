--To add the date_of_birth and email columns:
ALTER TABLE Students
ADD COLUMN date_of_birth DATE NOT NULL;

ALTER TABLE Students
ADD COLUMN email VARCHAR(100) UNIQUE NOT NULL;

--To add the course_duration and course_description columns:
ALTER TABLE Courses
ADD COLUMN course_duration INT NOT NULL;

ALTER TABLE Courses
ADD COLUMN course_description TEXT;
