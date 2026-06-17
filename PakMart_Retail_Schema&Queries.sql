Create database if not exists PakMart_Retail_DB;
Use PakMart_Retail_DB;

-- ==================================
-- Creatign tables: Grocery
-- ===================================
create table if not exists groceries(
groceries_id int auto_increment primary key,
grocery_name varchar(200),
size varchar(20) not null,
brand varchar(100) default 'Unbranded',
unit varchar(10) not null,
min_price decimal(10,2),
max_price decimal(10,2)
);

-- ==================================
-- Electronics
-- ===================================
create table if not exists electronics(
electronic_id int auto_increment primary key,
electronic_name varchar(200),
brand varchar(100) default 'Unbranded',
price decimal(10,2)
);

-- ==================================
-- Home
-- ===================================
create table if not exists home(
household_id int auto_increment primary key,
household_name varchar(200),
brand varchar(100) default 'Unbranded',
min_price decimal(10,2),
max_price decimal(10,2)
);

-- ==================================
-- Fashion
-- ===================================
create table if not exists fashion(
fashion_id int auto_increment primary key,
fashion_name varchar(200),
brand varchar(100) default 'Unbranded',
min_price decimal(10,2),
max_price decimal(10,2)
);

-- ==================================
-- Store
-- ===================================
create table if not exists stores(
store_id int auto_increment primary key,
store_name varchar(200),
city varchar(100) not null,
store_size enum('Small', 'Medium', 'Large'),
open_date date
);

-- ==================================
-- Customer
-- ===================================
create table if not exists customers(
customer_id int auto_increment primary key,
customer_name varchar(200),
customer_city varchar(100) not null,
gender ENUM('Male', 'Female'),
age INT,
email VARCHAR(150),
join_date DATE
);

-- ==================================
-- Promotions
-- ===================================
create table if not exists promotions(
promotion_id INT AUTO_INCREMENT PRIMARY KEY,
promotion_name VARCHAR(200),
promotion_type ENUM('Seasonal', 'Flash Sale'),
season VARCHAR(100),      
discount_percent DECIMAL(5,2),
start_date DATE,
end_date DATE
);

-- ==================================
-- Products
-- ===================================
CREATE TABLE IF NOT EXISTS products (
product_id INT AUTO_INCREMENT PRIMARY KEY,
product_name VARCHAR(200),
category ENUM('Groceries', 'Electronics', 'Fashion', 'Home'),
category_item_id INT    
);

-- ==================================
-- Promoted Products
-- ===================================
CREATE TABLE IF NOT EXISTS promotion_products (
promotion_product_id INT AUTO_INCREMENT PRIMARY KEY,
promotion_id INT,
product_id INT,
FOREIGN KEY (promotion_id) REFERENCES promotions(promotion_id),
FOREIGN KEY (product_id) REFERENCES products (product_id)
);

-- ==================================
-- Sales
-- ===================================
CREATE TABLE IF NOT EXISTS sales (
sale_id INT AUTO_INCREMENT PRIMARY KEY,
customer_id INT,
store_id INT,
product_id INT,
promotion_id INT NULL,
quantity INT,
sale_price DECIMAL(10,2),
sale_date DATE,
FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
FOREIGN KEY (store_id) REFERENCES stores(store_id),
FOREIGN KEY (product_id) REFERENCES products(product_id),
FOREIGN KEY (promotion_id) REFERENCES promotions(promotion_id)
);


-- ==================================
-- Data inserting 
-- cusotmers(through csv in cusotmers)
-- ==================================
select * from customers;


-- ==================================
-- Groceries
-- ==================================
INSERT INTO groceries (grocery_name, size, brand, unit, min_price, max_price) VALUES
('Dal Chana', '1', 'Mehran', 'kg', 230.00, 450.00),
('Sugar', '1', 'Tate & Lyle', 'kg', 220.00, 400.00),
('Wheat Flour', '10', 'Sunridge', 'kg', 1400.00, 2000.00),
('Basmati Rice', '1', 'Guard', 'kg', 300.00, 600.00),
('Cooking Oil', '1', 'Dalda', 'L', 530.00, 640.00),
('Cooking Oil/Ghee', '5', 'Habib', 'L', 2725.00, 3000.00),
('Tea', '1', 'Tapal', 'kg', 1200.00, 2500.00),
('Salt', '800', 'Himalayan Chef', 'gm', 80.00, 120.00),
('Red Chili Powder', '200', 'National', 'gm', 150.00, 350.00),
('Milk UHT', '1', 'Olpers', 'L', 250.00, 350.00);
select * from groceries;

-- ==================================
-- Electronics 
-- ==================================
INSERT INTO electronics (electronic_name, brand, price) VALUES
('LCD Writing Tablet 8.5"', 'Unbranded', 899.00),
('Digital Kitchen Scale 10kg', 'Unbranded', 1199.00),
('Electronic Body Weight Scale', 'Unbranded', 1844.00),
('Waterproof Bluetooth Smartwatch', 'Unbranded', 2184.00),
('Single Tub Washing Machine 10kg', 'Super Asia', 21499.00),
('32" Android Smart LED TV', 'SG', 34999.00),
('32" Full HD Android LED TV', 'TCL', 51499.00),
('1.0 Ton Inverter AC', 'Haier', 110000.00),
('17kg Fully Automatic Washing Machine', 'Dawlance', 132999.00),
('75" 4K Ultra HD Android LED TV', 'TCL', 363599.00);
select * from electronics;

-- ==================================
-- Fashion 
-- ==================================
INSERT INTO fashion (fashion_name, brand, min_price, max_price) VALUES
('Casual Suits Collection', 'Zellbury', 1000.00, 4000.00),
('Fast Fashion Pret', 'Limelight', 990.00, 7000.00),
('Ethnic Fusion Wear', 'Khaadi', 2000.00, 12000.00),
('Luxury Lawn Collection', 'Sapphire', 2500.00, 15000.00),
('Premium Lawn Unstitched', 'Gul Ahmed', 2000.00, 18000.00),
('Formal Party Wear', 'Sana Safinaz', 3500.00, 20000.00),
('Office Wear Cotton', 'Alkaram Studio', 1800.00, 10000.00),
('Festive Lawn Collection', 'Bonanza Satrangi', 1500.00, 8000.00),
('Heavy Embroidery Luxury', 'Asim Jofa', 4500.00, 25000.00),
('Casual Elegant Fusion', 'Beechtree', 1200.00, 6500.00);
select * from fashion;

-- ==================================
-- Home 
-- ==================================
INSERT INTO home (household_name, brand, min_price, max_price) VALUES
('3D Wooden Wall Art', 'Unbranded', 89.00, 1299.00),
('Door Draft & Insect Stopper', 'Unbranded', 150.00, 450.00),
('Kitchen & Bathroom Organizer', 'Unbranded', 199.00, 2500.00),
('Foldable Fabric Storage Cubes', 'Unbranded', 299.00, 1500.00),
('Floating Wall Shelves', 'Unbranded', 300.00, 2000.00),
('Cushions & Sofa Covers', 'Unbranded', 500.00, 3500.00),
('Electric Bakhoor Burner', 'Unbranded', 900.00, 2500.00),
('Sunset Lamp & LED Nightlight', 'Unbranded', 700.00, 2500.00),
('Ottoman Stool & Footrest', 'Unbranded', 1500.00, 5000.00),
('Fabric Shaver & Lint Remover', 'Unbranded', 800.00, 2000.00);
select * from home;

-- ==================================
-- Stores 
-- ==================================
INSERT INTO stores (store_name, city, store_size, open_date) VALUES
('PakMart Saddar', 'Karachi', 'Large', '2019-03-15'),
('PakMart Gulshan', 'Karachi', 'Medium', '2020-07-01'),
('PakMart DHA', 'Karachi', 'Large', '2018-11-20'),
('PakMart Korangi', 'Karachi', 'Small', '2021-05-10'),
('PakMart Gulberg', 'Lahore', 'Large', '2017-09-01'),
('PakMart DHA Lahore', 'Lahore', 'Large', '2019-01-15'),
('PakMart Johar Town', 'Lahore', 'Medium', '2020-04-22'),
('PakMart Model Town', 'Lahore', 'Medium', '2021-08-30'),
('PakMart Blue Area', 'Islamabad', 'Large', '2018-06-10'),
('PakMart F-10', 'Islamabad', 'Medium', '2020-02-14'),
('PakMart G-9', 'Islamabad', 'Medium', '2021-11-05'),
('PakMart E-11', 'Islamabad', 'Small', '2022-03-18'),
('PakMart Sialkot Cantt', 'Sialkot', 'Large', '2019-07-25'),
('PakMart Sialkot City', 'Sialkot', 'Medium', '2020-10-12'),
('PakMart Wazirabad Road', 'Sialkot', 'Small', '2021-06-08'),
('PakMart Paris Road', 'Sialkot', 'Medium', '2022-01-20'),
('PakMart Jaranwala Road', 'Faisalabad', 'Large', '2018-04-05'),
('PakMart Susan Road', 'Faisalabad', 'Large', '2019-09-17'),
('PakMart Peoples Colony', 'Faisalabad', 'Medium', '2021-02-28'),
('PakMart Ghulam Muhammad Abad', 'Faisalabad', 'Small', '2022-07-14'),
('PakMart Gwadar Port', 'Gwadar', 'Large', '2020-12-01'),
('PakMart Gwadar City', 'Gwadar', 'Medium', '2021-09-10'),
('PakMart Eastbay', 'Gwadar', 'Small', '2022-05-22'),
('PakMart Sangar', 'Gwadar', 'Small', '2023-01-15');
select * from stores;

-- ==================================
-- Promotions 
-- ==================================
INSERT INTO promotions (promotion_name, promotion_type, season, discount_percent, start_date, end_date) VALUES
('Ramzan Sale 2024', 'Seasonal', 'Ramzan', 20.00, '2024-03-11', '2024-04-10'),
('Eid ul Fitr Sale 2024', 'Seasonal', 'Eid ul Fitr', 30.00, '2024-04-10', '2024-04-12'),
('Eid ul Adha Sale 2024', 'Seasonal', 'Eid ul Adha', 25.00, '2024-06-17', '2024-06-19'),
('Independence Day Sale 2024', 'Seasonal', 'Independence Day', 14.00, '2024-08-14', '2024-08-16'),
('Daraz 11.11 Sale 2024', 'Flash Sale', 'Daraz 11.11', 40.00, '2024-11-11', '2024-11-11'),
('Daraz 12.12 Sale 2024', 'Flash Sale', 'Daraz 12.12', 35.00, '2024-12-12', '2024-12-12');
select * from promotions;

-- ==================================
-- Products 
-- ==================================
INSERT INTO products (product_name, category, category_item_id) VALUES
-- Groceries (category_item_id)
('Dal Chana', 'Groceries', 1),
('Sugar', 'Groceries', 2),
('Wheat Flour', 'Groceries', 3),
('Basmati Rice', 'Groceries', 4),
('Cooking Oil', 'Groceries', 5),
('Cooking Oil/Ghee', 'Groceries', 6),
('Tea', 'Groceries', 7),
('Salt', 'Groceries', 8),
('Red Chili Powder', 'Groceries', 9),
('Milk UHT', 'Groceries', 10),
-- Electronics (category_item_id)
('LCD Writing Tablet 8.5"', 'Electronics', 1),
('Digital Kitchen Scale 10kg', 'Electronics', 2),
('Electronic Body Weight Scale', 'Electronics', 3),
('Waterproof Bluetooth Smartwatch', 'Electronics', 4),
('Single Tub Washing Machine 10kg', 'Electronics', 5),
('32" Android Smart LED TV', 'Electronics', 6),
('32" Full HD Android LED TV', 'Electronics', 7),
('1.0 Ton Inverter AC', 'Electronics', 8),
('17kg Fully Automatic Washing Machine', 'Electronics', 9),
('75" 4K Ultra HD Android LED TV', 'Electronics', 10),
-- Fashion (category_item_id)
('Casual Suits Collection', 'Fashion', 1),
('Fast Fashion Pret', 'Fashion', 2),
('Ethnic Fusion Wear', 'Fashion', 3),
('Luxury Lawn Collection', 'Fashion', 4),
('Premium Lawn Unstitched', 'Fashion', 5),
('Formal Party Wear', 'Fashion', 6),
('Office Wear Cotton', 'Fashion', 7),
('Festive Lawn Collection', 'Fashion', 8),
('Heavy Embroidery Luxury', 'Fashion', 9),
('Casual Elegant Fusion', 'Fashion', 10),
-- Home (category_item_id)
('3D Wooden Wall Art', 'Home', 1),
('Door Draft & Insect Stopper', 'Home', 2),
('Kitchen & Bathroom Organizer', 'Home', 3),
('Foldable Fabric Storage Cubes', 'Home', 4),
('Floating Wall Shelves', 'Home', 5),
('Cushions & Sofa Covers', 'Home', 6),
('Electric Bakhoor Burner', 'Home', 7),
('Sunset Lamp & LED Nightlight', 'Home', 8),
('Ottoman Stool & Footrest', 'Home', 9),
('Fabric Shaver & Lint Remover', 'Home', 10);
select * from products;

-- ==================================
-- Promotion Products
-- ==================================
INSERT INTO promotion_products (promotion_id, product_id) VALUES
-- Ramzan Sale: Groceries + Fashion
(1,1),(1,2),(1,3),(1,4),(1,5),(1,6),(1,7),(1,8),(1,9),(1,10),
(1,21),(1,22),(1,23),(1,24),(1,25),(1,26),(1,27),(1,28),(1,29),(1,30),
-- Eid ul Fitr: Fashion + Home
(2,21),(2,22),(2,23),(2,24),(2,25),(2,26),(2,27),(2,28),(2,29),(2,30),
(2,31),(2,32),(2,33),(2,34),(2,35),(2,36),(2,37),(2,38),(2,39),(2,40),
-- Eid ul Adha: Groceries + Fashion + Home
(3,1),(3,2),(3,3),(3,4),(3,5),(3,6),
(3,21),(3,22),(3,23),(3,24),(3,25),(3,26),
(3,31),(3,32),(3,33),(3,34),(3,35),(3,36),
-- Independence Day: Electronics + Home
(4,11),(4,12),(4,13),(4,14),(4,15),(4,16),(4,17),(4,18),(4,19),(4,20),
(4,31),(4,32),(4,33),(4,34),(4,35),(4,36),(4,37),(4,38),(4,39),(4,40),
-- Daraz 11.11: All categories
(5,1),(5,2),(5,3),(5,4),(5,5),
(5,11),(5,12),(5,13),(5,14),(5,15),(5,16),(5,17),(5,18),(5,19),(5,20),
(5,21),(5,22),(5,23),(5,24),(5,25),
(5,31),(5,32),(5,33),(5,34),(5,35),
-- Daraz 12.12: All categories
(6,6),(6,7),(6,8),(6,9),(6,10),
(6,11),(6,12),(6,13),(6,14),(6,15),(6,16),(6,17),(6,18),(6,19),(6,20),
(6,26),(6,27),(6,28),(6,29),(6,30),
(6,36),(6,37),(6,38),(6,39),(6,40);
select * from promotion_products;


-- =========================================================
-- Sales data (7000 rows) was generated using a stored procedure (sales_procedure.sql)
-- Procedure randomly assigns customers, stores, products, dates and auto-applies
-- promotion discounts based on date ranges. See sales_procedure.sql for full code.
-- =========================================================

-- Check sales distribution by category
SELECT p.category, COUNT(*) as total_sales, ROUND(SUM(s.sale_price * s.quantity), 2) as total_revenue
FROM sales s
JOIN products p ON s.product_id = p.product_id
GROUP BY p.category;

-- Check promotion vs non-promotion sales
SELECT 
    CASE WHEN promotion_id IS NULL THEN 'No Promotion' ELSE 'With Promotion' END as sale_type,
    COUNT(*) as total_sales
FROM sales
GROUP BY sale_type;

-- Check sales by city
SELECT st.city, COUNT(*) as total_sales
FROM sales s
JOIN stores st ON s.store_id = st.store_id
GROUP BY st.city;

-- =========================================================
-- Queries
-- Which promotion generated the most revenue?
-- =========================================================
select p.promotion_name, round(sum(s.sale_price * s.quantity),2) as revenue
from sales as s
join promotions as p
on p.promotion_id= s.promotion_id
group by promotion_name
order by revenue desc;

-- =========================================================
-- Which product category generates the most revenue overall?
-- =========================================================
select  pro.category, round(sum(s.sale_price * s.quantity),2) as revenue
from sales as s
join products as pro
on pro.product_id= s.product_id
group by pro.category
order by revenue desc;

-- =========================================================
-- Which specific product is the top seller in each category?
-- =========================================================
WITH ranked_products AS (
    SELECT 
        pro.category,
        pro.product_name,
        ROUND(SUM(s.sale_price * s.quantity), 2) AS revenue,
        RANK() OVER (PARTITION BY pro.category ORDER BY SUM(s.sale_price * s.quantity) DESC) AS rnk
    FROM sales AS s
    JOIN products AS pro ON pro.product_id = s.product_id
    GROUP BY pro.category, pro.product_name
)
SELECT category, product_name, revenue
FROM ranked_products
WHERE rnk = 1
ORDER BY revenue DESC;


-- =========================================================
-- Which city generates the most revenue during promotions only?
-- =========================================================
select st.city, sum(s.sale_price * s.quantity) as revenue
from stores as st
join sales as s
on s.store_id = st.store_id
join promotions  as ps 
on ps.promotion_id =  s.promotion_id
group by st.city
order by revenue desc;

-- =========================================================
-- Monthly revenue comparison — how did sales trend across all 12 months of 2024?
-- =========================================================
Select Month(sale_date), round(sum(sale_price * quantity),2) as revenue
from sales
group by Month(sale_date) 
order by month(sale_date) asc;

-- =========================================================
-- how much did revenue grow or drop compared to previous month?
-- =========================================================
with monthly as (
Select month(sale_date) as month, round(sum(sale_price * quantity),2) as revenue
from sales 
group by month(sale_date)
)

select month, revenue,
		lag(revenue) over(order by month asc) as prev_month_revenue,
        round(revenue - lag(revenue) OVER(order by month asc),2)  as changes
	from monthly
    order by month;
        
-- =========================================================
-- Top performing store in each city by revenue.
-- =========================================================
with top_performing  as (
      
        Select st.store_name as store_name,st.city as store_city, round(sum(s.sale_price * s.quantity),2) as top_sales,
        dense_rank () over(partition by st.city order by  round(sum(s.sale_price * s.quantity),2) desc) as top_performer
        from sales as s
        join stores as st
        on st.store_id = s.store_id
        GROUP BY st.store_name, st.city
)

select store_name, store_city, top_performer
from top_performing
where top_performer=1
order by top_performer desc;

-- =========================================================
-- Promotion vs non-promotion revenue per category.
-- =========================================================
WITH promo_per_cat as (
			
            Select p.category, 
            Case when s.promotion_id is not null then 'With promotion' else 'Without promotion'
            end as sale_type,
            round(sum(s.sale_price * s.quantity),2) as revenue
            from sales as s
			join products as p
            on p.product_id = s.product_id
             GROUP BY p.category, sale_type
)

SELECT category, sale_type, revenue
FROM promo_per_cat
ORDER BY category, revenue DESC;

-- =========================================================
-- Top 5 customers by total spending.
-- =========================================================
Select c.customer_name, round(sum(s.sale_price * s.quantity),2) as total_spendings
from customers as c 
join sales as s
on c.customer_id = s.customer_id
group by c.customer_name
order by total_spendings desc 
limit 5;





