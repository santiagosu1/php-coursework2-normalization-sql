CREATE DATABASE IF NOT EXISTS pixelforge_studios;
USE pixelforge_studios;

CREATE TABLE departments (
    dept_code VARCHAR(10) PRIMARY KEY,
    dept_name VARCHAR(100) NOT NULL UNIQUE,
    dept_location VARCHAR(100) NOT NULL
);

CREATE TABLE employees (
    emp_no INT PRIMARY KEY,
    emp_name VARCHAR(100) NOT NULL,
    job_title VARCHAR(100) NOT NULL,
    hire_date DATE NOT NULL,
    salary_cad DECIMAL(10,2) NOT NULL,
    dept_code VARCHAR(10) NOT NULL,
    CONSTRAINT fk_employees_department
        FOREIGN KEY (dept_code) REFERENCES departments(dept_code)
);