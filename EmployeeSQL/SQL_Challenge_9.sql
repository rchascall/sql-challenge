CREATE TABLE employees (
    employee_no INT   NOT NULL,
    employee_title_id VARCHAR   NOT NULL,
    birth_date DATE   NOT NULL,
    first_name VARCHAR(30)   NOT NULL,
    last_name VARCHAR(60)   NOT NULL,
    sex CHAR(1)   NOT NULL,
    hire_date DATE   NOT NULL,
    CONSTRAINT pk_employees PRIMARY KEY (
        employee_no
     )
);

CREATE TABLE departments (
    department_no VARCHAR   NOT NULL,
    department_name VARCHAR(20)   NOT NULL,
    CONSTRAINT pk_departments PRIMARY KEY (
        department_no
     )
);

CREATE TABLE department_manager (
    department_no VARCHAR   NOT NULL,
    employee_no INT   NOT NULL,
	CONSTRAINT pk_department_manager PRIMARY KEY (
		employee_no, department_no
	)
);

CREATE TABLE titles (
    employee_title_id VARCHAR   NOT NULL,
    title VARCHAR(30)   NOT NULL,
    CONSTRAINT pk_titles PRIMARY KEY (
        employee_title_id
     )
);

CREATE TABLE salaries (
    employee_no INT NOT NULL,
    salary INT   NOT NULL,
    CONSTRAINT pk_salaries PRIMARY KEY (
        employee_no
     )
);

CREATE TABLE department_employees (
    employee_no INT   NOT NULL,
    department_no VARCHAR(4)   NOT NULL
);

ALTER TABLE department_manager ADD CONSTRAINT fk_department_manager_employee_no FOREIGN KEY(employee_no)
REFERENCES employees (employee_no);

ALTER TABLE titles ADD CONSTRAINT fk_titles_employee_title_id FOREIGN KEY(employee_title_id)
REFERENCES employees (employee_title_id);

ALTER TABLE salaries ADD CONSTRAINT fk_salaries_employee_no FOREIGN KEY(employee_no)
REFERENCES employees (employee_no);

ALTER TABLE department_employees ADD CONSTRAINT fk_department_employees_employee_no FOREIGN KEY(employee_no)
REFERENCES employees (employee_no);

ALTER TABLE department_employees ADD CONSTRAINT fk_department_employees_department_no FOREIGN KEY(department_no)
REFERENCES departments (department_no);

drop table department_manager

SELECT * FROM departments
SELECT * FROM department_manager
SELECT * FROM titles
SELECT * FROM employees
SELECT * FROM department_employees
SELECT * FROM salaries

-- 1. List the employee number, last name, first name, sex, and salary of each employee
-- COMPLETED
SELECT 	employees.employee_no,
		employees.last_name,
		employees.first_name,
		employees.sex,
		salaries.salary
FROM employees
INNER JOIN salaries ON employees.employee_no=salaries.employee_no

-- 2. List the first name, last name, and hire date for the employees who were hired in 1986
-- Sorted in ascending order to see beginning of dataset
-- COMPLETED
SELECT 	first_name, 
		last_name, 
		hire_date 
FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31'
ORDER BY hire_date ASC

-- 3. List the manager of each department along with their department number, department name, employee number, last name, and first name
-- COMPLETED
SELECT 	department_manager.department_no,
		departments.department_name,
		department_manager.employee_no,
		employees.last_name,
		employees.first_name
FROM ((department_manager
INNER JOIN departments ON department_manager.department_no=departments.department_no)
INNER JOIN employees ON department_manager.employee_no=employees.employee_no);

-- 4. List the department number for each employee along with that employee's employee number, last name, first name, and department name
-- COMPLETED
SELECT	department_employees.department_no,
		employees.employee_no,
		employees.last_name,
		employees.first_name,
		departments.department_name
FROM ((department_employees
INNER JOIN employees ON department_employees.employee_no=employees.employee_no)
INNER JOIN departments ON department_employees.department_no=departments.department_no);

-- 5. List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
-- COMPLETED
SELECT	first_name,
		last_name,
		sex
FROM employees
WHERE first_name LIKE '%Hercules%' AND last_name LIKE 'B%'

-- 6. List each employee in the Sales Department, including their employee number, last name, and first name
-- NOT STARTED

-- 7. List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
-- NOT STARTED

-- 8. List the frequency counts, in descending order, of all the employees last names-that is, how many employees share each last name.
-- NOT STARTED