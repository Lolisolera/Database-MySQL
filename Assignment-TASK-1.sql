-- DB ASSIGNMENT TASK 1
-- Develop a database for a local leisure centre


-- STEP 1: "LEISURE CENTRE" DATABASE CREATION

CREATE DATABASE LeisureCentre; 

USE LeisureCentre;


-- STEP 2: DESIGN OF THE DATABASE SCHEMA. CREATION OF THE NECESSARY TABLES FOR THE EXISITING ENTITY.

CREATE TABLE Course (
    CourseID INT PRIMARY KEY,
    Level VARCHAR(255),
    Sessions INT,
    Instructor VARCHAR(255),
    StartDate DATE,
    LessonTime TIME
);


CREATE TABLE Lessons (
    LessonID INT PRIMARY KEY,
    CourseID INT,
    MemberID INT,
    FOREIGN KEY (CourseID) REFERENCES Course(CourseID),
    FOREIGN KEY (MemberID) REFERENCES Members(MemberID)
);

CREATE TABLE Members (
    MemberID INT PRIMARY KEY,
    Firstname VARCHAR(255),
    Surname VARCHAR(255),
    DOB DATE,
    Address VARCHAR(255),
    City VARCHAR(255)
);

desc Course;
select * from Course;

desc Lessons;
select * from Lessons;

desc Members;
select * from Members;


-- STEP 3: INSERT DATA INTO EACH OF THE TABLES

INSERT INTO Course (CourseID, Level, Sessions, Instructor, StartDate, LessonTime)
VALUES
    (1, 'Beginner', 10, 'Matt Herson', '2023-01-10', '10:00:00'),
    (2, 'Intermediate', 8, 'Anne Grey', '2023-02-15', '14:30:00'),
    (3, 'Advanced', 12, 'Christian Flinn', '2023-03-20', '16:00:00'),
    (4, 'Beginner', 9, 'Matt Herson', '2023-04-05', '11:15:00'),
    (5, 'Intermediate', 7, 'Anne Grey', '2023-05-12', '16:00:00'),
    (6, 'Advanced', 11, 'Christian Flinn', '2023-03-20', '09:30:00');
   


INSERT INTO Lessons (LessonID, CourseID, MemberID)
VALUES
    (1, 1, 1),
    (2, 1, 2),
    (3, 2, 3),
    (4, 3, 4),
    (5, 4, 5),
    (6, 6, 6);

INSERT INTO Members (MemberID, Firstname, Surname, DOB, Address, City)
VALUES
    (1, 'Amy', 'Adammy', '1995-07-20', '123 High St', 'London'),
    (2, 'John', 'Morna', '1988-04-15', '456 Brick Road', 'London'),
    (3, 'Betty', 'Mabbed', '2000-09-05', '195 Baker St', 'London'),
    (4, 'Charlie', 'Alt', '1976-11-30', '321 Sesame St', 'London'),
    (5, 'Abdurrahman', 'Tailly', '1999-02-10', '322 Rose St', 'London'),
    (6, 'Anthony', 'Smith', '1997-01-11', '3 Wagon St', 'London');



-- STEP 4: Use the SQL AND, OR and NOT Operators in your query 
	-- (The WHERE clause can be combined with AND, OR, and NOT operators)
    
-- Query 1: Retrieve courses with a CourseID below 5 and an instructor from a specific list of instructors:    

SELECT *
FROM Course
WHERE CourseID < 5
AND Instructor IN ('Matt Herson', 'Anne Grey');


-- Query 2: Retrieve courses with a CourseID above 5 and a lesson time in the morning or afternoon:

SELECT *
FROM Course
WHERE CourseID > 5
AND (LessonTime BETWEEN '08:00:00' AND '12:00:00'
     OR LessonTime BETWEEN '12:01:00' AND '16:00:00');
     


-- STEP 5: Order the above results by:

	-- Query 1:startDate in “course” table: 
    -- Retrieve all records from the "Course" table and 
        -- order them by the "StartDate" column (in ascending order)
    
SELECT *
FROM Course
ORDER BY StartDate;
  
    
	-- Query 2: MemberID in “members” table:
	-- Retrieve all records from the "Members" table and 
        -- order them by the "MemberID" column (in ascending order)

SELECT *
FROM Members
ORDER BY MemberID;


-- STEP 6:UPDATE the following:

-- Query 1: Update "Members" table, change the addresses of any three members.

UPDATE Members
SET Address = '53 Old Lion St '
WHERE MemberID = 1
LIMIT 1;


UPDATE Members
SET Address = '94 Pilgrims Close'
WHERE MemberID = 2
LIMIT 1;


UPDATE Members
SET Address = '112 Bannister House'
WHERE MemberID = 3
LIMIT 1;


select * from Members;


  -- Query 2:update the "Course" table.
	 -- Change the startDate and lesson time for three of the sessions.

UPDATE Course
SET StartDate = '2023-01-11', LessonTime = '08:30:00'
WHERE CourseID = 1
LIMIT 1;


UPDATE Course
SET StartDate = '2023-02-17', LessonTime = '13:45:00'
WHERE CourseID = 2
LIMIT 1;


UPDATE Course
SET StartDate = '2023-06-30', LessonTime = '10:15:00'
WHERE CourseID = 3
LIMIT 1;


select * from Course;

-- STEP 7: 	Use the SQL MIN () and MAX () Functions to return the smallest and largest value 
	
    -- Query 1: of the LessonID column in the “lesson” table
    
    -- Return of the smallest LessonID (MIN LessonID):
    
SELECT MIN(LessonID) AS Smallest_LessonID
FROM Lessons;

 -- Return of the largest LessonID (MAX LessonID):
 
SELECT MAX(LessonID) AS Largest_LessonID
FROM Lessons;


-- Query 2: Of the membersID column in the “members” table 

   -- Smallest MemberID (MIN MemberID):
   
   SELECT MIN(MemberID) AS Smallest_MemberID
   FROM Members;
   
   -- Largest MemberID (MAX MemberID):
   
   SELECT MAX(MemberID) AS Largest_MemberID
   FROM Members;
   
   
-- STEP 8: Use the SQL COUNT (), AVG () and SUM () Functions for these:
	
    -- Query 1: Count the total number of members in the “members” table
    
SELECT COUNT(*) AS TotalMembers
FROM Members;


    -- Query 2: Count the total number of sessions in the "members" table
    
SELECT COUNT(*) AS TotalSessions
FROM Lessons;

  
    -- Query 3: Find the average session time for all "sessions" in course table 

SELECT AVG(LessonTime) AS AverageSessionTime
FROM Course;


-- STEP 8: WILDCARD queries (like operator) 

-- Query 1: Find all the people from the “members” table whose last name starts with A.

SELECT *
FROM Members
WHERE Surname LIKE 'a%';


select * from Members;

-- Query 2: Find all the people from the “members” table whose last name ends with A.

SELECT *
FROM Members
WHERE Surname LIKE '%a';

-- Query 3: Find all the people from the “members” table that have "ab" in any position in the last name.

SELECT *
FROM Members
WHERE Surname LIKE '%ab%';


-- Query 4: Find all the people from the “members” table that have "b" in the second position in their first name.

SELECT *
FROM Members
WHERE SUBSTRING(Firstname, 2, 1) = 'b';


-- Query 5: Find all the people from the “members” table whose last name starts with "a" and are at least 3 characters in length:

SELECT *
FROM Members
WHERE Surname LIKE 'a%' AND LENGTH(Surname) >= 3;


-- Query 6: Find all the people from the “members” table whose last name starts with "a" and ends with "y"

SELECT *
FROM Members
WHERE Surname LIKE 'a%y';


-- Query 7: Find all the people from the “members” table whose last name does not start with "a" and end with "y"

SELECT *
FROM Members
WHERE Surname NOT LIKE 'a%y';

-- In the above query, I have all of the data back as the result, 
      -- except by the first row, as the surname was "Adammy".




