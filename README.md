# sql-challenge

**EmployeeSQL** directory contains the table_schema.sql and query.sql files.  They were used to build the database in Postgres.  

The Dataset is from employees from Pewlett Hackard from the 1980s and 1990s.

The tables modelled and analyzed were:
	* Department Nos with the Employee Nos
	* Department Managers
	* Employees
	* Employee Titles
	* Salaries
	* Department Names

PostgreSQL was used to join together the tables for query lookups.

The tables returned with the corresponding information:
	* Details of the employees with salaries
	* Details of employees in 1986
	* Details of manager information 
	* Details of Employees with the name "Hercules B."
	* Details of Employees in Sales
	* Details of Employees in Sales / or Development
	* Details of Last Name based on Frequency

There is a Entity Relationship Diagram of the tables ![Image of Table](/EmployeeSQL/ERD_Table.png)

The data is graphed to see the average salary per department ![Image of Average_Salary](/EmployeeSQL/average_salary.png) and the most common salary by histogram ![Image of Most_Common_Salary](/EmployeeSQL/most_common_salary.png).
