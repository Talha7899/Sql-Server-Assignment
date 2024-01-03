create database Company;
use Company;

CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50)
);

CREATE TABLE Projects(
	ProjectID int primary key,
	ProjectName varchar(50) not null,
	StartDate date not null
);

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DepartmentID INT foreign key
	references Departments(DepartmentID),
	ProjectID INT foreign key
	references Projects(ProjectID),
    Salary DECIMAL(10, 2)
);

select * from Employees;
select * from Departments;
select * from Projects;

INSERT INTO Departments (DepartmentID, DepartmentName)
VALUES
    (1, 'HR'),
    (2, 'IT'),
    (3, 'Finance');

INSERT INTO Projects (ProjectID, ProjectName, StartDate)
VALUES
    (1, 'Database Integration', '2024-12-25'),
    (2, 'Database Connectivity', '2023-10-20'),
    (3, 'Database Management Suite', '2022-07-15'),
	(4, 'Unified Database Platform', '2020-08-12'),
	(5, 'Database Synchronization Tool', '2019-05-10'),
	(6, 'NexTech Innovate', '2018-06-08'),
	(7, 'EcoScape Initiative', '2016-04-08'),
	(8, 'JourneyQuest Chronicles', '2012-01-06'),
	(9, 'HealthSphere Connect', '2014-02-02'),
	(10, 'InnoVibe Dynamics', '2008-05-15');

INSERT INTO Employees (EmployeeID, FirstName, LastName, DepartmentID,ProjectID, Salary)
VALUES
    (1, 'John', 'Doe', 1,2, 60000.00),
    (2, 'Jane', 'Smith', 2,1, 55000.00),
    (3, 'Mike', 'Johnson', 1,3, 65000.00),
    (4, 'Emily', 'Williams', 3,5, 70000.00),
    (5, 'David', 'Brown', 2,6, 50000.00),
    (6, 'Sarah', 'Miller', 1,4, 62000.00),
    (7, 'Chris', 'Wilson', 3,7, 75000.00),
    (8, 'Anna', 'Jones', 2,8, 53000.00),
    (9, 'Brian', 'Taylor', 1,9, 58000.00),
    (10, 'Laura', 'Anderson', 3,10, 72000.00);


4. Assign each employee to a department in the Employees table.

select EmployeeID,FirstName,LastName,DepartmentName from Employees as e Join
Departments as d on e.DepartmentID = d.DepartmentID;

5. Retrieve the details of employees whose salary is above 50000.

select EmployeeID,FirstName,LastName,Salary from Employees where Salary > 50000;

6. Fetch a list of all employees along with the department they belong to.

select EmployeeID,FirstName,LastName,DepartmentName from Employees as e Join
Departments as d on e.DepartmentID = d.DepartmentID;

7. Retrieve the employees whose last name starts with 'S'.

select * from Employees where LastName like 's%';

8. Retrieve the projects with names containing the word 'Database'.

select * from Projects where ProjectName like '%Database%';

9. Calculate the total salary of all employees.

select SUM(Salary) as 'Sum of all Employees Salary' from Employees;

10.Find the department with the highest average salary.

SELECT d.DepartmentName, AVG(e.Salary) AS AverageSalary
FROM Employees as e
JOIN Departments as d ON e.DepartmentID = d.DepartmentID
GROUP BY d.DepartmentName
ORDER BY AVG(e.Salary) DESC;
