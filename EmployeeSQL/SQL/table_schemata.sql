-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- I had to alter some of the code for functionality/readability

CREATE TABLE Titles (
    title_id VARCHAR(5) NOT NULL,
    title VARCHAR(30) NOT NULL,
    CONSTRAINT pk_Titles PRIMARY KEY (
        title_id
     )
);

CREATE TABLE Departments (
    dept_num VARCHAR(4) NOT NULL,
    dept_name VARCHAR(30) NOT NULL,
    CONSTRAINT pk_Departments PRIMARY KEY (
        dept_num
     )
);

CREATE TABLE Employees (
    emp_id VARCHAR(6) NOT NULL,
    emp_title_id VARCHAR(5) NOT NULL,
    birth_date VARCHAR(10) NOT NULL,
    first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(30) NOT NULL,
    sex VARCHAR(1) NOT NULL,
    hire_date VARCHAR(10) NOT NULL,
    CONSTRAINT pk_Employees PRIMARY KEY (
        emp_id
     )
);

CREATE TABLE DeptManager (
    dept_num VARCHAR(4) NOT NULL,
    emp_id VARCHAR(6) NOT NULL,
    CONSTRAINT pk_DeptManager PRIMARY KEY (
        dept_num,emp_id
     )
);

CREATE TABLE DeptEmployees (
    emp_id VARCHAR(6) NOT NULL,
    dept_num VARCHAR(4) NOT NULL,
    CONSTRAINT pk_DeptEmployees PRIMARY KEY (
        emp_id,dept_num
     )
);

CREATE TABLE Salaries (
    emp_id VARCHAR(6) NOT NULL,
    salary INT NOT NULL,
    CONSTRAINT pk_Salaries PRIMARY KEY (
        emp_id
     )
);

ALTER TABLE Employees ADD CONSTRAINT fk_Employees_emp_title_id FOREIGN KEY(emp_title_id)
REFERENCES Titles (title_id);

ALTER TABLE DeptManager ADD CONSTRAINT fk_DeptManager_dept_num FOREIGN KEY(dept_num)
REFERENCES Departments (dept_num);

ALTER TABLE DeptManager ADD CONSTRAINT fk_DeptManager_emp_id FOREIGN KEY(emp_id)
REFERENCES Employees (emp_id);

ALTER TABLE DeptEmployees ADD CONSTRAINT fk_DeptEmployees_emp_id FOREIGN KEY(emp_id)
REFERENCES Employees (emp_id);

ALTER TABLE DeptEmployees ADD CONSTRAINT fk_DeptEmployees_dept_num FOREIGN KEY(dept_num)
REFERENCES Departments (dept_num);

ALTER TABLE Salaries ADD CONSTRAINT fk_Salaries_emp_id FOREIGN KEY(emp_id)
REFERENCES Employees (emp_id);

