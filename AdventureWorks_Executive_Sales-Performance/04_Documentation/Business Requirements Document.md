# BUSINESS REQUIREMENTS DOCUMENT (BRD)

> **Project:** Global Sales Intelligence Initiative  
> **Version:** 1.0  
> **Status:** Approved  
> **Stakeholders:** C-Suite, Regional Managers, Logistics Department

---

## 1. EXECUTIVE SUMMARY

As AdventureWorks expands its global footprint, the executive leadership team requires a more granular  
 and proactive approach to monitoring our commercial health. The objective is to transition from static  
 reporting to a **dynamic analytical ecosystem** that allows for real-time decision-making.

## 2. BUSINESS OBJECTIVES

| Objective | Description |
| --- | --- |
| **Financial Oversight** | Monitor Sales vs. Budget and YoY growth across all territories. |
| **Customer Retention** | Identify churn patterns and distinguish between new and returning customers. |
| **Product Optimization** | Analyze profitability per SKU and Category using Pareto principles. |
| **Logistics Efficiency** | Evaluate the impact of freight costs on net profitability. |

## 3. SCOPE OF WORK

* **Data Source:** SQL Server (AdventureWorksDW).
* **Transformation:** ETL process via SQL and Power Query (DIM/FACT modeling).
* **Deliverables:** 3 Interactive Dashboards (Executive, Regional/Customer, Product).

## 4. FUNCTIONAL REQUIREMENTS

The solution must provide:

1. **Time Intelligence:** Filtering by Year and Month across all visuals.
2. **Comparative Analysis:** Performance against Last Year (LY) and Budget.
3. **Customer Metrics:** Tracking of Churn Rate %, Retention %, and Average Order Value (AOV).
4. **Geographic Insights:** Global map with profitability and logistic cost analysis.

## 5. TECHNICAL CONSTRAINTS

* **Architecture:** Star Schema (1 Fact Table, Multiple Dimensions).
* **Key Measures:** DAX implementation for complex KPIs (YoY %, Profit Margin %).
* **Visual Standards:** High-contrast conditional formatting for variance alerts.