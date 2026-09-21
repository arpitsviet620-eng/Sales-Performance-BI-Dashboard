
CREATE DATABASE IF NOT EXISTS sales_bi;
USE sales_bi;

DROP TABLE IF EXISTS sales;

CREATE TABLE sales (
    Order_ID INT PRIMARY KEY,
    Order_Date DATE,
    Customer_ID VARCHAR(20),
    Region VARCHAR(50),
    Category VARCHAR(50),
    Product VARCHAR(100),
    Quantity INT,
    Unit_Price DECIMAL(12,2),
    Discount DECIMAL(5,2),
    Revenue DECIMAL(14,2),
    Cost DECIMAL(14,2),
    Profit DECIMAL(14,2)
);

-- Import sales_cleaned.csv using MySQL Workbench:
-- Table Data Import Wizard -> select sales_cleaned.csv

-- 1. Total KPIs
SELECT
    ROUND(SUM(Revenue),2) AS Total_Revenue,
    ROUND(SUM(Cost),2) AS Total_Cost,
    ROUND(SUM(Profit),2) AS Total_Profit,
    ROUND(SUM(Profit)/NULLIF(SUM(Revenue),0)*100,2) AS Profit_Margin_Percent,
    COUNT(DISTINCT Order_ID) AS Total_Orders,
    SUM(Quantity) AS Total_Quantity
FROM sales;

-- 2. Monthly sales trend
SELECT
    DATE_FORMAT(Order_Date, '%Y-%m') AS Year_Month,
    ROUND(SUM(Revenue),2) AS Revenue,
    ROUND(SUM(Profit),2) AS Profit
FROM sales
GROUP BY DATE_FORMAT(Order_Date, '%Y-%m')
ORDER BY Year_Month;

-- 3. Region performance
SELECT
    Region,
    ROUND(SUM(Revenue),2) AS Revenue,
    ROUND(SUM(Profit),2) AS Profit,
    COUNT(DISTINCT Order_ID) AS Orders,
    ROUND(SUM(Profit)/NULLIF(SUM(Revenue),0)*100,2) AS Profit_Margin_Percent
FROM sales
GROUP BY Region
ORDER BY Revenue DESC;

-- 4. Category performance
SELECT
    Category,
    ROUND(SUM(Revenue),2) AS Revenue,
    ROUND(SUM(Profit),2) AS Profit
FROM sales
GROUP BY Category
ORDER BY Revenue DESC;

-- 5. Top 10 products
SELECT
    Product,
    SUM(Quantity) AS Units_Sold,
    ROUND(SUM(Revenue),2) AS Revenue,
    ROUND(SUM(Profit),2) AS Profit
FROM sales
GROUP BY Product
ORDER BY Revenue DESC
LIMIT 10;

-- 6. Customer performance
SELECT
    Customer_ID,
    COUNT(DISTINCT Order_ID) AS Orders,
    ROUND(SUM(Revenue),2) AS Revenue,
    ROUND(SUM(Profit),2) AS Profit
FROM sales
GROUP BY Customer_ID
ORDER BY Revenue DESC
LIMIT 20;

-- 7. Year-over-year revenue
SELECT
    YEAR(Order_Date) AS Sales_Year,
    ROUND(SUM(Revenue),2) AS Revenue
FROM sales
GROUP BY YEAR(Order_Date)
ORDER BY Sales_Year;
