--Create Tables
CREATE TABLE departments(
	dept_no VARCHAR(5) NOT NULL,
	dept_name VARCHAR(20) NOT NULL
	);

CREATE TABLE titles(
	title_id VARCHAR(5) NOT NULL,
	title VARCHAR(20) NOT NULL);

CREATE TABLE employees(
	emp_no INT,
	emp_title_id VARCHAR(6) NOT NULL,
	birth_date DATE,
	first_name VARCHAR(20) NOT NULL,
	last_name VARCHAR(20) NOT NULL,	
	sex VARCHAR(2) NOT NULL,
	hire_date DATE
	);

CREATE TABLE salaries(
	emp_no INT,
	salary INT);

CREATE TABLE dept_manager(
	dept_no	VARCHAR(5) NOT NULL,
	emp_no INT,
	);
	
CREATE TABLE dept_emp(
	emp_no INT,
	dept_no	VARCHAR(5) NOT NULL);
	
--Check tables if csv was imported successfully
SELECT * FROM employees

--List detail of employees: emp_no, last_name, first_name, sex, salary
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
 FROM employees AS e
 JOIN salaries AS s
 ON (e.emp_no = s.emp_no);

--List first_name, last_name, with hire_date as 1986
SELECT first_name, last_name, hire_date
FROM employees 
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31'

--List the manager of each departments: dept_no, dept_name, managers emp_no, last_name, first_name
 SELECT  mgr.dept_no, d.dept_name, mgr.emp_no, e.last_name, e.first_name 
 FROM departments AS d
 JOIN dept_manager AS mgr
 	ON (d.dept_no = mgr.dept_no) 
 JOIN employees AS e
 	ON (mgr.emp_no = e.emp_no)
	;

--List the departments of each employee
 SELECT  d_emp.dept_no, d.dept_name, e.emp_no, e.last_name, e.first_name 
 FROM dept_emp AS d_emp
 JOIN departments AS d
 	ON (d_emp.dept_no = d.dept_no) 
 JOIN employees AS e
 	ON (d_emp.emp_no = e.emp_no)
	;

--List detail of employees: first_name (Hercules), last_name (starts with B),  sex
 SELECT  last_name, first_name, sex 
 FROM employees
 WHERE first_name = 'Hercules' 
 	AND last_name LIKE 'B%'

--List all employees from Sales, emp_no, last_name, first_name, dept_name
 SELECT  e.emp_no, e.last_name, e.first_name, d.dept_name 
 FROM employees AS e
  JOIN dept_emp AS d_emp
 	ON (e.emp_no = d_emp.emp_no)
  JOIN departments AS d
 	ON (d_emp.dept_no = d.dept_no)
	WHERE dept_name = 'Sales'
	; 

--List all employees from Sales, emp_no, last_name, first_name, dept_name
 SELECT  e.emp_no, e.last_name, e.first_name, d.dept_name 
 FROM employees AS e
  JOIN dept_emp AS d_emp
 	ON (e.emp_no = d_emp.emp_no)
  JOIN departments AS d
 	ON (d_emp.dept_no = d.dept_no)
	WHERE dept_name IN ('Sales', 'Development')
	; 
	
--In descending order, list the frequency count of employee last_name
 SELECT last_name, count(*)
 FROM employees
 GROUP BY last_name 
 ORDER BY last_name DESC;
 
--Import to Pandas
  
  