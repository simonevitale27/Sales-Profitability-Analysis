-- Analisi Performance di Regione
-- Quali regioni sono più profittevoli e perché?
-- Central ha margini 7,9% (vs 14,9% West) per sconti eccessivi (24%)
-- Riduzione sconti Central può portare +$30k come profit stimato
SELECT 
    Region,
    ROUND(SUM(Sales), 2) as total_sales,
    ROUND(SUM(Profit), 2) as total_profit,
    ROUND((SUM(Profit) / SUM(Sales)) * 100, 2) as profit_margin_pct,
    ROUND(AVG(Discount) * 100, 2) as avg_discount_pct,
    COUNT(DISTINCT Customer_ID) as unique_customers,
    COUNT(DISTINCT Order_ID) as total_orders,
    ROUND(SUM(Sales) / COUNT(DISTINCT Customer_ID), 2) as revenue_per_customer
FROM orders
GROUP BY Region
ORDER BY total_sales DESC;