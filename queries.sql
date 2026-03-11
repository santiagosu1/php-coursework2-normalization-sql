USE pixelforge_studios;

-- Calculate the average and total salary of all employees
SELECT 
    AVG(salary_cad) AS average_salary_cad,
    SUM(salary_cad) AS total_salary_cad
FROM employees;

-- Count employees in one department
SELECT 
    dept_code,
    COUNT(*) AS employee_count
FROM employees
WHERE dept_code = 'DEV'
GROUP BY dept_code;

-- Find employees whose names start with a specific letter and have at least 4 characters
SELECT 
    emp_no,
    emp_name,
    job_title
FROM employees
WHERE emp_name LIKE 'A%'
AND CHAR_LENGTH(emp_name) >= 4;

-- List all employees with a specific job title
SELECT 
    emp_no,
    emp_name,
    job_title,
    salary_cad
FROM employees
WHERE job_title = 'QA Tester';

-- Employees hired between two dates, ordered by employee name
SELECT 
    emp_no,
    emp_name,
    hire_date,
    job_title
FROM employees
WHERE hire_date BETWEEN '2020-01-01' AND '2022-12-31'
ORDER BY emp_name ASC;

-- Find minimum and maximum salary
SELECT 
    MIN(salary_cad) AS minimum_salary_cad,
    MAX(salary_cad) AS maximum_salary_cad
FROM employees;

--  Find earliest and latest hire date
SELECT 
    MIN(hire_date) AS first_hire_date,
    MAX(hire_date) AS last_hire_date
FROM employees;

-- Count employees by department, showing department name and count
SELECT 
    d.dept_name,
    COUNT(e.emp_no) AS employee_count
FROM departments d
LEFT JOIN employees e ON d.dept_code = e.dept_code
GROUP BY d.dept_name;

-- Calculate average salary by department
SELECT 
    d.dept_name,
    AVG(e.salary_cad) AS 'Average Salary'
FROM departments d
JOIN employees e ON d.dept_code = e.dept_code
GROUP BY d.dept_name;

--  Departments where total salary is above a threshold
SELECT 
    d.dept_name,
    SUM(e.salary_cad) AS total_department_salary
FROM departments d
JOIN employees e ON d.dept_code = e.dept_code
GROUP BY d.dept_name
HAVING SUM(e.salary_cad) > 300000;

-- List all employees working in one location
SELECT 
    e.emp_no,
    e.emp_name,
    e.job_title,
    d.dept_location
FROM employees e
JOIN departments d ON e.dept_code = d.dept_code
WHERE d.dept_location = 'Montreal';

-- Total salary by department and job title
SELECT 
    d.dept_name,
    e.job_title,
    SUM(e.salary_cad) AS total_salary_cad
FROM employees e
JOIN departments d ON e.dept_code = d.dept_code
GROUP BY d.dept_name, e.job_title
ORDER BY d.dept_name, e.job_title;