Here's the revised version of your README with improved readability and structure:

---

# Sales Data Warehouse Project

---

## Introduction

This project involves designing a **Sales Data Warehouse** to enable efficient analysis of sales transactions across multiple dimensions. The goal is to support businesses in tracking sales performance and deriving actionable insights into:
- Customer demographics  
- Product categories  
- Seller ratings  
- Payment preferences  
- Delivery statuses  

---

## Project Objectives

1. **Enhanced Data Analysis**: Efficiently track key sales metrics.  
2. **Improved Decision-Making**: Derive insights into customer preferences, payment trends, and delivery performance.  
3. **Faster Reporting**: Streamline business reporting with optimized data retrieval.  

---

## Data Warehouse Design

### 1. Conceptual OLAP Cube Design
- Sales as the central entity.  
- Dimension tables include Customers, Products, Sellers, Payment Methods, and Delivery Status.  
- Represents the flow from order placement to delivery completion.  

![Conceptual OLAP Cube](https://github.com/user-attachments/assets/336b0bce-a2fd-41b8-8f85-91b2413c1677)

### 2. Snowflake Schema Design
- Multiple dimension tables connected to the central sales fact table.  

![Snowflake Schema](https://github.com/user-attachments/assets/9152238d-77cc-48dc-bd0d-f17165beb872)

### 3. Dimension and Fact Tables
- **Examples of dimension tables**:  
  - `dim_customers`  
  - `dim_products`  
  - `dim_sellers`  
  - `dim_payment_methods`  
  - `dim_geography`  

- **Fact table**:  
  - `sales_fact` contains key metrics such as total sales, transaction count, and revenue breakdown.  

---

## Implementation

### 1. Data Warehouse Setup in DuckDB
- **Schema Creation**: SQL scripts define the structure of tables in a logical order.  
- **Populating Data**: CSV data is imported into DuckDB tables for analysis.  

**Code Snippets**:  

- Schema creation:
  ```python
  schema_files_order = [
      "dim_seller_locations.sql", 
      "dim_product_categories.sql", 
      "dim_payment_methods.sql", 
      "dim_geography.sql", 
      "dim_demographics.sql", 
      "dim_delivery_status.sql", 
      "dim_brands.sql", 
      "dim_customers.sql", 
      "dim_products.sql", 
      "dim_sellers.sql", 
      "sales_fact.sql"
  ]

  schema_directory = "./schema/"

  for sql_file_name in schema_files_order:
      sql_file_path = schema_directory + sql_file_name
      with open(sql_file_path, 'r') as file:
          sql_query = file.read()
      conn.execute(sql_query)
  ```  

- Populating data:
  ```python
  csv_directory = "./olap-table/"

  csv_files = [
      ("seller_locations.csv", "dim_seller_locations"),
      ("product_categories.csv", "dim_product_categories"),
      ("payment_methods.csv", "dim_payment_methods"),
      ("geography.csv", "dim_geography"),
      ("demographics.csv", "dim_demographics"),
      ("delivery_status.csv", "dim_delivery_status"),
      ("brands.csv", "dim_brands"),
      ("customers.csv", "dim_customers"),
      ("products.csv", "dim_products"),
      ("sellers.csv", "dim_sellers"),
      ("sales_fact.csv", "sales_fact"),
  ]

  for csv_file, table_name in csv_files:
      csv_path = csv_directory + csv_file
      conn.execute(f"COPY {table_name} FROM '{csv_path}' (DELIMITER ',', HEADER TRUE);")
  ```

---

## OLAP Cube Use Cases

### 1. Sales by Category and Geography
- **Objective**: Analyze sales performance across product categories and geographical regions.  
- **Operations**: Use **ROLLUP** for hierarchical aggregation by product category, country, and state.  
- **Metrics**:  
  - Total Sales  
  - Transaction Count  

![Sales by Category and Geography](https://github.com/user-attachments/assets/bb4fb211-86dd-4fd9-97f7-8dffe5606b84)

#### Insights:
- Balanced sales across categories suggest diversified product offerings.  
- Higher sales in certain regions (e.g., India) indicate strong market presence.  

**Recommendations**:  
- Launch category-specific marketing campaigns.  
- Adapt strategies from high-performing regions to underperforming ones.  

---

### 2. Sales by Product and Customer Demographics
- **Objective**: Understand sales performance by age group and gender.  
- **Operations**: Use **Drill-down** for granular insights into customer segments.  
- **Metrics**:  
  - Total Sales  
  - Average Order Value (AOV)  
  - Purchase Frequency  

![Sales by Product and Customer Demographics](https://github.com/user-attachments/assets/130ad4fa-f6be-4a80-ada1-ad1e4864fbc3)

#### Insights:
- Gender-based preferences for specific products.  
- Popularity of products among certain age groups (e.g., 26-35 years old).  

**Recommendations**:  
- Develop targeted marketing campaigns for different demographics.  

---

### 3. Sales by Time
- **Objective**: Analyze trends by year and month for seasonal insights.  
- **Operations**: Use **CUBE** for hierarchical aggregation across time dimensions.  
- **Metrics**:  
  - Total Sales  
  - Transaction Count  

![Sales by Time](https://github.com/user-attachments/assets/0b4d1d0c-336a-4135-98c4-f056a9ce1a37)

#### Insights:
- Seasonal spikes in sales during specific months.  

**Recommendations**:  
- Focus marketing campaigns on high-demand periods.  

---

## Key Features

1. **OLAP Operations**:  
   - **Roll-up**: Aggregate data at multiple levels.  
   - **Drill-down**: Retrieve detailed insights.  
   - **Pivot**: Reorient dimensions for comparison.  
   - **Slice-and-Dice**: Extract subsets for analysis.  

2. **Data Visualization**:  
   - Bar charts, cluster graphs, and line trends for actionable insights.  

3. **Strategic Recommendations**:  
   - Data-driven strategies to boost sales and enhance customer engagement.  

---

## Conclusion

The **Sales Data Warehouse** demonstrates how well-structured data and OLAP operations can support businesses in decision-making, reporting, and optimizing sales performance. It offers actionable insights into customer behavior, product performance, and seasonal trends.

---

## How to Use

1. Clone this repository.  
2. Install DuckDB and import the provided SQL scripts.  
3. Populate the schema using the sample data (CSV files included).  
4. Run the provided SQL queries to generate OLAP cubes and insights.  

Refer to the repository's documentation for detailed guidance.

--- 
