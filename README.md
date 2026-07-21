# Grid Sales Pricing Analysis

End-to-end pricing and gross margin analysis using **SQL Server** and **Power BI**.

## Project Overview

The business requested a review of order data from **2023 to 2025** after noticing a decline in gross margin. The goal was to identify products with weak profitability, especially products with a **gross margin below 30% in Q3 2025**, and provide pricing recommendations.

## Business Questions

- How did gross margin change year over year?
- Which products and categories generated the most revenue?
- Which regions performed best?
- Which products fell below the 30% gross margin target in Q3 2025?
- Which products should be repriced or considered for discontinuation?

## Tools Used

- SQL Server
- Power BI
- DAX
- PowerPoint

## SQL Workflow

- Combined `Orders_2023`, `Orders_2024`, and `Orders_2025` using `UNION ALL`.
- Joined the orders with the `Customers` and `Products` tables.
- Replaced missing revenue using `Price × Quantity`.
- Created a weekly date field for trend analysis.
- Prepared the final dataset for Power BI.

## Dashboard Highlights

- Revenue, profit, margin, customers, and quantity KPIs
- Year and quarter filters
- Weekly performance by region
- Product and category analysis
- Year-over-year gross margin comparison
- Q3 2025 low-margin product review

## Key Recommendations

- Review products with gross margin below 30% in Q3 2025.
- Apply pricing adjustments to products with strong demand but weak margins.
- Review cost structure and COGS for products with declining profitability.
- Consider discontinuation only for products with both low margin and weak sales performance.

## Repository Files

- `grid_sales_analysis.sql` — SQL query used to prepare the analysis dataset.
- `The_Daily_Grind_Pricing_Analysis_Report.pptx` — PowerPoint report with the business request, dashboard summary, findings, and recommendations.

## Author

**Hassan**  
GitHub: [7aone00](https://github.com/7aone00)
