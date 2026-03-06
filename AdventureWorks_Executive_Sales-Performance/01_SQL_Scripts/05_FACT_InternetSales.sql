/*
PROJECT: AdventureWorks Global Sales Analysis
OBJECTIVE: Extraction and Transformation of Internet Sales Fact Table
TABLE: FactInternetSales
AUTHOR: VizTraveler
DESCRIPTION: 
- Extracts key sales metrics: Quantity, Discounts, Costs, and Freight.
- Filters data to align with the 2011-2013 analysis period.
- Standardizes column names for intuitive DAX measure creation.
*/
SELECT
    -- Keys
    ProductKey,
    OrderDateKey,
    CustomerKey,
    SalesTerritoryKey,

    -- Order Info
    SalesOrderNumber AS OrderNumber,
      
    -- Metrics
    OrderQuantity    AS Quantity,
    DiscountAmount   AS Discount,
    TotalProductCost AS TotalCost,
    SalesAmount      AS SalesAmount,
    Freight
      

FROM AdventureWorksDW2025.dbo.FactInternetSales

WHERE OrderDateKey > 20101231 and OrderDateKey < 20140101

ORDER BY OrderDateKey desc
