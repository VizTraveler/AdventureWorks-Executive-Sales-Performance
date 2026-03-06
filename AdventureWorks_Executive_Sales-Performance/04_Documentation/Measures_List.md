# DAX Measures List - AdventureWorks Project

This document provides a detailed breakdown of the DAX measures implemented in the data model to analyze sales performance, customer retention, and budget compliance.

---

### AOV (Average Order Value)
Calculates the average revenue generated per unique order.
```dax
AOV = 
DIVIDE(
    [Total Sales], 
    DISTINCTCOUNT(FACT_InternetSales[OrderNumber]), 
    0
)

```

### Average Freight

Calculates the average shipping cost per order.

```dax
Average Freight = 
VAR total_orders = DISTINCTCOUNT(FACT_InternetSales[OrderNumber])
RETURN
DIVIDE(SUM(FACT_InternetSales[Freight]), total_orders)

```

### Budget Amount

Total planned budget from the financial planning source.

```dax
Budget Amount = SUM(FACT_Budget[Budget])

```

### Count of Orders

Total count of unique orders processed.

```dax
Count of Orders = COUNTROWS(VALUES(FACT_InternetSales[OrderNumber]))

```

### Cumulative %

Calculates the cumulative sales percentage for Pareto analysis (ABC classification).

```dax
Cumulative % = 
VAR TotalSalesAllProducts = 
    CALCULATE([Total Sales], ALLSELECTED(DIM_Products[ProductName]))

VAR CurrentProductSales = [Total Sales]

VAR CumulativeSales = 
    SUMX(
        FILTER(
            ALLSELECTED(DIM_Products[ProductName]),
            [Total Sales] >= CurrentProductSales
        ),
        [Total Sales]
    )

RETURN
DIVIDE(CumulativeSales, TotalSalesAllProducts, 0)

```

### Customer Churn %

The percentage of customers who did not return compared to the previous period.

```dax
Customer Churn % = 1 - [Customer Retention %]

```

### Customer Growth % (YoY)

Year-over-year percentage growth of the customer base.

```dax
Customer Growth % (YoY) = 
DIVIDE(
    [Customers Count] - [Customers Count LY],
    [Customers Count LY]
)

```

### Customer Retention %

Percentage of last year's customers who made at least one purchase in the current period.

```dax
Customer Retention % = 
DIVIDE(
    [Customers Retained],
    [Customers Count LY]
)

```

### Customers Count

Total number of unique customers with recorded purchases.

```dax
Customers Count = DISTINCTCOUNT(FACT_InternetSales[CustomerKey])

```

### Customers Count LY

Unique customer count for the same period in the previous year.

```dax
Customers Count LY = 
CALCULATE(
    [Customers Count],
    SAMEPERIODLASTYEAR(DIM_Calendar[Date])
)

```

### Customers Retained

Number of customers who purchased in both the current period and the previous year.

```dax
Customers Retained = 
VAR CustomersCY = VALUES(Fact_InternetSales[CustomerKey])
VAR CustomersLY = 
    CALCULATETABLE(
        VALUES(Fact_InternetSales[CustomerKey]),
        SAMEPERIODLASTYEAR(DIM_Calendar[Date])
    )
RETURN
COUNTROWS(INTERSECT(CustomersCY, CustomersLY))

```

### New Customers

Calculates the difference between the total customer count and retained customers.

```dax
New Customers = [Customers Count] - [Customers Retained]

```

### Product Profitability %

The ratio of profit generated per product relative to its sales.

```dax
Product Profitability % = DIVIDE([Profit], [Total Sales])

```

### Profit

Total gross profit (Sales minus Cost).

```dax
Profit = [Total Sales] - [Total Cost]

```

### Profit Margin %

The percentage of profit relative to total sales revenue.

```dax
Profit Margin % = DIVIDE([Profit], [Total Sales])

```

### Sales LY

Total sales for the same period in the previous year.

```dax
Sales LY = 
CALCULATE(
    [Total Sales],
    SAMEPERIODLASTYEAR(DIM_Calendar[Date])
)

```

### Total Cost

Sum of the total product cost for all items sold.

```dax
Total Cost = SUM(FACT_InternetSales[TotalCost])

```

### Total Quantity Sold

Total number of units sold across all transactions.

```dax
Total Quantity Sold = SUM(FACT_InternetSales[Quantity])

```

### Total Sales

Total gross revenue from internet sales.

```dax
Total Sales = SUM(FACT_InternetSales[SalesAmount])

```

### UPT (Units Per Transaction)

The average number of items included in each order.

```dax
UPT = 
DIVIDE(
    SUM(FACT_InternetSales[Quantity]), 
    DISTINCTCOUNT(FACT_InternetSales[OrderNumber]), 
    0
)

```

### Variance vs Budget %

Percentage deviation of actual sales compared to the budget.

```dax
Variance vs Budget % = 
DIVIDE(
    [Total Sales] - [Budget Amount],
    [Budget Amount]
)

```

### YoY Growth %

Year-over-year sales growth percentage.

```dax
YoY Growth % = 
DIVIDE(
    [Total Sales] - [Sales LY],
    [Sales LY]
)

```