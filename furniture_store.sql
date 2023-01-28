/*
Furniture store sales data gotten from https://gist.github.com/pamelafox/791ce9e4eb31abce2362

Inspired by Khan Academy course on SQL > https://www.khanacademy.org/computing/computer-programming/sql/more-advanced-sql-queries/pp/project-data-dig
*/



/* === What are average, max, and min values in the data? === */

SELECT AVG(price) FROM sales;
SELECT MAX(price) FROM sales;
SELECT MIN(price) FROM sales;


/* === What about those numbers per category in the data (using HAVING)? === */

/* Finding which countries have the minimum price that paid by Visa */
SELECT country, MIN(price) AS minimum_price FROM sales GROUP BY country HAVING payment_type = "Visa";

/* Find which products have a price of 3600 or less */
SELECT product FROM sales GROUP BY product HAVING price <=3600;


/* === What ways are there to group the data values that don’t exist yet (using CASE)? === */


/* Group cities and their countries by how much affordable they are using the price of furniture */
SELECT city, country, price, 
    CASE 
        WHEN price >= 1200 AND price < 3600 THEN "affordable"
        WHEN price >= 3600 AND price < 7200 THEN "moderately affordable"
        WHEN price >= 7200 THEN "expensive"
        ELSE "outlier"
    END as "affordability"
FROM sales;


/* === What interesting ways are there to filter the data (using AND/OR)? === */

/* Show the names of people, what type of furniture they purchased and their respective countries from UK or US */
SELECT name, product, country FROM sales WHERE country = "United Kingdom" OR country = "United states";


/* First show the names of countries with the name 'United' in them. Then show the names of people, what furniture type they purchased and their respective countries if their country name has 'United' in it. */
SELECT country FROM sales WHERE country LIKE "%United%";

SELECT name, product, country FROM sales WHERE country IN (SELECT country FROM sales WHERE country LIKE "%United%");



