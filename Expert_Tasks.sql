--Use the database
Use Internship_DB

--Create Managers table
Create table Managers(
    ManagerID INT NOT NULL constraint Mgr_ID PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    DepartmentID INT NOT NULL constraint FK_Depart FOREIGN KEY (DepartmentID)
	REFERENCES Departments(DepartmentID)
)

--Insert records into Managers table
Insert into Managers (ManagerID, Name, DepartmentID)
Values(1, 'Michael Scott', 1),
(2, 'Pam Beesly', 2),
(3, 'Jim Halpert', 3),
(4, 'Angela Martin', 4),
(5, 'Oscar Martinez', 5)

-- Join Employees, Departments, and Managers
Select Employees.EmployeeID, Employees.Name as EmployeeName, Departments.DepartmentName, 
Managers.Name as ManagerName from Employees
INNER JOIN Departments on Employees.DepartmentID = Departments.DepartmentID
INNER JOIN Managers on Departments.DepartmentID = Managers.DepartmentID

--Rank Employees by salary within their Department
Select EmployeeID, Name, Salary,
ROW_NUMBER() over (partition by DepartmentID order by Salary DESC) as SalaryRank
from Employees

-- Rank Employees across the company
Select EmployeeID, Name, Salary, RANK() over (order by Salary DESC) as CompanyRank
from Employees

--Begin transaction
Begin transaction

Begin try
    -- Update employee salaries by 10%
    update Employees
    set Salary = Salary * 1.10;

    -- Commit the transaction
    commit transaction
end try
begin catch
    -- Rollback if there's an error
    rollback transaction
    print Error_Message()
end catch