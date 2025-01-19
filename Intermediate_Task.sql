--Use the database
Use Internship_DB

-- Add the DepartmentID column to the Employees table
Alter table Employees
Add DepartmentID INT

-- Add the Foreign Key constraint for DepartmentID to the Employees table
ALTER TABLE Employees
ADD CONSTRAINT FK_Department FOREIGN KEY (DepartmentID)
REFERENCES Departments(DepartmentID)

--Update Employees to set DepartmentID
Update Employees
set DepartmentID = 1
where EmployeeID = 1

Update Employees
set DepartmentID = 2
where EmployeeID = 3

update Employees
set DepartmentID = 3
where EmployeeID = 4

update Employees
set DepartmentID = 4
where EmployeeID = 5

update Employees
set DepartmentID = null
where EmployeeID = 2

--Inner join to list employees and their departments
Select Employees.EmployeeID, Employees.Name, Departments.DepartmentID, Departments.DepartmentName
from Employees inner join Departments on Employees.DepartmentID = Departments.DepartmentID

--Left join to list all employees, including those without departments
Select Employees.EmployeeID, Employees.Name, Departments.DepartmentID, Departments.DepartmentName
from Employees left join Departments on Employees.DepartmentID = Departments.DepartmentID

-- Calculate average salary
Select AVG(Salary) as AverageSalary from Employees;

-- Total employees per department
Select Departments.DepartmentName, COUNT(Employees.EmployeeID) as TotalEmployees from Departments
left join Employees on Departments.DepartmentID = Employees.DepartmentID
group by Departments.DepartmentName

--Highest salary in each department
Select Departments.DepartmentName, MAX(Employees.Salary) as HighestSalary from Departments
left join Employees on Departments.DepartmentID = Employees.DepartmentID
group by Departments.DepartmentName

--Find employees earning more than the department's average salary
Select Employees.EmployeeID, Employees.Name, Employees.Salary from Employees
where Employees.Salary > (
    Select AVG(Salary) from Employees
    WHERE DepartmentID = Employees.DepartmentID
)

--List departments with more than 3 employees
Select Departments.DepartmentName from Departments
left join Employees on Departments.DepartmentID = Employees.DepartmentID
group by Departments.DepartmentName
having COUNT(Employees.EmployeeID) > 3