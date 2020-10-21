Drop Table employees
Drop Table Department_Employee_No
Drop Table Departments
Drop Table Salaries
Drop Table Employee_Titles

CREATE TABLE Employee_Titles (
	Title_id VARCHAR NOT NULL,
	Title VARCHAR NOT NULL,
	PRIMARY KEY (Title_id)
);

CREATE TABLE Departments (
	Dept_No VARCHAR NOT NULL,
	Dept_name VARCHAR NOT NULL,
	PRIMARY KEY (Dept_No)
);


CREATE TABLE Employees (
	Emp_ID INTEGER NOT NULL, 
	Emp_title_id VARCHAR NOT NULL,
	Birth_date VARCHAR NOT NULL,
	First_name VARCHAR NOT NULL,
	Last_name VARCHAR NOT NULL,
	Sex VARCHAR NOT NULL,
	Hire_date DATE NOT NULL,
	PRIMARY KEY (Emp_ID),
	FOREIGN KEY (Emp_title_id) REFERENCES Employee_Titles (Title_id)
);

CREATE TABLE Salaries (
	Emp_ID INTEGER NOT NULL,
	Salary INTEGER NOT NULL,
	PRIMARY KEY (Emp_ID),
	FOREIGN KEY (Emp_ID) REFERENCES Employees (Emp_ID)
);

drop TABLE Department_Employee_No

CREATE TABLE Department_Employee_No (
	Dept_No VARCHAR NOT NULL,
	FOREIGN KEY (Dept_No) REFERENCES Departments (Dept_No),
	Emp_ID INTEGER NOT NULL,
	FOREIGN KEY (Emp_ID) REFERENCES Employees (Emp_ID),
	PRIMARY KEY (Emp_ID, Dept_No)
);

SELECT * FROM Employees
SELECT * FROM Department_Employee_No

DROP TABLE Department_Managers

CREATE TABLE Department_Managers (
	Dept_No VARCHAR NOT NULL,
	FOREIGN KEY (Dept_No) REFERENCES Departments (Dept_No),
	Emp_ID INTEGER NOT NULL,
	FOREIGN KEY (Emp_ID) REFERENCES Employees (Emp_ID),
	PRIMARY KEY (Dept_No, Emp_ID)
);

SELECT * FROM Department_Managers


SELECT * FROM Department_Managers





SELECT * FROM department_employee_no
SELECT * FROM department_managers
SELECT * FROM departments
SELECT * FROM employee_titles
SELECT * FROM employees
SELECT * FROM salaries

-- List following details of each employee with employee number, last name, first name, sex, and salary. 
SELECT e.Emp_ID, e.last_name, e.first_name, e.sex, s.salary
FROM Employees e
LEFT JOIN Salaries s
ON e.Emp_ID = s.Emp_ID

1. List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT * FROM employees

-- List first name, last name, and hire date for employees hired in 1986
SELECT first_name, last_name, hire_date FROM employees
WHERE hire_date > '12/31/1985'
	and hire_date < '01/01/1987';

SELECT * FROM department_managers

SELECT * FROM departments

--list Manager of Each Deparment with dept. number, name, employee no, name
SELECT dm.Dept_No, d.Dept_name, dm.Emp_ID,  e.First_name, e.Last_name
FROM department_managers dm
LEFT JOIN Departments d
ON dm.Dept_No = d.Dept_No
LEFT JOIN Employees e
ON e.Emp_ID = dm.Emp_ID

--list department of each employee with emp_id, name, and dept. name
SELECT e.Emp_ID, e.Last_name, e.First_name, d.Dept_name
FROM Employees e
LEFT JOIN Department_employee_no de
ON e.Emp_Id = de.emp_id
LEFT JOIN Departments d
ON de.dept_no = d.Dept_no

-- List first name, last name, and sex for employees whose first name is Hercules
-- And last names begin with B

select first_name, last_name, sex
from Employees
WHERE 
	first_name = 'Hercules'
	AND last_name LIKE 'B%';
	
-- List all employees in the sales department, employee number, last_name, first_name, department_name
SELECT * from departments

CREATE VIEW employee_departments AS
SELECT e.Emp_ID, e.Last_name, e.First_name, d.Dept_name
FROM Employees e
LEFT JOIN Department_employee_no de
ON e.Emp_Id = de.emp_id
LEFT JOIN Departments d
ON de.dept_no = d.Dept_no

SELECT emp_id, last_name, first_name, dept_name
FROM employee_departments
WHERE dept_name = 'Sales';

--List employees of Sales and Development Departments 
SELECT emp_id, last_name, first_name, dept_name
FROM employee_departments
WHERE 
	dept_name = 'Sales'
	OR dept_name = 'Development';

--In descending order, list the frequency count of employee last names, how many employees share each last name.
SELECT last_name, COUNT(last_name) AS "Last Name"
FROM Employees
GROUP BY last_name
ORDER BY "Last Name" DESC;