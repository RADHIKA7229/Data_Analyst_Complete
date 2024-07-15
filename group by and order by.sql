SELECT *
FROM employee_demographics
;
-- group by --
SELECT gender,avg(age),max(age),min(age)
FROM employee_demographics
group by gender
;

-- order by--
SELECT *
FROM employee_demographics
order by gender,age
;