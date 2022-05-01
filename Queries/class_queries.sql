/*## Movies Ordered By

In this activity, you will use `ORDER BY` in combination with other SQL methods to query and order the tables.

### Instructions

* Determine the count of actor first names ordered in descending order.

* Determine the average rental duration for each rating rounded to two decimals. Order these in ascending order.

* Determine the top 10 average replace costs for length of the movie. 

### Bonus

* Using the city and country tables, determine the number of cities in each country from the database in descending order.

---

© 2021 Trilogy Education Services, LLC, a 2U, Inc. brand.  Confidential and Proprietary.  All Rights Reserved.
*/

SELECT country.country, COUNT(country.country) AS "country count"
FROM city
JOIN country ON city.country_id = country.country_id
GROUP BY country.country
ORDER BY "country count" DESC;

SELECT DISTINCT ON (customer_id) customer_id, rental_date
FROM rental
ORDER BY customer_id, rental_date DESC;

--retrieve the latest rental for each customer's first and last name and email address
SELECT DISTINCT ON (cust.first_name, cust.last_name, cust.email) 
cust.first_name, cust.last_name, cust.email, ren.rental_date
FROM rental AS ren
	JOIN customer as cust  ON cust.customer_id = ren.customer_id
ORDER BY cust.first_name, cust.last_name, cust.email, ren.rental_date DESC;

SELECT cust.first_name, cust.last_name, cust.email, MAX(ren.rental_date) as last_rental
FROM rental ren
	JOIN customer cust ON cust.customer_id = ren.customer_id
GROUP BY cust.first_name, cust.last_name, cust.email
ORDER BY cust.first_name, cust.last_name, cust.email

--retrieve the latest rental date for each title
SELECT f.title, MAX(r.rental_date) as last_rental
FROM rental r
	JOIN inventory i
		ON r.inventory_id = i.inventory_id
	JOIN film f
		ON i.film_id = f.film_id
GROUP BY f.title
ORDER BY last_rental DESC;







