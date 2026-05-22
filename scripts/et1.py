import pandas as pd

df = pd.read_csv("data/Test-Set.csv")

print(df.head())

print(df.info())
print(df.isnull().sum())

df["Weight"] = df["Weight"].fillna(
    df["Weight"].mean()
)

df["OutletSize"] = df["OutletSize"].fillna(
    "Unknown"
)

df = df.drop_duplicates()

df = df.fillna(0)

df["OutletAge"] = 2025 - df["EstablishmentYear"]

df["VisibilityPercent"] = (
    df["ProductVisibility"] * 100
)

df["PremiumProduct"] = df["MRP"] > 200

df.to_csv("data/cleaned_sales.csv", index=False)

from sqlalchemy import create_engine

engine = create_engine(
    "postgresql://postgres:958849@localhost:5433/retail_db"
)

df.to_sql(
    "sales",
    engine,
    if_exists="replace",
    index=False
)

print("Data loaded successfully!")