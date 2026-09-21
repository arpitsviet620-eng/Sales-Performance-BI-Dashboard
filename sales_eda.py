
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt

RAW_FILE = "sales_raw.csv"
CLEAN_FILE = "sales_cleaned.csv"

raw = pd.read_csv(RAW_FILE)
print("Raw shape:", raw.shape)
print("\nMissing values:\n", raw.isna().sum())
print("\nDuplicate Order IDs:", raw["Order_ID"].duplicated().sum())

# Cleaning
df = raw.drop_duplicates(subset=["Order_ID"]).copy()
df["Order_Date"] = pd.to_datetime(df["Order_Date"])
df["Region"] = df["Region"].fillna(df["Region"].mode()[0])
df["Discount"] = df["Discount"].fillna(0)

# Feature engineering
df["Profit_Margin"] = np.where(df["Revenue"] != 0, df["Profit"] / df["Revenue"], 0)
df["Year"] = df["Order_Date"].dt.year
df["Month"] = df["Order_Date"].dt.month
df["Month_Name"] = df["Order_Date"].dt.strftime("%b")
df["Year_Month"] = df["Order_Date"].dt.to_period("M").astype(str)

df.to_csv(CLEAN_FILE, index=False)

print("\nClean shape:", df.shape)
print("\nKPI SUMMARY")
print("Revenue:", round(df["Revenue"].sum(), 2))
print("Cost:", round(df["Cost"].sum(), 2))
print("Profit:", round(df["Profit"].sum(), 2))
print("Profit Margin:", round(df["Profit"].sum()/df["Revenue"].sum()*100, 2), "%")
print("Orders:", df["Order_ID"].nunique())
print("Quantity:", df["Quantity"].sum())

print("\nTOP PRODUCTS")
print(df.groupby("Product")["Revenue"].sum().sort_values(ascending=False).head(10))

print("\nREGION PERFORMANCE")
print(df.groupby("Region").agg(
    Revenue=("Revenue","sum"),
    Profit=("Profit","sum"),
    Orders=("Order_ID","nunique")
).sort_values("Revenue", ascending=False))

# Monthly trend
monthly = df.groupby("Year_Month", as_index=False).agg(
    Revenue=("Revenue","sum"),
    Profit=("Profit","sum")
)
plt.figure(figsize=(12,5))
plt.plot(monthly["Year_Month"], monthly["Revenue"], marker="o")
plt.title("Monthly Revenue Trend")
plt.xlabel("Month")
plt.ylabel("Revenue")
plt.xticks(rotation=60)
plt.tight_layout()
plt.savefig("monthly_revenue.png", dpi=150)
plt.close()

# Region revenue
region = df.groupby("Region", as_index=False)["Revenue"].sum().sort_values("Revenue", ascending=False)
plt.figure(figsize=(8,5))
plt.bar(region["Region"], region["Revenue"])
plt.title("Revenue by Region")
plt.xlabel("Region")
plt.ylabel("Revenue")
plt.tight_layout()
plt.savefig("region_revenue.png", dpi=150)
plt.close()

print("\nEDA completed successfully.")
