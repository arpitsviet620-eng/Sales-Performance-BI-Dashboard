# Sales Performance & Business Intelligence Dashboard

## Objective

Analyze sales data to identify revenue trends, profitable products, customer performance, and regional performance.

## Tools

Python, Pandas, NumPy, SQL/MySQL, Power BI, Excel, Git/GitHub.

## Project Structure

- `sales_raw.csv` → Raw sales dataset
- `sales_cleaned.csv` → Cleaned and feature-engineered dataset
- `sales_analysis.xlsx` → Excel analysis workbook
- `sales_eda.py` → Python data cleaning and EDA script
- `sales_queries.sql` → SQL database setup and analysis queries
- `powerbi_dax.txt` → Power BI DAX measures
- `business_insights_report.md` → Business insights report
- `monthly_revenue.png` → Monthly revenue visualization
- `region_revenue.png` → Regional revenue visualization
- `Sales_Performance_BI_Dashboard.pbix` → Power BI dashboard

## Data Preparation

The raw sales dataset was cleaned using Python and Pandas.

Key steps:

- Removed duplicate Order_ID records
- Handled missing Region values
- Filled missing Discount values
- Converted Order_Date into date format
- Created Year, Month and Year_Month fields
- Calculated Profit Margin

## SQL Analysis

SQL was used for:

- KPI analysis
- Monthly revenue and profit trends
- Regional performance
- Category performance
- Top products by revenue
- Customer performance
- Year-wise revenue and profit analysis

## Power BI Dashboard

### KPI Cards

- Total Revenue
- Total Profit
- Profit Margin
- Total Orders
- Total Quantity
- Average Order Value

### Visualizations

- Monthly Revenue Trend
- Revenue by Region
- Top 10 Products by Revenue
- Customer Performance

### Interactive Filters

- Year
- Region

## Key Business Metrics

- Total Revenue: ₹3,226,273.47
- Total Cost: ₹2,430,194.47
- Total Profit: ₹796,079.00
- Profit Margin: 24.67%
- Total Orders: 5,000
- Total Quantity: 20,048
- Average Order Value: ₹645.25

## Regional Performance

The West region generated the highest revenue and profit among the analyzed regions.

- West Revenue: ₹835,386.74
- West Profit: ₹201,605.40
- West Orders: 1,230
- West Profit Margin: 24.13%

## Business Insights

The dashboard helps management:

- Monitor sales and profitability
- Compare regional performance
- Identify high-performing products
- Analyze customer revenue performance
- Monitor monthly revenue trends
- Support inventory and marketing decisions

## How to Run

### Python

```bash
pip install pandas numpy matplotlib openpyxl
