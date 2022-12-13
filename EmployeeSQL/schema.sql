-- DATA ENGINEERING

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
    department_no VARCHAR(4)   NOT NULL,
	CONSTRAINT pk_department_employees PRIMARY KEY (
        employee_no
	)
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

