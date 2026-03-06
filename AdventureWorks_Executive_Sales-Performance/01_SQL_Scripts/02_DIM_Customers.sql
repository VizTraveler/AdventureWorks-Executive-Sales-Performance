/*
PROJECT: AdventureWorks Global Sales Analysis
OBJECTIVE: Extraction and Transformation of Customer Dimension
TABLE: DimCustomer, DimGeography (Enriched)
AUTHOR: VizTraveler
DESCRIPTION: 
- Joins Customer and Geography tables to provide location context.
- Cleanses gender codes for better readability in reports.
- Concatenates FirstName and LastName into 'FullName'.
*/
SELECT 
    -- Keys
    c.CustomerKey,

    -- Customer Info
    c.FirstName+' '+c.LastName as FullName,
    CASE
        WHEN c.Gender = 'M' THEN 'Male'
        WHEN c.Gender = 'F' THEN 'Female'
        ELSE 'Unknown'
    END AS Gender,
    c.DateFirstPurchase,

    -- Location
    g.city                     AS CustomerCity,
    g.StateProvinceName        AS [State],
    g.EnglishCountryRegionName AS Country
    
FROM 
    AdventureWorksDW2025.dbo.DimCustomer       AS c
LEFT JOIN 
    AdventureWorksDW2025.dbo.DimGeography AS g 
    on g.GeographyKey = c.GeographyKey

ORDER BY
    c.CustomerKey ASC 
