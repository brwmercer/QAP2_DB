CREATE TABLE students (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(50),
    school_enrollment_date DATE
);

CREATE TABLE professors (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    department VARCHAR(50)
);

CREATE TABLE courses (
    id SERIAL PRIMARY KEY,
    course_name VARCHAR(50),
    course_description TEXT,
    professor_id INT REFERENCES professors(id)
);

CREATE TABLE enrollments (
    student_id INT REFERENCES students(id),
    course_id INT REFERENCES courses(id),
    enrollment_date DATE,
    PRIMARY KEY (student_id, course_id)
);

-- Add Data:

INSERT INTO students (first_name, last_name, email, school_enrollment_date) VALUES
('Connor', 'Mcdavid', 'mvp@nhl.com', '2025-02-05'),
('Nathan', 'Mackinnon', 'stud@nhl.com', '2025-02-05'),
('Lane', 'Hutson', 'roty@nhl.com', '2025-02-05'),
('Nikita', 'Kucherov', 'rat@nhl.com', '2025-02-05'),
('Sidney', 'Crosby', 'thebest@nhl.com', '2025-02-05');

INSERT INTO professors (first_name, last_name, department) VALUES
('Mario', 'Lemieux', 'Offense'),
('Nicklas', 'Lidstrom', 'Defense'),
('Patrick', 'Roy', 'Goaltending'),
('Jon', 'Cooper', 'Coaching');


INSERT INTO courses (course_name, course_desrciption, professor_id) VALUES
('Offense', 'Hockey Offensive Fundamentals', 1),
('Defense', 'Hockey Defensive Fundamentals', 2),
('Goaltending', 'Intro to goaltending', 3),
('Coaching', 'Becoming a leader', 4);

INSERT INTO enrollments (student_id, course_id, enrollment_date) VALUES
(1, 1, '2025-02-05'),
(2, 4, '2025-02-05'),
(3, 2, '2025-02-05'),
(4, 3, '2025-02-05'),
(5, 1, '2025-02-05');

-- Complete Tasks

SELECT students.first_name || " " || students.last_name AS student_full_name
FROM students
JOIN enrollments ON students.id = enrollments.student_id
JOIN courses ON enrollments.course_id = courses.id
WHERE courses.course_name = 'Offense'; -- No Physics 101 because Hockey Players don't like learning physics

SELECT courses.course_name, professors.first_name || " " || professors.last_name AS professor_full_name
FROM courses
JOIN professors ON courses.professor_id = professors.id;

SELECT DISTINCT courses.course_name
FROM courses
JOIN enrollments ON courses.id = enrollments.course_id;

-- Update Student Email
UPDATE students
SET email = 'goat@nhl.com'
WHERE id = 5;

-- Remove student from a class
DELETE FROM enrollments
WHERE student_id = 4 AND course_id = 3;