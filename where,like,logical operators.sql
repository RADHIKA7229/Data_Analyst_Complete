SELECT *
FROM employee_salary
WHERE salary > '50000'
;

-- Logical operator and and or--
SELECT first_name, last_name
from employee_salary
WHERE salary> '50000' AND dept_id>1
;


-- LIKE --
SELECT first_name
FROM employee_salary
WHERE first_name LIKE '%a%'
;
SELECT first_name
FROM employee_salary
WHERE first_name LIKE '%a_%'
;


