# Retail ETL Project

This repository contains a small retail ETL workflow built with Python and SQL.

## Project structure

- `data/`
  - `Test-Set.csv` - raw sales data input used by the ETL process.
  - `cleaned_sales.csv` - output dataset produced after cleaning and feature engineering.
- `scripts/`
  - `et1.py` - main ETL script. It reads the raw CSV, performs data cleaning and transformation, writes the cleaned data to `data/cleaned_sales.csv`, and loads the result into a PostgreSQL database.
- `SQL/`
  - `queries.sql` - example SQL queries that can be used to analyze the loaded `sales` table.

## ETL process in `scripts/et1.py`

The script does the following:

1. Reads `data/Test-Set.csv` into a pandas DataFrame.
2. Prints dataset preview and info.
3. Fills missing `Weight` values with the column mean.
4. Replaces missing `OutletSize` values with `Unknown`.
5. Removes duplicate rows.
6. Fills any remaining missing values with `0`.
7. Creates a new `OutletAge` column based on `EstablishmentYear`.
8. Creates a new `VisibilityPercent` column from `ProductVisibility`.
9. Creates a boolean `PremiumProduct` column for items with `MRP > 200`.
10. Writes the cleaned dataset to `data/cleaned_sales.csv`.
11. Loads the cleaned data into a PostgreSQL database table named `sales`.

## Database connection

The script currently connects to PostgreSQL using the URI:

```
postgresql://postgres:909651@localhost:5433/retail_db
```

Update this URI in `scripts/et1.py` if your database host, port, user, password, or database name differ.

## Running the ETL script

1. Install dependencies:

```bash
pip install pandas sqlalchemy psycopg2-binary
```

2. Run the script:

```bash
python scripts/et1.py
```

## SQL queries

The `SQL/queries.sql` file includes example analytics queries for the `sales` table, such as average price, product type counts, premium products, and outlet age statistics.

## Notes

- Ensure PostgreSQL is running and accessible before executing the ETL script.
- The script will replace the `sales` table if it already exists.
