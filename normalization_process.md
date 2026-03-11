# Original Table

| emp_no | emp_name        | job_title            | hire_date  | salary_cad | dept_code | dept_name         | dept_location |
| ------ | --------------- | -------------------- | ---------- | ---------- | --------- | ----------------- | ------------- |
| 1001   | Lucas Romero    | Gameplay Programmer  | 2021-03-15 | 92000      | DEV       | Development       | Vancouver     |
| 1002   | Sofia Chen      | Character Artist     | 2022-06-10 | 78000      | ART       | Art Department    | Montreal      |
| 1003   | Daniel Park     | QA Tester            | 2023-01-09 | 56000      | QA        | Quality Assurance | Vancouver     |
| 1004   | Emma Rossi      | Game Designer        | 2020-09-21 | 88000      | GDS       | Game Design       | Toronto       |
| 1005   | Noah Patel      | Audio Designer       | 2021-11-03 | 72000      | AUD       | Audio             | Montreal      |
| 1006   | Ava Kim         | Backend Programmer   | 2019-07-17 | 105000     | DEV       | Development       | Vancouver     |
| 1007   | Liam Dubois     | UI Artist            | 2022-02-14 | 74000      | ART       | Art Department    | Montreal      |
| 1008   | Mia Johnson     | Marketing Specialist | 2023-04-01 | 67000      | MKT       | Marketing         | Toronto       |
| 1009   | Ethan Garcia    | HR Coordinator       | 2021-08-30 | 64000      | HR        | Human Resources   | Toronto       |
| 1010   | Isabella Nguyen | QA Analyst           | 2020-12-05 | 60000      | QA        | Quality Assurance | Vancouver     |



# Problems with this table

DEV | Development | Vancouver

This table contains repeated department information for example:

* DEV.

* Development.

* Vancouver.

The same problem happens with other departments as well. This causes data redundancy and can create anomalies.

## Update Anomaly

If the location of the Development department changes from Vancouver to Toronto, every row with department code DEV must be updated.

## Insert Anomaly

A new department cannot be added unless at least one employee is assigned to it.

## Delete Anomaly

If the last employee in a department is deleted, the department information is also lost.

## Attributes

The attributes in the raw table are:

* emp_no

* emp_name

* job_title

* hire_date

* salary_cad

* dept_code

* dept_name

* dept_location

## Candidate Key

In this table, the candidate key is:

* emp_no

Each employee has a unique employee number.

## Functional Dependencies

The main functional dependencies are:

### Employee-related dependencies

* emp_no -> emp_name

* emp_no -> job_title

* emp_no -> hire_date

* emp_no -> salary_cad

* emp_no -> dept_code

### Department-related dependencies

* dept_code -> dept_name

* dept_code -> dept_location

### Transitive dependency

Since:

* emp_no -> dept_code

* dept_code -> dept_name, dept_location

Then:

* emp_no -> dept_name, dept_location

* This is a transitive dependency, which means the table is not in 3NF.

## First Normal Form (1NF)
### Rule

* A table is in First Normal Form if:

* all values are atomic

* there are no repeating groups

* each row can be uniquely identified

### Analysis

* The table is already in 1NF because:

* each column contains only one value per row

* there are no multi-valued attributes

* the table has a valid primary key: emp_no

### Result in 1NF

The table remains the same:

employee_raw(emp_no, emp_name, job_title, hire_date, salary_cad, dept_code, dept_name, dept_location)

## Second Normal Form (2NF)
### Rule

* A table is in Second Normal Form if:

* it is already in 1NF

* it has no partial dependency on a composite key

### Analysis

The primary key is a single attribute:

* emp_no

Because the key is not composite, partial dependencies cannot exist.

### Result in 2NF

The table is already in 2NF and remains unchanged.

## Third Normal Form (3NF)
### Rule

* A table is in Third Normal Form if:

* it is already in 2NF

* it has no transitive dependencies

## Problem

The table has the following dependency structure:

* emp_no -> dept_code

* dept_code -> dept_name, dept_location

This means:

* dept_name and dept_location depend on dept_code, not directly on emp_no

This is a transitive dependency, so the table must be decomposed.

## Decomposition into 3NF

To remove the transitive dependency, the table is split into two relations:

### Table 1: departments
| dept_code | dept_name         | dept_location |
| --------- | ----------------- | ------------- |
| DEV       | Development       | Vancouver     |
| ART       | Art Department    | Montreal      |
| QA        | Quality Assurance | Vancouver     |
| GDS       | Game Design       | Toronto       |
| AUD       | Audio             | Montreal      |
| MKT       | Marketing         | Toronto       |
| HR        | Human Resources   | Toronto       |

Primary key:

* dept_code

## Table 2: employees
| emp_no | emp_name        | job_title            | hire_date  | salary_cad | dept_code |
| ------ | --------------- | -------------------- | ---------- | ---------: | --------- |
| 1001   | Lucas Romero    | Gameplay Programmer  | 2021-03-15 |      92000 | DEV       |
| 1002   | Sofia Chen      | Character Artist     | 2022-06-10 |      78000 | ART       |
| 1003   | Daniel Park     | QA Tester            | 2023-01-09 |      56000 | QA        |
| 1004   | Emma Rossi      | Game Designer        | 2020-09-21 |      88000 | GDS       |
| 1005   | Noah Patel      | Audio Designer       | 2021-11-03 |      72000 | AUD       |
| 1006   | Ava Kim         | Backend Programmer   | 2019-07-17 |     105000 | DEV       |
| 1007   | Liam Dubois     | UI Artist            | 2022-02-14 |      74000 | ART       |
| 1008   | Mia Johnson     | Marketing Specialist | 2023-04-01 |      67000 | MKT       |
| 1009   | Ethan Garcia    | HR Coordinator       | 2021-08-30 |      64000 | HR        |
| 1010   | Isabella Nguyen | QA Analyst           | 2020-12-05 |      60000 | QA        |

Primary key:

* emp_no

Foreign key:

* dept_code references departments(dept_code)

## Final Relations in 3NF
### departments

* dept_code PK

* dept_name

* dept_location

### employees

* emp_no PK

* emp_name

* job_title

* hire_date

* salary_cad

* dept_code FK

## Relationship:

* employees.dept_code -> departments.dept_code

## Conclusion

The final design is in Third Normal Form (3NF) because:

* all attributes are atomic

* there are no partial dependencies

* there are no transitive dependencies

The new design reduces redundancy and prevents update, insert, and delete anomalies.

