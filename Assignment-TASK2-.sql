-- DB ASSIGNMENTS
-- TASK G: WHAT DO YOU UNDERSTAND BY LEFT AND RIGHT JOIN? EXPLAIN WITH AN EXAMPLE.

/*
LEFT JOIN and RIGHT JOIN are types of SQL JOIN operations that allow us to combine rows from two or more tables based on a related column. 
These operations are used to retrieve data from multiple tables, and they determine which table's data to include in the result set when there's a match or no match between the related columns. 
The choice between LEFT JOIN and RIGHT JOIN determines which table's data is preserved when there's no match.

LEFT (OUTER) JOIN:

A LEFT JOIN returns all the rows from the left (first) table and the matched rows from the right (second) table.
If there's no match in the right table, NULL values are returned for the right table's columns.

RIGHT (OUTER) JOIN:

A RIGHT JOIN returns all the rows from the right (second) table and the matched rows from the left (first) table.
If there's no match in the left table, NULL values are returned for the left table's columns.

*/

-- LEFT JOIN EXAMPLE:

-- Having these two tables, "students" and "courses". I want to retrieve a list of all students and the courses they are enrolled in, including students who are not enrolled in any courses.

CREATE DATABASE students;

USE students; 

CREATE TABLE students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50) NOT NULL
);



CREATE TABLE courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(50) NOT NULL,
    student_id INT, 
    FOREIGN KEY (student_id) REFERENCES students(student_id)
);


INSERT INTO students (student_id, student_name) VALUES
(1, 'Beatriz'),
(2, 'Lola'),
(3, 'Alice');

INSERT INTO courses (course_id, course_name, student_id) VALUES
(101, 'English', 1),
(102, 'Maths', 2),
(103, 'Science', 1);

-- I'm going to use LEFT JOIN to retrieve a list of all students and their enrolled courses, including students who are not enrolled in any courses.

SELECT students.student_name, courses.course_name
FROM students
LEFT JOIN courses ON students.student_id = courses.student_id;

-- The result shows that Beatriz is enrolled in "English and Science", Lola is enrolled in "Maths" and Alice is not enrolled in any course, that's why the correspondent value is "NULL".


-- RIGHT JOIN EXAMPLE:

-- Having these two tables "artists" and "albums". I want to retrieve a list of all artists and their albums, including artists who have not released any albums, if this is the case.

CREATE DATABASE Music;

USE Music; 


CREATE TABLE artists (
    artist_id INT PRIMARY KEY,
    artist_name VARCHAR(50) NOT NULL
);


CREATE TABLE albums (
    album_id INT PRIMARY KEY,
    album_title VARCHAR(50) NOT NULL,
    artist_id INT, 
    FOREIGN KEY (artist_id) REFERENCES artists(artist_id)
);

INSERT INTO artists (artist_id, artist_name) VALUES
(1, 'Max Richter'),
(2, 'Bonobo'),
(3, 'The Chemical Brothers');

INSERT INTO albums (album_id, album_title, artist_id) VALUES
(101, 'Exile', 1),
(102, 'Fragments', 2),
(103, 'For That Beautiful Feeling', 3),
(104, 'Voices', 1);

-- I'm going to use RIGHT JOIN to retrieve a list of all artists and their albums.

SELECT artists.artist_name, albums.album_title
FROM artists
RIGHT JOIN albums ON artists.artist_id = albums.artist_id;









