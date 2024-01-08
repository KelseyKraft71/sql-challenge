-- Data Analysis 1
-- Info for every employee
SELECT e.emp_id, e.last_name, e.first_name, e.sex, s.salary
FROM employees AS e
JOIN salaries AS s
ON e.emp_id = s.emp_id;

-- Data Analysis 2
-- Employees hired in 1986
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date LIKE '%/%/1986';

select * from departments;

-- Data Analysis 3
-- Managers
SELECT dm.dept_num, d.dept_name, e.emp_id, e.last_name, e.first_name
FROM deptmanager AS dm
JOIN departments AS d
ON dm.dept_num = d.dept_num
JOIN employees AS e
ON e.emp_id = dm.emp_id;

-- Data Analysis 4
-- Employees and their departments
SELECT de.dept_num, de.emp_id, e.last_name, e.first_name, d.dept_name
FROM deptemployees AS de
JOIN employees AS e
ON de.emp_id = e.emp_id
JOIN departments AS d
ON de.dept_num = d.dept_num;

-- Data Analysis 5
-- Employees named 'Hercules B.'
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';

select * from deptemployees;

-- Data Analysis 6
-- Sales employees
SELECT emp_id, last_name, first_name
FROM employees
WHERE emp_id IN (
	SELECT emp_id
	FROM deptemployees
	WHERE dept_num IN (
		SELECT dept_num
		FROM departments
		WHERE dept_name = 'Sales'
	)
);