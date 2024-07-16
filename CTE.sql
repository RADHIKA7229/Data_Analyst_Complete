-- case statements --

WITH CTE_EXAMPLE AS
(
SELECT gender,AVG(salary) avg_Sal,MAX(salary) max_sal, MIN(salary) min_Sal,Count(salary) count_Sal
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id= sal.employee_id
 GROUP BY gender
 )
 SELECT AVG(avg_sal)
 from CTE_EXAMPLE
 ;
 
 SELECT*
 FROM employee_demographics;
 
 SELECT*
 FROM employee_salary;