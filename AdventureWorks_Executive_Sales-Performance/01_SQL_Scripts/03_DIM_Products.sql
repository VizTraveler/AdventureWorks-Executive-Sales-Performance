/*
PROJECT: AdventureWorks Global Sales Analysis
OBJECTIVE: Extraction and Transformation of Product Dimension
TABLES: DimProduct, DimProductSubcategory, DimProductCategory
AUTHOR: VizTraveler
DESCRIPTION: 
- Joins the product table with its subcategory and category levels.
- Simplifies product names for end-user readability.
*/
SELECT
    -- Keys
    p.ProductKey,

    -- Product
    p.EnglishProductName             AS ProductName,
    ISNULL(ps.EnglishProductSubcategoryName, 'N/A') AS Subcategory,
    ISNULL(pc.EnglishProductCategoryName, 'N/A')    AS Category

 FROM 
    AdventureWorksDW2025.dbo.DimProduct AS p
 LEFT JOIN 
    AdventureWorksDW2025.dbo.DimProductSubcategory AS ps
    ON ps.ProductSubcategoryKey = p.ProductSubcategoryKey
 LEFT JOIN 
    AdventureWorksDW2025.dbo.DimProductCategory AS pc
    ON ps.ProductCategoryKey = pc.ProductCategoryKey

 ORDER BY 
    p.ProductKey ASC

