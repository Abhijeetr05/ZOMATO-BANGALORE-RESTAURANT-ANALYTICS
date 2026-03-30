CREATE TABLE restaurants (
	id                  INT,
    restaurant_name     VARCHAR(200),
    restaurant_type     VARCHAR(100),
    rate                FLOAT,
    num_of_ratings      INT,
    avg_cost            FLOAT,
    online_order        VARCHAR(5),
    table_booking       VARCHAR(5),
    cuisines_type       VARCHAR(300),
    area                VARCHAR(200),
    local_address       VARCHAR(200)
);
SELECT * FROM restaurants LIMIT 10;

-- Check total records
SELECT COUNT(*) AS total_records FROM restaurants;


-- Check for NULL or empty values in important columns
SELECT 
    SUM(CASE WHEN restaurant_name IS NULL OR restaurant_name = '' THEN 1 ELSE 0 END) AS missing_name,
    SUM(CASE WHEN rate IS NULL THEN 1 ELSE 0 END)                                    AS missing_rate,
    SUM(CASE WHEN avg_cost IS NULL THEN 1 ELSE 0 END)                                AS missing_cost,
    SUM(CASE WHEN cuisines_type IS NULL OR cuisines_type = '' THEN 1 ELSE 0 END)     AS missing_cuisine
FROM restaurants;

-- Delete the null value in both columns
DELETE FROM restaurants
WHERE rate IS NULL AND avg_cost IS NULL;

-- Delete the null value in both columns because there are NO online_order and table_booking.
DELETE FROM restaurants
WHERE rate IS NULL OR avg_cost IS NULL;

-- Total Restaurants
SELECT COUNT(*) AS total_restaurants FROM restaurants;

-- Name the restaurant type
SELECT DISTINCT restaurant_type AS unique_types 
FROM restaurants;

-- Total resturants types
SELECT COUNT(DISTINCT restaurant_type) AS Total_Restaurants_Types FROM restaurants;


-- Total Number of order by restaurants type
SELECT restaurant_type,COUNT(*) AS Total FROM restaurants
GROUP BY restaurant_type
ORDER BY  Total DESC;

-- Total number of restaurant get online order with percentage
SELECT online_order, COUNT(*) AS Total, ROUND(COUNT(*) *100.0 / (SELECT COUNT(*) FROM restaurants), 2) AS Percentage 
FROM restaurants
GROUP BY online_order;

-- Total number table booking in restaurants with percentage
SELECT table_booking, COUNT(*) AS total, ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM restaurants), 2) AS percentage
FROM restaurants
GROUP BY table_booking;

-- Area wise most restaurants
SELECT area, COUNT(*) AS total_restaurants FROM restaurants
GROUP BY area
ORDER BY total_restaurants DESC
LIMIT 10;

-- Cuisine types by restaurants 
SELECT cuisines_type, COUNT(*) AS total FROM restaurants
GROUP BY cuisines_type
ORDER BY total DESC
LIMIT 15;

-- Average rate of all restaurants 
SELECT ROUND(AVG(rate)::numeric,2) AS avg_rating FROM restaurants
WHERE rate IS NOT NULL;

-- Average cost according restaurant_type
SELECT restaurant_type, ROUND(AVG(avg_cost)::numeric ,2) AS Avg_price FROM restaurants
GROUP BY restaurant_type
ORDER BY Avg_price DESC;

-- Max price of all restaurant_types
SELECT restaurant_type,MAX (avg_cost)  FROM restaurants
GROUP BY restaurant_type
ORDER BY max DESC;


--Top 10 Rated restaurants(number of rating)
SELECT * FROM restaurants 
WHERE num_of_ratings >=100
ORDER BY rate DESC, num_of_ratings DESC
LIMIT 15;

--- Top most review restaurants
SELECT restaurant_name, restaurant_type, num_of_ratings, rate, area
FROM restaurants
ORDER BY num_of_ratings DESC
LIMIT 10;


---Average cost as per area 
SELECT area, COUNT(*) AS total_restaurants, ROUND(AVG(avg_cost)::numeric, 2) AS Average_cost
FROM restaurants
WHERE avg_cost IS NOT NULL
GROUP BY area
ORDER BY Average_cost DESC;


--- Online order affected rating and cost
SELECT online_order, COUNT(*) AS total_restaurants, ROUND(AVG(rate)::NUMERIC, 2) AS Average_rating, ROUND(AVG(avg_cost)::NUMERIC, 2) AS Average_cost
FROM  restaurants
WHERE rate IS NOT NULL
GROUP BY online_order;

-- Rating category how many restaurants fall in each rating bucket.
SELECT CASE WHEN rate>=4.5 THEN 'Excellent'
	   WHEN rate>=4.0 THEN 'Very Good'
	   WHEN rate>=3.5 THEN 'Good'
	   WHEN rate>=3.0 THEN 'Average'
	   ELSE 'Below Average'
	   END AS rating_category,
COUNT(*) AS total_restaurants FROM restaurants 
WHERE rate IS NOT NULL
GROUP BY rating_category
ORDER BY total_restaurants DESC;


--- Same as price category of all restaurants
SELECT CASE WHEN avg_cost <= 200 THEN 'Budget'
	   WHEN avg_cost <= 500 THEN 'Affordable'
	   WHEN avg_cost <= 1000 THEN 'Mid-Range'
	   WHEN avg_cost <=2000 THEN 'Premium'
	   ELSE 'Luxury'
	   END AS price_category,
COUNT(*) AS total_restaurants FROM restaurants 
WHERE avg_cost IS NOT NULL
GROUP BY price_category
ORDER BY total_restaurants DESC;


--- area wise average rating and average cost 
SELECT area, COUNT(*) AS total_restaurants, ROUND(AVG(rate)::numeric, 2) AS avg_rating,ROUND(AVG(avg_cost)::numeric, 2) AS avg_cost
FROM restaurants
WHERE rate IS NOT NULL
GROUP BY area
ORDER BY avg_rating DESC
LIMIT 10;

--- Restaurant with Online order and table booking
SELECT restaurant_name, restaurant_type, rate, avg_cost, area FROM restaurants
WHERE online_order = 'Yes' AND table_booking = 'Yes' AND rate >= 4.0
ORDER BY rate DESC
LIMIT 15;

--Overall Summery 
SELECT COUNT(*) AS total_restaurants, ROUND(AVG(rate)::numeric, 2) AS avg_rating, ROUND(AVG(avg_cost)::numeric, 2) AS average_cost,
    SUM(CASE WHEN online_order = 'Yes' THEN 1 ELSE 0 END) AS online_order_count,
    SUM(CASE WHEN table_booking = 'Yes' THEN 1 ELSE 0 END) AS table_booking_count,
    MAX(rate) AS highest_rating,
    MIN(rate) AS lowest_rating
FROM restaurants;
