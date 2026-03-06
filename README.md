# AdventureWorks Sales & Budget Analysis

## Project Overview
This project provides a comprehensive data analysis solution for a retail scenario using the **AdventureWorks** dataset. It integrates data from a SQL Server database and external CSV budget files to create a robust Star Schema model in Power BI.

The goal is to track sales performance, evaluate customer retention, and analyze variances against financial budgets.



## Tech Stack
* **SQL Server:** Data extraction, cleaning, and transformation.
* **Power BI / Power Query:** Data modeling, DAX measure development, and visualization.
* **Excel/CSV:** Budget planning data source.

## Repository Structure
* **`01_SQL_Scripts/`**: Cleaned T-SQL views and scripts used for ETL.
* **`02_Data_Sources/`**: Raw CSV files used for the Budget and processed data.
* **`03_PowerBI_Model/`**: 
    * The `.pbix` file containing the data model and reports.
    * `Data_Model_Schema.png`: containing the star schema and columns.
* **`04_Documentation/`**:
    * `Measures_List.md`: Detailed DAX formulas and business logic.
    * `Business Requirements Document.md`: Detailed DAX formulas and business logic.

## Data Process
### 1. Extraction & Transformation (SQL)
To ensure performance and data quality, I developed SQL scripts to:
* Filter out unnecessary columns and historical data older than 3 years.
* Join product, subcategory, and category tables into a single dimension.
* Format customer names and geographical data for better reporting.

### 2. Modeling (Power BI)
A **Star Schema** was implemented to optimize report performance. 
* **Fact Tables:** `FACT_InternetSales`, `FACT_Budget`.
* **Dimension Tables:** `DIM_Product`, `DIM_Customer`, `DIM_Calendar`, `DIM_SalesTerritory`.



### 3. Business Logic (DAX)
Advanced DAX was used to create high-value metrics, including:
* **Year-over-Year (YoY) Growth** for sales and customer base.
* **Customer Retention & Churn** analysis using set theory (`INTERSECT`).
* **Pareto Analysis** (Cumulative Sales %) for product classification.
* **Budget Variance** to track KPIs against company targets.

## Key Business Insights

The project reveals a transformative shift in the business model during the final year. Below are the strategic highlights:

* **Explosive Growth Engine:** Year 3 achieved a **179.9% YoY Sales Growth**, driven by a massive **435.5% increase in New Customers**.
* **High Loyalty Retention:** Despite the rapid scale-up, the company maintained a **91.2% Customer Retention Rate**, proving that acquisition did not compromise service quality.
* **Geographic Expansion:** Growth was not localized; while Australia remains the volume leader, regions like **Southwest US saw a 314% surge**, diversifying the global risk.
* **Pareto Efficiency:** The product mix evolved from a fragmented Year 2 to a consolidated Year 3, where 6 key products now drive the majority of the new revenue stream.

**[Read the Full Executive Insights Report here](./04_Documentation/Executive_Insights.md)** for a deep dive into the correlation between customer acquisition and regional profitability.

## How to Use
1.  Run the scripts in the `01_SQL_Scripts/` folder on your SQL environment.
2.  Open the `.pbix` file in the `03_PowerBI_Model/` folder.
3.  Update the data source paths in Power Query if necessary.

---
**Author:** VizTraveler
**Role:** Data Analyst
---
