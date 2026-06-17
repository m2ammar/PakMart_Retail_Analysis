USE PakMart_Retail_DB;

-- =============================================================
-- This procedure was run ONCE to generate 7000 sales rows for PakMart_Retail_DB
-- Do NOT run again unless sales table is cleared first
-- =============================================================

DELIMITER $$

CREATE PROCEDURE GenerateSales()
BEGIN
    DECLARE i INT DEFAULT 1;
    DECLARE v_customer_id INT;
    DECLARE v_store_id INT;
    DECLARE v_product_id INT;
    DECLARE v_promotion_id INT;
    DECLARE v_quantity INT;
    DECLARE v_sale_price DECIMAL(10,2);
    DECLARE v_sale_date DATE;
    DECLARE v_day_of_year INT;
    DECLARE v_category VARCHAR(20);
    DECLARE v_base_price DECIMAL(10,2);
    DECLARE v_discount DECIMAL(5,2);

    WHILE i <= 7000 DO
        -- Random customer (1-1000)
        SET v_customer_id = FLOOR(1 + RAND() * 1000);

        -- Random store (1-24)
        SET v_store_id = FLOOR(1 + RAND() * 24);

        -- Random product (1-40)
        SET v_product_id = FLOOR(1 + RAND() * 40);

        -- Random date in 2024
        SET v_sale_date = DATE_ADD('2024-01-01', INTERVAL FLOOR(RAND() * 366) DAY);
        SET v_day_of_year = DAYOFYEAR(v_sale_date);

        -- Determine promotion based on date
        -- Ramzan: Mar 11 - Apr 10 (day 71-101)
        -- Eid ul Fitr: Apr 10-12 (day 101-103)
        -- Eid ul Adha: Jun 17-19 (day 169-171)
        -- Independence Day: Aug 14-16 (day 227-229)
        -- Daraz 11.11: Nov 11 (day 316)
        -- Daraz 12.12: Dec 12 (day 347)

        IF v_day_of_year BETWEEN 71 AND 101 THEN
            SET v_promotion_id = 1; -- Ramzan
        ELSEIF v_day_of_year BETWEEN 101 AND 103 THEN
            SET v_promotion_id = 2; -- Eid ul Fitr
        ELSEIF v_day_of_year BETWEEN 169 AND 171 THEN
            SET v_promotion_id = 3; -- Eid ul Adha
        ELSEIF v_day_of_year BETWEEN 227 AND 229 THEN
            SET v_promotion_id = 4; -- Independence Day
        ELSEIF v_day_of_year = 316 THEN
            SET v_promotion_id = 5; -- Daraz 11.11
        ELSEIF v_day_of_year = 347 THEN
            SET v_promotion_id = 6; -- Daraz 12.12
        ELSE
            SET v_promotion_id = NULL; -- No promotion
        END IF;

        -- Get category of product
        SELECT category INTO v_category FROM products WHERE product_id = v_product_id;

        -- Determine base price by category
        IF v_category = 'Groceries' THEN
            SET v_base_price = (SELECT (min_price + max_price) / 2 FROM groceries 
                WHERE groceries_id = (SELECT category_item_id FROM products WHERE product_id = v_product_id));
        ELSEIF v_category = 'Electronics' THEN
            SET v_base_price = (SELECT price FROM electronics 
                WHERE electronic_id = (SELECT category_item_id FROM products WHERE product_id = v_product_id));
        ELSEIF v_category = 'Fashion' THEN
            SET v_base_price = (SELECT (min_price + max_price) / 2 FROM fashion 
                WHERE fashion_id = (SELECT category_item_id FROM products WHERE product_id = v_product_id));
        ELSEIF v_category = 'Home' THEN
            SET v_base_price = (SELECT (min_price + max_price) / 2 FROM home 
                WHERE household_id = (SELECT category_item_id FROM products WHERE product_id = v_product_id));
        END IF;

        -- Apply discount if promotion active
        IF v_promotion_id IS NOT NULL THEN
            SELECT discount_percent INTO v_discount FROM promotions WHERE promotion_id = v_promotion_id;
            SET v_sale_price = ROUND(v_base_price * (1 - v_discount / 100), 2);
        ELSE
            SET v_sale_price = v_base_price;
        END IF;

        -- Random quantity based on category
        IF v_category = 'Electronics' THEN
            SET v_quantity = FLOOR(1 + RAND() * 3); -- 1-3
        ELSEIF v_category = 'Groceries' THEN
            SET v_quantity = FLOOR(1 + RAND() * 10); -- 1-10
        ELSE
            SET v_quantity = FLOOR(1 + RAND() * 5); -- 1-5
        END IF;

        -- Insert sale
        INSERT INTO sales (customer_id, store_id, product_id, promotion_id, quantity, sale_price, sale_date)
        VALUES (v_customer_id, v_store_id, v_product_id, v_promotion_id, v_quantity, v_sale_price, v_sale_date);

        SET i = i + 1;
    END WHILE;
END$$

DELIMITER ;

-- Run the procedure
CALL GenerateSales();

-- Verify
SELECT COUNT(*) AS total_sales FROM sales;
