-- Budget vs Actual Analysis (2017)
-- Abbiamo raggiunto i target di crescita per categoria?
-- Key Finding: Office Supplies +16% vs budget, Furniture -6% (causa margini negativi)
-- Revisione target growth Furniture, focus su categorie profittevoli

WITH sales_2016 AS (
    SELECT 
        Category,
        SUM(Sales) as sales_2016
    FROM orders
    WHERE YEAR(STR_TO_DATE(Order_Date, '%m/%d/%Y')) = 2016
    GROUP BY Category
),
sales_2017 AS (
    SELECT 
        Category,
        SUM(Sales) as sales_2017
    FROM orders
    WHERE YEAR(STR_TO_DATE(Order_Date, '%m/%d/%Y')) = 2017
    GROUP BY Category
)
SELECT 
    s17.Category,
    ROUND(s16.sales_2016, 2) as sales_2016,
    ROUND(s16.sales_2016 * 1.15, 2) as budget_2017,
    ROUND(s17.sales_2017, 2) as actual_2017,
    ROUND(s17.sales_2017 - (s16.sales_2016 * 1.15), 2) as variance_amount,
    ROUND(((s17.sales_2017 / (s16.sales_2016 * 1.15)) - 1) * 100, 2) as variance_pct
FROM sales_2016 s16
JOIN sales_2017 s17 ON s16.Category = s17.Category
ORDER BY variance_pct DESC;