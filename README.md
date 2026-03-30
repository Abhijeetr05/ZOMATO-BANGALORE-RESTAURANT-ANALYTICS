# Zomato-Bangalore-Restaurant-Data-Analysis
## Project Overview
This project performs a comprehensive end-to-end SQL analysis on 7,105 real Zomato restaurants in Bangalore.
The goal is to extract meaningful business insights around customer ratings, pricing trends,
online ordering behaviour, and the best dining areas in the city — using only SQL.

## Tools & Technologies
- Database — PostgreSQL
- Query Tool — pgAdmin 4
- Language — SQL

## SQL Concepts Used
| Concept | Used For |
|----|----|
| SELECT, WHERE, GROUP BY, ORDER BY | Basic filtering and aggregation |
| COUNT, AVG, MAX, MIN, SUM | Statistical analysis |
| ROUND, CAST (::numeric) | Formatting decimal values |
| CASE WHEN | Rating & price category classification |
| Subqueries | Percentage calculations |
| IS NULL / DELETE | Data cleaning |
| DISTINCT | Unique value analysis | 
| HAVING | Filtered group results |

## Dataset Details
| Detail | Info |
|-----|----|
| Source | Zomato via Kaggle |
|City | Bangalore, India |
| Total Records | 7,105 restaurants | 
| Columns | 11|
| Null Values Handled | Yes (rate & avg_cost)|

## Key Insights
### Overall Stats

- Total restaurants analysed: 7,105
- Average rating across Bangalore: 3.71 / 5
- Average cost for two people: ₹537
- Restaurants with online ordering: 52.5%
- Restaurants with table booking: Only 10.5%

### Top Findings

- Quick Bites is the dominant restaurant type with 2,840 restaurants
- North Indian is Bangalore's most popular cuisine
- Restaurants with table booking have a noticeably higher average rating than those without
- Fine Dining restaurants have the highest average cost and ratings
- The majority of Bangalore restaurants fall in the "Good" (3.5–3.9) rating bucket
- Affordable restaurants (₹200–₹500) are the most common price segment
- Areas like Brigade Road and Indiranagar have the best rated restaurants

## Screenshots

<img width="1912" height="1021" alt="Screenshot 2026-03-30 122421" src="https://github.com/user-attachments/assets/ca3f3b55-bcd4-4c4f-abb5-250753063caa" />

