-- 1. How many rows are in the names table?
-- SELECT COUNT(name)
-- FROM names;
-- Answer: 1957046

-- 2. How many total registered people appear in the dataset?
-- SELECT SUM(num_registered)
-- FROM names;
-- Answer: 351653025

-- 3. Which name had the most appearances in a single year in the dataset?
-- SELECT *
-- FROM names
-- ORDER BY num_registered DESC;
-- Answer: Linda has the most appearances in a single year, in 1947. Also took the crown in 1948. You go, Lindas.

-- 4. What range of years are included?
-- SELECT MIN(year), MAX(year)
-- FROM names;
-- Answer: 1880 to 2018

-- 5. What year has the largest number of registrations?
-- SELECT SUM(num_registered) AS annual_registered, year
-- FROM names
-- GROUP BY year
-- ORDER BY annual_registered DESC
-- LIMIT 1;
-- Answer: 1957 had the largest number of registrations, at 4200022

-- 6. How many different (distinct) names are contained in the dataset?
-- SELECT COUNT(DISTINCT name)
-- FROM names;
-- Answer: 98400

-- 7. Are there more males or more females registered?
-- SELECT SUM(num_registered) AS total_registered, gender
-- FROM names
-- GROUP BY gender
-- ORDER BY total_registered;
-- Answer: Females have more registered.

-- 8. What are the most popular male and female names overall (i.e., the most total registrations)?
-- SELECT SUM(num_registered) AS total_registered, name, gender
-- FROM names
-- GROUP BY name, gender
-- ORDER BY total_registered DESC;
-- Answer: James for males, with 5164280 registered, and Mary for females, with 4125675 registered.

-- 9. What are the most popular boy and girl names of the first decade of the 2000s (2000 - 2009)?
-- SELECT SUM(num_registered) AS total_registered, name, gender
-- FROM names
-- WHERE year BETWEEN 2000 AND 2009
-- GROUP BY name, gender
-- ORDER BY total_registered DESC;
-- Answer: Jacob for males, with 273844 registered, and Emily for females, with 223690 registered.

-- 10. Which year had the most variety in names (i.e. had the most distinct names)?
-- SELECT COUNT(DISTINCT name) as num_distinct_names, year
-- FROM names
-- GROUP BY year
-- ORDER BY num_distinct_names DESC;
-- Answer: 2008, with 32518 distinct names.

-- 11. What is the most popular name for a girl that starts with the letter X?
-- SELECT name, SUM(num_registered) AS total_registered
-- FROM names
-- WHERE name ILIKE 'X%'
-- 	AND gender ILIKE 'F'
-- GROUP BY name
-- ORDER BY total_registered DESC;
--Answer: Ximena, with 26145 registered. Though, I've never met a Ximena.

-- 12. How many distinct names appear that start with a 'Q', but whose second letter is not 'u'?
-- SELECT COUNT(name)
-- FROM names
-- WHERE name ILIKE 'Q%'
-- 	AND name NOT ILIKE '_u%';
-- Answer: 333 distinct names

-- 13. Which is the more popular spelling between "Stephen" and "Steven"? Use a single query to answer this question.
-- SELECT name, sum(num_registered) AS total_registered
-- FROM names
-- WHERE name ILIKE 'Stephen'
-- 	OR name ILIKE 'Steven'
-- GROUP BY name
-- ORDER BY total_registered DESC;
-- Answer: Steven wins!

-- 14. What percentage of names are "unisex" - that is what percentage of names have been used both for boys and for girls?
-- SELECT ROUND((SUM(distinct_names_total)-98400)/98400.0*100,2)
-- FROM (SELECT COUNT(DISTINCT name) AS distinct_names_total, gender
-- 	FROM names
-- 	GROUP BY gender)
-- Answer: 10.95 percent

-- 15. How many names have made an appearance in every single year since 1880?
-- SELECT DISTINCT name, COUNT(DISTINCT year) as year_total
-- FROM names
-- GROUP BY name
-- HAVING COUNT(DISTINCT year) = 139
-- ORDER BY year_total DESC;
-- Answer: 921 names

-- 16. How many names have only appeared in one year?
-- SELECT DISTINCT name, COUNT(DISTINCT year) as year_total
-- FROM names
-- GROUP BY name
-- HAVING COUNT(DISTINCT year) = 1
-- ORDER BY year_total DESC;
-- Answer: 21123 names

-- 17. How many names only appeared in the 1950s?
-- SELECT name, COUNT(DISTINCT year) AS name_total, n2.fifties_total
-- FROM names as n1
-- INNER JOIN (SELECT name, COUNT(DISTINCT year) AS fifties_total
-- 			FROM names
-- 			WHERE year BETWEEN 1950 AND 1959
-- 			GROUP BY name) as n2
-- USING(name)
-- GROUP BY name, n2.fifties_total
-- HAVING COUNT(DISTINCT year) = n2.fifties_total
-- ORDER BY name_total DESC;
-- Answer: 661 names

-- 18. How many names made their first appearance in the 2010s?
-- SELECT name, COUNT(DISTINCT year) AS name_total, n2.tens_total
-- FROM names as n1
-- INNER JOIN (SELECT name, COUNT(DISTINCT year) AS tens_total
-- 			FROM names
-- 			WHERE year BETWEEN 2010 AND 2018
-- 			GROUP BY name) as n2
-- USING(name)
-- GROUP BY name, n2.tens_total
-- HAVING COUNT(DISTINCT year) = n2.tens_total
-- ORDER BY name_total DESC;
--Answer: 11270 names

-- 19. Find the names that have not be used in the longest.
-- SELECT name, COUNT(DISTINCT year) AS name_total, n2.oldest_total
-- FROM names as n1
-- INNER JOIN (SELECT name, COUNT(DISTINCT year) AS oldest_total
-- 			FROM names
-- 			WHERE year = 1881
-- 			GROUP BY name) as n2
-- USING(name)
-- GROUP BY name, n2.oldest_total
-- HAVING COUNT(DISTINCT year) = n2.oldest_total
-- ORDER BY name_total DESC;
-- Answer: Roll and Zilpah have not been used since 1881

-- 20. Come up with a question that you would like to answer using this dataset. Then write a query to answer this question.
-- Which year has the longest names, on average?
-- SELECT year, AVG(LENGTH(name)) AS avg_length
-- FROM names
-- GROUP BY year
-- ORDER BY avg_length DESC
-- Answer: 1992 has the longest names, on average.
