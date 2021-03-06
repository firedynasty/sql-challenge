
-- List following details of each employee: with salary

SELECT e.Emp_ID, e.last_name, e.first_name, e.sex, s.salary
FROM Employees e
LEFT JOIN Salaries s
ON e.Emp_ID = s.Emp_ID

-- List first name, last name, and hire date for employees hired in 1986
SELECT first_name, last_name, hire_date FROM employees
WHERE hire_date > '12/31/1985'
	and hire_date < '01/01/1987';


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