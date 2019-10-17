-- task 1
-- List the following details of each employee: employee number, last name, first name, gender, and salary.
CREATE VIEW task_1_empno_ln_fn_sal AS
SELECT 
employees.emp_no, employees.last_name, employees.first_name, employees.gender, 
salaries.salary
FROM employees
JOIN salaries ON employees.emp_no = salaries.emp_no

SELECT * FROM task_1_empno_ln_fn_sal


-- task 2
-- List employees who were hired in 1986
-- https://popsql.com/learn-sql/postgresql/how-to-query-date-and-time-in-postgresql/
CREATE VIEW task_2_hiredin86 AS
SELECT 
employees.emp_no, employees.last_name, employees.first_name,employees.hire_date
FROM employees
WHERE
	hire_date >= '1986-01-01' AND hire_date <= '1986-12-31'
	
SELECT * FROM task_2_hiredin86


-- task 3
-- List the manager of each department with the following information: 
-- department number, department name, the manager's employee number, last name, first name, 
-- and start and end employment dates.
-- assume "start of employment date = hire date"
CREATE VIEW task_3_manger_info AS
SELECT 
departments.dept_no, departments.dept_name,
dept_manager.emp_no,
employees.last_name, employees.first_name, employees.hire_date,
titles.title,
dept_emp.from_date as dept_emp_from_date, dept_emp.to_date as dept_emp_to_date
FROM departments
JOIN dept_manager ON departments.dept_no = dept_manager.dept_no
JOIN employees ON dept_manager.emp_no = employees.emp_no
JOIN titles ON employees.emp_no = titles.emp_no
JOIN dept_emp ON titles.emp_no = dept_emp.emp_no
JOIN salaries ON dept_emp.emp_no = salaries.emp_no
WHERE 
	title = 'Manager'

SELECT * FROM dept_manager

-- task 4
-- List the department of each employee with the following information: employee number, last name, first name, and department name.
CREATE VIEW task_4_empno_ln_fn_dept AS
SELECT 
employees.emp_no, employees.last_name, employees.first_name,
departments.dept_name
FROM employees
JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
JOIN departments ON dept_emp.dept_no = departments.dept_no

SELECT * FROM task_4_empno_ln_fn_dept

-- task 5
-- List all employees whose first name is "Hercules" and last names begin with "B."
CREATE VIEW task_5_herculesb AS
SELECT employees.first_name, employees.last_name
FROM employees
WHERE
	first_name = 'Hercules' AND
	last_name LIKE 'B%'

SELECT * FROM task_5_herculesb

-- task 6
-- List all employees in the Sales department, including their employee number, last name, first name, and department name.
CREATE VIEW task_6_empno_ln_fn_salesdpt AS
SELECT 
employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
JOIN departments ON dept_emp.dept_no = departments.dept_no
WHERE
	dept_name = 'Sales'

SELECT * FROM task_6_empno_ln_fn_salesdpt

-- task 7
-- List all employees in the Sales and Development departments, 
-- including their employee number, last name, first name, and department name.
CREATE VIEW task_7_empno_ln_fn_sales_dev_dpts AS
SELECT 
employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
JOIN departments ON dept_emp.dept_no = departments.dept_no
WHERE
	dept_name = 'Sales' OR dept_name = 'Development' 

SELECT * FROM task_7_empno_ln_fn_sales_dev_dpts

-- task 8
-- In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
CREATE VIEW task_8_lastname_counts AS
SELECT last_name, COUNT(*) AS "last_name_count"
FROM employees
GROUP BY last_name
ORDER BY "last_name_count" DESC;

SELECT * FROM task_8_lastname_counts

-- task 9 (bonus task)
-- finding out salaries of different titles 
CREATE VIEW task_9_bonus AS
SELECT 
employees.emp_no, employees.last_name, employees.first_name, 
titles.title, 
salaries.salary
FROM employees
JOIN titles ON employees.emp_no = titles.emp_no
JOIN salaries ON titles.emp_no = salaries.emp_no

SELECT * FROM task_9_bonus
