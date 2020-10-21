CREATE TABLE Employees (
	Emp_ID INTEGER NOT NULL, 
	Emp_title_id VARCHAR NOT NULL,
	Birth_date VARCHAR NOT NULL,
	First_name VARCHAR NOT NULL,
	Last_name VARCHAR NOT NULL,
	Sex VARCHAR NOT NULL,
	Hire_date DATE NOT NULL,
	PRIMARY KEY (Emp_ID)
);

SELECT * FROM Employees

CREATE TABLE Department_Employee_No (
	Emp_ID INT NOT NULL,
	Dept_ID VARCHAR NOT NULL,
	FOREIGN KEY(Emp_ID) REFERENCES Employees (Emp_ID),
	PRIMARY KEY (Emp_ID, Dept_ID)
);


DROP TABLE Department_Managers

CREATE TABLE Department_Managers (
	Dept_ID VARCHAR NOT NULL,
	Emp_ID INTEGER NOT NULL,
	FOREIGN KEY(Emp_ID) REFERENCES Employees (Emp_ID)
);




CREATE TABLE Salaries (
	Emp_ID INTEGER NOT NULL,
	Salary INTEGER NOT NULL,
	FOREIGN KEY(Emp_ID) REFERENCES Employees (Emp_ID)
);

CREATE TABLE Departments (
	Dept_ID VARCHAR NOT NULL,
	Dept_name VARCHAR NOT NULL
	--FOREIGN KEY(Dept_ID) REFERENCES Department_Employee_No (Dept_ID)
	--there is no unique constraint matching given keys for referenced table
);

CREATE TABLE Employee_Titles (
	Title_id VARCHAR NOT NULL,
	Title VARCHAR NOT NULL
	--FOREIGN KEY(Title_id) REFERENCES Employees (Emp_title_id)
	--there is no unique constraint matching given keys for referenced table
);

SELECT * FROM department_employee_no
SELECT * FROM department_managers
SELECT * FROM departments
SELECT * FROM employee_titles
SELECT * FROM employees
SELECT * FROM salaries

-- List following details of each employee
SELECT * FROM employees

-- List first name, last name, and hire date for employees hired in 1986
SELECT first_name, last_name, hire_date FROM employees
WHERE hire_date > '12/31/1985'
	and hire_date < '01/01/1987';

SELECT * FROM department_managers

--list Manager of Each Deparment with dept. number, name, employee no, name
SELECT dm.Dept_ID, d.Dept_name, dm.Emp_ID,  e.First_name, e.Last_name
FROM department_managers dm
LEFT JOIN Departments d
ON dm.Dept_ID = d.Dept_ID
LEFT JOIN Employees e
ON e.Emp_ID = dm.Emp_ID

--list department of each employee with emp_id, name, and dept. name
SELECT e.Emp_ID, e.Last_name, e.First_name, d.Dept_name
FROM Employees e
LEFT JOIN Department_employee_no de
ON e.Emp_Id = de.emp_id
LEFT JOIN Departments d
ON de.dept_id = d.Dept_id

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
ON de.dept_id = d.Dept_id

SELECT * FROM employee_departments

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