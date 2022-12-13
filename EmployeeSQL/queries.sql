-- QUERIES
-- DATA ANALYSIS

-- 1. List the employee number, last name, first name, sex, and salary of each employee
SELECT 	employees.employee_no,
		employees.last_name,
		employees.first_name,
		employees.sex,
		salaries.salary
FROM employees
INNER JOIN salaries ON employees.employee_no=salaries.employee_no

-- 2. List the first name, last name, and hire date for the employees who were hired in 1986
SELECT 	first_name, 
		last_name, 
		hire_date 
FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31'
ORDER BY hire_date ASC

-- 3. List the manager of each department along with their department number, department name, employee number, last name, and first name
SELECT 	department_manager.department_no,
		departments.department_name,
		department_manager.employee_no,
		employees.last_name,
		employees.first_name
FROM ((department_manager
INNER JOIN departments ON department_manager.department_no=departments.department_no)
INNER JOIN employees ON department_manager.employee_no=employees.employee_no);

-- 4. List the department number for each employee along with that employee's employee number, last name, first name, and department name
SELECT	department_employees.department_no,
		employees.employee_no,
		employees.last_name,
		employees.first_name,
		departments.department_name
FROM ((department_employees
INNER JOIN employees ON department_employees.employee_no=employees.employee_no)
INNER JOIN departments ON department_employees.department_no=departments.department_no);

-- 5. List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT	first_name,
		last_name,
		sex
FROM employees
WHERE first_name LIKE '%Hercules%' AND last_name LIKE 'B%'

-- 6. List each employee in the Sales Department, including their employee number, last name, and first name
SELECT 	employees.employee_no,
		employees.last_name,
		employees.first_name,
		department_employees.department_no
FROM employees
INNER JOIN department_employees ON employees.employee_no=department_employees.employee_no
WHERE department_no = 'd007'

-- 7. List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT 	employees.employee_no,
		employees.last_name,
		employees.first_name,
		departments.department_name
FROM ((employees
INNER JOIN department_employees ON employees.employee_no=department_employees.employee_no)
INNER JOIN departments ON department_employees.department_no=departments.department_no)
WHERE department_name = 'Sales' OR department_name = 'Development'

-- 8. List the frequency counts, in descending order, of all the employees last names-that is, how many employees share each last name.
SELECT last_name, COUNT(*)
FROM employees
GROUP BY last_name
ORDER BY COUNT DESC