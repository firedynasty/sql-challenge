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



SELECT * FROM department_employee_no
SELECT * FROM department_managers
SELECT * FROM departments
SELECT * FROM employee_titles
SELECT * FROM employees
SELECT * FROM salaries