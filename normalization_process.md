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

# Update Anomaly

If the location of the Development department changes from Vancouver to Toronto, every row with department code DEV must be updated.

# Insert Anomaly

A new department cannot be added unless at least one employee is assigned to it.

# Delete Anomaly

If the last employee in a department is deleted, the department information is also lost.

# Attributes

The attributes in the raw table are:

* emp_no

* emp_name

* job_title

* hire_date

* salary_cad

* dept_code

* dept_name

* dept_location

# Candidate Key

In this table, the candidate key is:

* emp_no

Each employee has a unique employee number.

# Functional Dependencies

The main functional dependencies are:

## Employee-related dependencies

* emp_no -> emp_name

* emp_no -> job_title

* emp_no -> hire_date

* emp_no -> salary_cad

* emp_no -> dept_code

# Department-related dependencies

* dept_code -> dept_name

* dept_code -> dept_location

## Transitive dependency

Since:

* emp_no -> dept_code

* dept_code -> dept_name, dept_location

Then:

* emp_no -> dept_name, dept_location

* This is a transitive dependency, which means the table is not in 3NF.


