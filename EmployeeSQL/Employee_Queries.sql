--employee salary
--Select need info from employees table and join with needed salary info from salary table

SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex,salaries.salary
FROM salaries
INNER JOIN employees ON
salaries.emp_no=employees.emp_no;

--Hire date
--Select needed info and specify the date needed
SELECT first_name, last_name, hire_date
FROM employees
where hire_date BETWEEN '1986-01-01' AND '1986-12-31';

--dept managers
--Perform a stacked join in order to retrive all info needed from employees, dept_manager and departments tables

SELECT e.emp_no,e.last_name,e.first_name, md.dept_no, d.dept_name
FROM
    employees e
    JOIN dept_manager md ON md.emp_no = e.emp_no
    JOIN departments d ON d.dept_no = md.dept_no;

--dept name & number
SELECT employ.emp_no, employ.last_name, employ.first_name,deptEMP.dept_no, dept.dept_name
FROM employees AS employ
INNER JOIN 
dept_emp AS deptEMP
ON employ.emp_no = deptEMP.emp_no
INNER JOIN
departments AS dept
ON deptEMP.dept_no = dept.dept_no;

--hercules
--select names and specify the first name and last initial
SELECT first_name, last_name,sex
FROM employees
where first_name ='Hercules' and last_name  LIKE 'B%';

--sales department
--Stacked query to connect employees to specific department
SELECT emp_no, last_name, first_name
FROM employees
WHERE emp_no IN
(
  SELECT emp_no
  FROM dept_emp
  WHERE dept_no IN
  (
    SELECT dept_no
    FROM departments
    WHERE dept_name = 'Sales'
  )
);

--sales and development
--Similar method to dept managers problem, with added spcification of departments
SELECT e.emp_no,e.last_name,e.first_name, de.dept_no, d.dept_name
FROM
    employees e
    JOIN dept_emp de ON de.emp_no = e.emp_no
    JOIN departments d ON d.dept_no = de.dept_no
	WHERE dept_name = 'Sales' or dept_name = 'Development';
	
--shared last name
-- count each name and set result to frequency, group by matching names and set descending order
SELECT last_name, COUNT(last_name) AS "Frequency"
FROM employees
GROUP BY last_name
ORDER BY "Frequency" DESC;
