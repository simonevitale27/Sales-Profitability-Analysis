-- Analisi Profittabilità per Categoria e Sub-Categoria
-- Quali prodotti generano profitto e quali perdite?
-- Key Finding: Tables e Bookcases in perdita (-$20k) a causa sconti eccessivi (26%)
-- Business Impact: Eliminazione promozioni su prodotti non profittevoli

-- Panoramica generale business
SELECT 
    COUNT(DISTINCT Order_ID) as total_orders,
    COUNT(DISTINCT Customer_ID) as total_customers,
    ROUND(SUM(Sales), 2) as total_sales,
    ROUND(SUM(Profit), 2) as total_profit,
    ROUND((SUM(Profit) / SUM(Sales)) * 100, 2) as profit_margin_pct,
    ROUND(AVG(Discount) * 100, 2) as avg_discount_pct
FROM orders;

-- Sales e Profit per anno con YoY growth
SELECT 
    YEAR(STR_TO_DATE(Order_Date, '%m/%d/%Y')) as year,
    ROUND(SUM(Sales), 2) as total_sales,
    ROUND(SUM(Profit), 2) as total_profit,
    ROUND((SUM(Profit) / SUM(Sales)) * 100, 2) as profit_margin_pct,
    COUNT(DISTINCT Order_ID) as orders_count
FROM orders
GROUP BY YEAR(STR_TO_DATE(Order_Date, '%m/%d/%Y'))
ORDER BY year;

-- Profitability analysis per categoria
SELECT 
    Category,
    ROUND(SUM(Sales), 2) as total_sales,
    ROUND(SUM(Profit), 2) as total_profit,
    ROUND((SUM(Profit) / SUM(Sales)) * 100, 2) as profit_margin_pct,
    ROUND(AVG(Discount) * 100, 2) as avg_discount_pct,
    COUNT(DISTINCT Order_ID) as orders_count
FROM orders
GROUP BY Category
ORDER BY profit_margin_pct DESC;

-- Analisi sub-categorie Furniture
SELECT 
    Sub_Category,
    ROUND(SUM(Sales), 2) as total_sales,
    ROUND(SUM(Profit), 2) as total_profit,
    ROUND((SUM(Profit) / SUM(Sales)) * 100, 2) as profit_margin_pct,
    ROUND(AVG(Discount) * 100, 2) as avg_discount_pct
FROM orders
WHERE Category = 'Furniture'
GROUP BY Sub_Category
ORDER BY profit_margin_pct ASC;
