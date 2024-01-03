create database School;

use School;

CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(50)
);

CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Age INT,
    GPA DECIMAL(3, 2),
	CourseID INT FOREIGN KEY
	REFERENCES Courses(CourseID)
);

INSERT INTO Courses (CourseID, CourseName)
VALUES
    (1, 'Introduction to Programming'),
    (2, 'Web Development Basics'),
    (3, 'Database Management'),
    (4, 'Data Structures and Algorithms'),
    (5, 'JavaScript Fundamentals'),
    (6, 'Mobile App Development'),
    (7, 'Software Engineering Principles'),
    (8, 'Networking Essentials'),
    (9, 'Artificial Intelligence Basics'),
    (10, 'Cybersecurity Fundamentals');

select * from Courses;
select * from Students;

INSERT INTO Students (StudentID, FirstName, LastName, Age, GPA,CourseID)
VALUES
    (1, 'Alice', 'Johnson', 20, 3.75,2),
    (2, 'Bob', 'Smith', 22, 3.50,1),
    (3, 'Charlie', 'Davis', 21, 3.80,3),
    (4, 'Diana', 'Brown', 23, 3.90,1),
    (5, 'Eva', 'Miller', 20, 3.65,4),
    (6, 'Frank', 'Jones', 22, 3.70,5),
    (7, 'Grace', 'Wilson', 21, 3.85,3),
    (8, 'Henry', 'Anderson', 23, 3.95,6),
    (9, 'Ivy', 'Taylor', 20, 3.60,7),
    (10, 'Jack', 'Clark', 22, 3.75,9);



	
Retrieve a list of all students and the courses they are enrolled in, including those who are not enrolled in any course.

select StudentID,FirstName,LastName,Age,GPA,CourseName from Students as s right join Courses as c
on s.CourseID = c.CourseID;

Display the details of students who are enrolled in the course 'Web Development Basics'.

select * from Students as s Join Courses as c
on s.CourseID = c.CourseID
where CourseName = 'Web Development Basics';

Find out which courses have no enrolled students.

select * from Students as s right join
Courses as c on s.CourseID = c.CourseID
where s.StudentID is null;


4. List the students who are enrolled in any course, along with the course names.

select StudentID,FirstName,LastName,Age,GPA,CourseName from Students as s join
Courses as c on s.CourseID = c.CourseID;

5. Retrieve a list of all courses along with the number of students enrolled in each course, even if the count is zero.

SELECT c.CourseID, c.CourseName, COUNT(s.StudentID) AS NumberOfStudents
FROM Courses as c
LEFT JOIN Students as s ON c.CourseID = s.CourseID
GROUP BY c.CourseID, c.CourseName
ORDER BY c.CourseID;



