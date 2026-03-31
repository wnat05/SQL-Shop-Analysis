# SQL-Shop-Analysis

This project is a small-scale PostgreSQL database developed using two custom-designed tables, Products and Sale, to model a retail environment.

# Project Structure

The project is built around a relational model consisting of two primary tables:
- Products: Contains inventory details (Product ID, Name, Price, Category).
- Sale: Tracks transaction history (Sale ID, Product ID, Quantity, Date).

# Features & Queries

- Total Earnings per Product: Calculates the total revenue for each item by joining products with sales data ($price \times quantity$).
- Category Performance: Aggregates revenue by category to identify the most profitable product groups.
- Daily Sales Report (View): A virtual table that summarizes the number of items sold and total income for each specific date.
- Priority Classification: Uses CASE logic to categorize sales volume into High, Medium, and Low Sales priorities based on the quantity sold.
- Targeted Filtering: Retrieves high-value transactions (e.g., items over $50 with more than 2 units sold).
