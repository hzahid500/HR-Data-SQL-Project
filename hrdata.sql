create table hrdata
(
	emp_no int8 PRIMARY KEY,
	gender varchar(50) NOT NULL,
	marital_status varchar(50),
	age_band varchar(50),
	age int8,
	department varchar(50),
	education varchar(50),
	education_field varchar(50),
	job_role varchar(50),
	business_travel varchar(50),
	employee_count int8,
	attrition varchar(50),
	attrition_label varchar(50),
	job_satisfaction int8,
	active_employee int8
)


SELECT *
FROM
	hrdata
	
-- How many employees only have a high school education. 170 employees have a high school education
SELECT
	SUM(employee_count)
FROM
	hrdata
WHERE 
	education = 'High School'
	
-- What is the employee counts by age group? Most of the employees are aged 25-34
	
SELECT
	age_band,
	SUM(employee_count) as employee_count
FROM
	hrdata
GROUP BY
	age_band
ORDER BY
	employee_count DESC

-- What is the attrition rate by age group? Looks like age 25-34 have the highest attrition rates
SELECT
	age_band,
	COUNT(attrition) as total_attrition
FROM
	hrdata
WHERE
	attrition = 'Yes'
GROUP BY
	age_band
ORDER BY
	total_attrition DESC
	
-- Which job role has the highest attrition rate? Lab technicians have the highest attrition rates followed by sales exes
SELECT
	job_role,
	COUNT(attrition) as attrition_total
FROM
	hrdata
WHERE
	attrition = 'Yes'
GROUP BY
	job_role
ORDER BY
	attrition_total DESC
	
-- What is the average age by job roles? Average age for managers are the highest, and sales reps are on average the youngest employees
SELECT
	job_role,
	AVG(age) as average_age
FROM
	hrdata
GROUP BY
	job_role
ORDER BY
	average_age DESC
	
-- Which education level has the highest attrition rates? Bachelor degree levels have the highest attrition rates
SELECT
	education,
	COUNT(attrition) as attrition_count
FROM
	hrdata
WHERE
	attrition = 'Yes'
GROUP BY
	education
ORDER BY
	attrition_count DESC
	
-- Which job roles have the highest satisfactions? HR have the lowest job satisfaction and sales exes have the higest satisfaction
SELECT
	job_role,
	SUM(job_satisfaction) as job_satisfaction_total
FROM
	hrdata
GROUP BY
	job_role
ORDER BY
	job_satisfaction_total DESC

-- What are the attrition rates by education field? Life Sciences have the highest attrition rates
SELECT
	education_field,
	COUNT(attrition) as attrition_count
FROM
	hrdata
GROUP BY
	education_field
ORDER BY
	attrition_count DESC
	
-- What is the attrition by gender?
SELECT 
	gender,
	COUNT(attrition) as total_attrition
FROM
	hrdata
WHERE
	attrition = 'Yes' AND education = 'High School'
GROUP BY
	gender
ORDER BY
	total_attrition DESC
	
-- Which department has the most attrition rates, show the percentage as well? R%D has the highest percentage of attrition
SELECT
	department,
	COUNT(attrition) AS att_count,
 	ROUND((CAST(COUNT(attrition) AS NUMERIC) / (SELECT COUNT(attrition) FROM hrdata WHERE attrition = 'Yes')) * 100, 2)
FROM
	hrdata
WHERE
	attrition = 'Yes'
GROUP BY
	department
ORDER BY
	att_count DESC











	
	