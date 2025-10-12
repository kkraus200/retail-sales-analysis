-- ========================================
-- Retail Sales Analysis - SQL Queries
-- Author: Kyle Kraus
-- Description: Key queries for analyzing retail sales dataset
-- ========================================

-- Top 5 Products by Quantity Sold
-- Shows the 5 products with the highest total units sold
SELECT Description, SUM(Quantity) AS TotalQuantity
FROM retail_sales
GROUP BY Description
ORDER BY TotalQuantity DESC
LIMIT 5;


-- Top 5 Products by Total Revenue
-- Shows the 5 products generating the highest revenue (Quantity * UnitPrice)
FROM retail_sales
GROUP BY Description
ORDER BY TotalRevenue DESC
LIMIT 5;


-- Top 5 Customers by Total Spending
-- Shows the 5 customers who spent the most, ignoring missing CustomerID
SELECT CustomerID, SUM(Quantity * UnitPrice) AS TotalSpent
FROM retail_sales
WHERE CustomerID IS NOT NULL
GROUP BY CustomerID
ORDER BY TotalSpent DESC
LIMIT 5;


-- Monthly Sales Trend
-- Shows total sales revenue per month to analyze sales trends over time
SELECT 
    SUBSTR(InvoiceDate, 1, 7) AS Month, 
    ROUND(SUM(Quantity * UnitPrice), 2) AS TotalSales
FROM retail_sales
GROUP BY Month
ORDER BY Month;


-- Top 20 Products Overall
-- Shows top 20 products by revenue, broken down by country
SELECT Country, Description, SUM(Quantity * UnitPrice) AS TotalRevenue
FROM retail_sales
GROUP BY Country, Description
ORDER BY TotalRevenue DESC
LIMIT 20;


-- Identify Sales Returns / Negative Quantities 
-- Shows products with negative quantities (returns) and the revenue impact
SELECT Description, SUM(Quantity) AS TotalReturned, SUM(Quantity * UnitPrice) AS RevenueImpact
FROM retail_sales
WHERE Quantity < 0
GROUP BY Description
ORDER BY RevenueImpact ASC
LIMIT 10;


-- Segment Customers by Total Revenue
-- Shows top 15 customers contributing most revenue, ignoring missing CustomerID 
SELECT CustomerID, SUM(Quantity * UnitPrice) AS TotalRevenue
FROM retail_sales
WHERE CustomerID IS NOT NULL
GROUP BY CustomerID
ORDER BY TotalRevenue DESC
LIMIT 15;


-- Monthly Sales Trends by Revenue 
-- Summarizes total revenue per month to see seasonal trends
SELECT
	SUBSTR(InvoiceDate, 1, 7) AS YearMonth,
	SUM(Quantity * UnitPrice) AS MonthlyRevenue
FROM retail_sales
GROUP BY YearMonth
ORDER BY YearMonth ASC;

