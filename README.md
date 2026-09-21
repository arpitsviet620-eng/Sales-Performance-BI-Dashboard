
# Sales Performance & Business Intelligence Dashboard

## Objective
Analyze sales data to identify revenue trends, profitable products, customer behavior, and regional performance.

## Tools
Python, Pandas, NumPy, SQL/MySQL, Power BI, Excel, Git/GitHub.

## Project structure
- sales_raw.csv -> intentionally dirty source data
- sales_cleaned.csv -> cleaned and feature-engineered dataset
- sales_analysis.xlsx -> Excel analysis workbook
- sales_eda.py -> Python EDA and cleaning script
- sales_queries.sql -> MySQL database and analysis queries
- powerbi_dax.txt -> Power BI Date table and KPI measures
- README.md -> complete project guide

## Step 1: Python setup
Create a virtual environment if desired, then install:
pip install pandas numpy matplotlib openpyxl

Run:
python sales_eda.py

## Step 2: SQL
1. Open MySQL Workbench.
2. Run sales_queries.sql.
3. Import sales_cleaned.csv into the `sales` table.
4. Run the analysis queries.

## Step 3: Power BI
1. Open Power BI Desktop.
2. Get Data -> Text/CSV -> sales_cleaned.csv.
3. Load the data.
4. Create DateTable using the DAX in powerbi_dax.txt.
5. Create a relationship DateTable[Date] -> Sales[Order_Date].
6. Add the KPI measures.
7. Build the dashboard described below.

## Dashboard pages

### Page 1 — Executive Overview
Cards:
- Total Revenue
- Total Profit
- Profit Margin
- Total Orders
- Total Quantity
- Average Order Value

Charts:
- Line chart: Revenue by Year Month
- Column chart: Revenue by Region
- Bar chart: Revenue by Category
- Top 10 Products by Revenue
- Slicers: Year, Region, Category

### Page 2 — Product & Regional Analysis
- Matrix: Region x Category with Revenue and Profit
- Bar chart: Top Products
- Bar chart: Bottom Products
- Column chart: Profit by Region
- Slicers: Date, Region, Category

### Page 3 — Trend Analysis
- Monthly Revenue
- Monthly Profit
- YoY Revenue %
- Revenue by Year
- Profit Margin trend

## Business insights to discuss
Use the dashboard to answer:
1. Which region generates the most revenue?
2. Which category is most profitable?
3. Which products are top sellers?
4. Which months have the highest revenue?
5. Which region has the highest profit margin?
6. How did revenue change year-over-year?
7. Where should management focus inventory and marketing?

Do not invent the answers in the report; read them from your actual dashboard output.

## Resume bullet
"Built an end-to-end Sales Performance & BI Dashboard using Python, Pandas, SQL, Excel and Power BI; cleaned sales data, calculated revenue/profit KPIs, analyzed regional and product performance, and developed interactive dashboards for business insights."
