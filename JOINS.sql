SELECT*
FROM employee_Demographics;

SELECT*
FROM employee_salary
;

-- INNER JOIN--
SELECT *
FROM employee_demographics AS dem
INNER JOIN employee_salary AS sal
	ON dem.employee_id=sal.employee_id
    ;
    
-- OUTER JOIN --
SELECT *
FROM employee_demographics AS dem
RIGHT JOIN employee_salary AS sal
	ON dem.employee_id=sal.employee_id
    ;
    
 -- SELF JOIN --
 SELECT *
FROM employee_salary AS emp1
 JOIN employee_salary AS emp2
	ON emp1.employee_id+1 =emp2.employee_id
    ;

-- JOINING MULTIPLE TABLES TOGETHER --
SELECT *
FROM employee_demographics AS dem
INNER JOIN employee_Salary AS sal
	ON dem.employee_id= sal.employee_id
INNER JOIN parks_departments pd
		ON sal.dept_id = pd.department_id
        ;