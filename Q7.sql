CREATE DATABASE Q7;

USE Q7;

CREATE TABLE Employee (
    EmployeeNo INT PRIMARY KEY,
    EmployeeName VARCHAR(50),
    Job VARCHAR(30),
    DepartmentNo INT,
    Salary DECIMAL(10, 2)
);

INSERT INTO Employee (EmployeeNo, EmployeeName, Job, DepartmentNo, Salary) VALUES
(1, 'John Doe', 'ASP', 101, 50000),
(2, 'Jane Smith', 'Developer', 102, 60000),
(3, 'Mike Ross', 'ASP', 101, 55000),
(4, 'Rachel Green', 'Manager', 103, 75000),
(5, 'Monica Geller', 'Analyst', 102, 58000);


SELECT * FROM Employee;

CREATE VIEW EmployeeView AS
SELECT * FROM Employee;

-- Display the View
SELECT * FROM EmployeeView;

SELECT EmployeeNo, EmployeeName, DepartmentNo, Job 
FROM EmployeeView;

SELECT * 
FROM EmployeeView
WHERE Job = 'ASP';

-- Update the department number of an employee through the view
UPDATE EmployeeView
SET DepartmentNo = 104
WHERE EmployeeNo = 3;

-- Verify the change in the original table
SELECT * FROM Employee;
