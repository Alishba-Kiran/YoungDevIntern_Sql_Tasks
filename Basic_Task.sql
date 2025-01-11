--Create the database
Create database Internship_DB

--Use the database
Use Internship_DB

--Create Employees table
Create table Employees(
    EmployeeID INT NOT NULL constraint Emp_ID PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Position VARCHAR(100) NOT NULL,
    Salary MONEY NOT NULL
)

--Insert records into Employees table
Insert into Employees(EmployeeID, Name, Position, Salary)
Values(1, 'John Doe', 'Software Engineer', 60000),
(2, 'Jane Smith', 'Project Manager', 75000),
(3, 'Alice Johnson', 'Data Analyst', 55000),
(4, 'Bob Brown', 'UX Designer', 48000),
(5, 'Charlie Davis', 'System Administrator', 52000)

--Create Departments table
Create table Departments(
    DepartmentID INT NOT NULL constraint Dept_ID PRIMARY KEY,
    DepartmentName VARCHAR(100) NOT NULL,
    Location VARCHAR(100) NOT NULL
)

--Insert records into Departments table
insert into Departments(DepartmentID, DepartmentName, Location)
Values(1, 'Development', 'New York'),
(2, 'Marketing', 'San Francisco'),
(3, 'Sales', 'Los Angeles'),
(4, 'HR', 'Chicago'),
(5, 'Finance', 'Seattle')

--Retrieve Employees' Names and Positions
Select Name, Position from Employees

--List Departments with Locations
Select DepartmentName, Location from Departments

--Select Employees with a salary greater than $50,000
Select Name, Salary from Employees
where Salary > 50000

--Sort Employees by Name
select * from Employees
order by Name asc

--List Departments in specific cities(e.g., San Francisco and Chicago)
Select * from Departments
where Location in ('San Francisco', 'Chicago')