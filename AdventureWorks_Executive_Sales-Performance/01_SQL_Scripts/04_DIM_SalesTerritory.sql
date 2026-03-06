/*
PROJECT: AdventureWorks Global Sales Analysis
OBJECTIVE: Extraction and Transformation of Sales Territory Dimension
TABLE: DimSalesTerritory
AUTHOR: VizTraveler
DESCRIPTION: 
- Extracts regional, country, and group levels for geographical analysis.
- Renames keys for consistency with the Fact table.
*/
SELECT
    -- Keys
    SalesTerritoryKey     AS TerritoryKey,

    -- Territory
    SalesTerritoryRegion  AS Region,
    SalesTerritoryCountry AS Country,
    SalesTerritoryGroup   AS [Group]

FROM AdventureWorksDW2025.dbo.DimSalesTerritory
