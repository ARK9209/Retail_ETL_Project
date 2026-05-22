-- Average Product Price
SELECT AVG("MRP")
FROM sales;

-- Product Type Count
SELECT "ProductType",
       COUNT(*)
FROM sales
GROUP BY "ProductType"
ORDER BY COUNT(*) DESC;

-- Premium Products
SELECT "ProductType"
FROM sales
WHERE "PremiumProduct" = TRUE;

-- Average Outlet Age
SELECT AVG("OutletAge")
FROM sales;

-- Outlet Type count
SELECT "OutletType",
       COUNT(*)
FROM sales
GROUP BY "OutletType";

-- Distinct Product Types with MRP less than 100
select distinct "ProductType", "MRP" from sales
Where "MRP" < 100 ;

-- Product Type MRP range (min/max per ProductType)
SELECT "ProductType",
       MIN("MRP") AS "MinMRP",
       MAX("MRP") AS "MaxMRP",
       MIN("MRP") || ' - ' || MAX("MRP") AS "MRPRange"
FROM sales
GROUP BY "ProductType";

