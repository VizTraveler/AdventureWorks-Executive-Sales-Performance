/*
PROJECT: AdventureWorks Global Sales Analysis
OBJECTIVE: Extraction and Transformation of Date Dimension
TABLE: DimDate
AUTHOR: VizTraveler
DESCRIPTION: 
- Filters data to include only years 2011 to 2013.
- Standardizes date formats and creates attributes for time-intelligence analysis.
- Creates 'MonthShort' and 'YearMonth' for enhanced visualization in Power BI.
*/
SELECT 
    -- Keys
    DateKey,

    -- Date
    FullDateAlternateKey as [Date],

    -- Day
    EnglishDayNameOfWeek as [WeekDay],
    WeekNumberOfYear as WeekNum,

    -- Month
    MonthNumberOfYear as MonthNum,
    EnglishMonthName as [Month],
    LEFT(EnglishMonthName, 3) as MonthShort,

    --Quarter & year
    CalendarQuarter as [Quarter],
    CalendarYear as [Year],
    FORMAT(FullDateAlternateKey,'yyyy-MM') as YearMonth

FROM AdventureWorksDW2025.dbo.DimDate

WHERE DateKey > 20101231 and DateKey < 20140101

ORDER BY DateKey Desc
