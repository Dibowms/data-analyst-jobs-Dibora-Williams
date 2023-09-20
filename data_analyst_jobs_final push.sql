--Q1,How many rows are in the data_analyst_jobs table?
SELECT COUNT(title)
FROM data_analyst_jobs;
-- 1793

--Q2,Write a query to look at just the first 10 rows. What company is associated with the job posting on the 10th row?
SELECT *
FROM data_analyst_jobs
LIMIT 10;
--ExxonMobil

--Q3,How many postings are in Tennessee? How many are there in either Tennessee or Kentucky?
SELECT COUNT(title)
FROM data_analyst_jobs
WHERE (location='TN' OR location='KY');
-- 21 posting in TN and 27 in either TN,KY

-- Q4,How many postings in Tennessee have a star rating above 4?
SELECT COUNT (title)
FROM data_analyst_jobs
WHERE location='TN' AND star_rating > 4;
--3 pstings are in TN and have a star rating above 4

--Q5,How many postings in the dataset have a review count between 500 and 1000?
SELECT COUNT(title)
FROM data_analyst_jobs
WHERE review_count BETWEEN 500 AND 1000;
-- 151

--Q6,Show the average star rating for companies in each state. 
--The output should show the state as `state` and the average rating for the state as `avg_rating`.
--Which state shows the highest average rating?
SELECT AVG(star_rating) AS avg_rating, location AS state
FROM data_analyst_jobs
GROUP BY state
ORDER BY avg_rating DESC;
--NE avg(4.1999..)
--Q7,Select unique job titles from the data_analyst_jobs table. How many are there?
SELECT COUNT(DISTINCT title)
FROM data_analyst_jobs;
--881

--Q8, How many unique job titles are there for California companies?
SELECT COUNT(DISTINCT title)
FROM data_analyst_jobs
WHERE location= 'CA';
--230

--Q9,Find the name of each company and its average star rating for all companies that have more than 5000 reviews 
--across all locations. 
SELECT company, AVG(star_rating) AS avg_rating
FROM data_analyst_jobs
WHERE review_count>5000 AND company IS NOT NULL
GROUP BY company;
--How many companies are there with more that 5000 reviews across all locations?
SELECT COUNT(DISTINCT company)
FROM data_analyst_jobs
WHERE review_count>5000;
--40

--Q10,Add the code to order the query in #9 from highest to lowest average star rating. 
--Which company with more than 5000 reviews across all locations in the dataset has the highest star rating? 
--What is that rating?

SELECT company, AVG(star_rating)
FROM data_analyst_jobs
WHERE review_count>5000
GROUP BY company
ORDER BY AVG(star_rating) DESC;
-- Company-General Motors, star_rating-4.1999998

--Q11, Find all the job titles that contain the word ‘Analyst’. 
SELECT title
FROM data_analyst_jobs
WHERE title LIKE '%Analyst%';
--How many different job titles are there?
SELECT COUNT(DISTINCT title)
FROM data_analyst_jobs
WHERE title ILIKE '%Analyst%';
--774

--Q12,How many different job titles do not contain either the word ‘Analyst’ or the word ‘Analytics’? 
--What word do these positions have in common?
SELECT *
FROM data_analyst_jobs
WHERE title NOT ILIKE '%Analyst%' AND title NOT ILIKE '%Analytics%';
--4, Tableau

--Bonus Q1,You want to understand which jobs requiring SQL are hard to fill.
--Find the number of jobs by industry (domain) that require SQL and have been posted longer than 3 weeks. 

SELECT COUNT(title) AS num_jobs, domain
FROM data_analyst_jobs
WHERE skill ILIKE '%SQL%'
AND days_since_posting>21
GROUP BY domain;

--Disregard any postings where the domain is NULL.
SELECT COUNT(title) AS num_jobs, domain
FROM data_analyst_jobs
WHERE skill ILIKE '%SQL%'
AND (days_since_posting>21)
AND (domain IS NOT NULL)
GROUP BY domain;

--Order your results so that the domain with the greatest number of `hard to fill` jobs is at the top.
SELECT COUNT(title) AS num_jobs, domain
FROM data_analyst_jobs
WHERE skill ILIKE '%SQL%'
AND (days_since_posting>21)
AND (domain IS NOT NULL)
GROUP BY domain
ORDER BY num_jobs DESC;

--Which three industries are in the top 4 on this list?  
--How many jobs have been listed for more than 3 weeks for each of the top 4?
-- 1,Interent and Software (62) jobs have been listed for more than 3 weeks.
-- 2,Banks and Financial Services (61) jobs have been listed for more than 3 weeks. 
-- 3,Consulting and Business Services (57)jobs have been listed for more than 3 weeks.
-- 4, Health Care(52) jobs have been listed for more than 3 weeks.  


