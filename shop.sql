CREATE TABLE Products (
    product_id INTEGER PRIMARY KEY,
    name TEXT,
    price REAL,
    category TEXT
);

CREATE TABLE Sale (
    sale_id INTEGER PRIMARY KEY,
    product_id INTEGER,
    number_of_sold_products INT,
    sale_date DATE,
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

INSERT INTO Products (product_id, name, price, category) VALUES
(1, 'Black Skirt', 119.99, 'Clothes'),
(2, 'Mug with dots', 25.99, 'Ceramics'),
(3, 'Bread', 2.99, 'Food'),
(4, 'White Socks', 15.99, 'Clothes'),
(5, 'Flowers', 14.99, 'Plants'),
(6, 'Milk', 4.99, 'Food');

INSERT INTO Sale (sale_id, product_id, number_of_sold_products, sale_date) VALUES
(6, 1, 3, '2026-03-12'),
(5, 2, 5, '2026-03-30'),
(4, 3, 6, '2026-02-16'),
(3, 4, 2, '2026-01-19'),
(2, 5, 8, '2026-01-01'),
(1, 6, 9, '2026-04-18');

COMMIT

SELECT * FROM Products;

SELECT 
    p.name AS product_name,
    p.category AS category,
    s.number_of_sold_products AS quantity,
    p.price AS single_price,
    (p.price * s.number_of_sold_products) AS total_earnings
FROM Products p
JOIN Sale s ON p.product_id = s.product_id
ORDER BY total_earnings DESC;

SELECT 
    category, 
    SUM(price * number_of_sold_products) AS total_revenue
FROM Products p
JOIN Sale s ON p.product_id = s.product_id
GROUP BY category
ORDER BY total_revenue DESC;

CREATE VIEW daily_sales_report AS
SELECT 
    sale_date, 
    SUM(number_of_sold_products) AS items_sold,
    SUM(price * number_of_sold_products) AS daily_income
FROM Products p
JOIN Sale s ON p.product_id = s.product_id
GROUP BY sale_date;
SELECT * FROM daily_sales_report;

SELECT name, price, number_of_sold_products
FROM Products p
JOIN Sale s ON p.product_id = s.product_id
WHERE price > 50 AND number_of_sold_products > 2;

SELECT 
    p.name, 
    s.number_of_sold_products,
    CASE 
        WHEN s.number_of_sold_products > 5 THEN 'High Sales'
        WHEN s.number_of_sold_products BETWEEN 3 AND 5 THEN 'Medium Sales'
        ELSE 'Low Sales'
    END AS sales_priority
FROM Products p
JOIN Sale s ON p.product_id = s.product_id;