SELECT*
FROM employee_demographics;
#SELECT STATEMENT
SELECT first_name, last_name, age, age+10
FROM employee_demographics;
#PEMDAS
SELECT first_name, last_name, age, (age+10)*10
FROM employee_demographics;
#DISTINCT
SELECT DISTINCT gender
FROM employee_demographics;

SELECT DISTINCT first_name, gender
FROM employee_demographics;