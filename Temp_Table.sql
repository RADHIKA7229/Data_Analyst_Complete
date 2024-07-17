-- TEMPORARY TABLE
CREATE TEMPORARY TABLE temp_table
(first_name varchar(20),
 last_name varchar(20),
 favourite_movie varchar(20)
 );
 SELECT*
 FROM temp_table
 ;
 INSERT INTO temp_table
 values('Radhika','Sharma','K3G');
 SELECT *
 FROM temp_table;
 
 -- way 2 of createing temporary table
 
 CREATE TEMPORARY TABLE SALARY_OVER_50K
 SELECT*
 FROM employee_salary
 WHERE salary>=50000;
 
 SELECT*
 from SALARY_OVER_50K;
 