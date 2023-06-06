# sql-challenge
This repository contains a folder for the EmployeeDB assignment. The folder contains the schema for the tables, the required queries for the assignment and the ERD as a png.

SELECT employ.emp_no, employ.last_name, employ.first_name,deptEMP.dept_no, dept.dept_name
FROM employees AS employ
INNER JOIN 
dept_emp AS deptEMP
ON employ.emp_no = deptEMP.emp_no
INNER JOIN
departments AS dept
ON deptEMP.dept_no = dept.dept_no;
Dervied from:
https://www.sqlshack.com/sql-multiple-joins-for-beginners-with-examples/


SELECT e.emp_no,e.last_name,e.first_name, de.dept_no, d.dept_name
FROM
    employees e
    JOIN dept_emp de ON de.emp_no = e.emp_no
    JOIN departments d ON d.dept_no = de.dept_no
	WHERE dept_name = 'Sales' or dept_name = 'Development';
  Derived from:
https://stackoverflow.com/questions/48955290/sql-combining-join-and-where

