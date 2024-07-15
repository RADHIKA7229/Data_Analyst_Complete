-- UNIONS --
SELECT*
FROM employee_demographics
;
SELECT*
FROM employee_salary
;
-- unions DISTINCT --
SELECT first_name, last_name,'OLD MAN' AS LABEL
FROM employee_demographics
WHERE age>50 AND gender='MALE'
UNION
SELECT first_name, last_name,'OLD LADY' AS LABEL
FROM employee_demographics
WHERE age>40 AND gender='FEMALE'
UNION
SELECT first_name, last_name,'Highly Paid Employee' AS LABEL
FROM employee_salary
WHERE salary>70000 
ORDER BY first_name ASC
;