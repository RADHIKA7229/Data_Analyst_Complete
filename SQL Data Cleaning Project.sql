-- Data Cleaning --
SELECT *
FROM layoffs;
-- 1.Remove Duplicate Data
-- 2.Standardize the data
-- 3.Null Values or blank values
-- 4.Remove any columns

CREATE TABLE layoffs_staging
LIKE layoffs;


SELECT *
FROM layoffs_staging;

INSERT layoffs_staging
SELECT *
FROM layoffs;

-- Remove Duplicates
SELECT*,
ROW_NUMBER() OVER(PARTITION BY company,location,industry,total_laid_off,percentage_laid_off,'date',stage,country,funds_raised_millions) as ROW_NUM
FROM layoffs_staging;

WITH duplicate_cte AS
(
SELECT*,
ROW_NUMBER() OVER(PARTITION BY company,location,industry,total_laid_off,percentage_laid_off,'date',stage,country,funds_raised_millions) as ROW_NUM
FROM layoffs_staging
)
SELECT*
FROM duplicate_cte
WHERE ROW_NUM>1;



Select *
FROM layoffs_staging
WHERE company='Casper';

-- Deleting  Duplicates
WITH duplicate_cte AS
(
SELECT*,
ROW_NUMBER() OVER(PARTITION BY company,location,industry,total_laid_off,percentage_laid_off,'date',stage,country,funds_raised_millions) as ROW_NUM
FROM layoffs_staging
)
DELETE
FROM duplicate_cte
WHERE ROW_NUM>1;

CREATE TABLE `layoffs_staging2` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
   `ROW_NUM` INT 
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
SELECT *
FROM layoffs_staging2;

INSERT INTO layoffs_staging2
SELECT*,
ROW_NUMBER() OVER(PARTITION BY company,location,industry,total_laid_off,percentage_laid_off,'date',stage,country,funds_raised_millions) as ROW_NUM
FROM layoffs_staging;


SELECT*
FROM layoffs_staging2
WHERE ROW_NUM>1;

DELETE
FROM layoffs_staging2
WHERE ROW_NUM>1;
SELECT*
FROM layoffs_staging2
;

-- Standardising 
SELECT company, TRIM(company)
FROM layoffs_staging2;

UPDATE layoffs_staging2
SET company =Trim(company); 


SELECT DISTINCT industry
FROM layoffs_staging2
ORDER BY 1;

UPDATE layoffs_staging2
SET industry='Crypto'
WHERE industry LIKE 'Crypto%';

SELECT DISTINCT country
FROM layoffs_staging2
ORDER BY 1;

SELECT DISTINCT country, TRIM(TRAILING '.' FROM country)
FROM layoffs_staging2
ORDER BY 1;

UPDATE layoffs_staging2
SET country =TRIM(TRAILING '.' FROM country)
;

SELECT `date`,
STR_TO_DATE (`date`, '%m/%d/%Y')
FROM layoffs_staging2;

UPDATE layoffs_staging2
SET `date` = STR_TO_DATE (`date`, '%m/%d/%Y');

SELECT*
FROM layoffs_staging2;

ALTER TABLE layoffs_staging2
MODIFY COLUMN `date` DATE;

-- Dealing With Nulls

UPDATE layoffs_staging2 t1
JOIN layoffs_staging2 t2
	ON t1.company =t2.company
SET t1.industry=t2.industry
WHERE t1.industry IS NULL
AND t2.industry  IS NOT NULL;    

-- SELECT industry
-- FROM layoffs_staging2
-- WHERE industry=' ';
SELECT *
FROM layoffs_staging2
WHERE total_laid_off IS NULL 
AND percentage_laid_off IS NULL;
DELETE
FROM layoffs_staging2
WHERE total_laid_off IS NULL 
AND percentage_laid_off IS NULL;

-- FINAL
ALTER TABLE layoffs_staging2
DROP COLUMN ROW_NUM;

SELECT*
FROM layoffs_staging2;





