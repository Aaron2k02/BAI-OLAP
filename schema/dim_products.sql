CREATE TABLE dim_products (
    Product_ID VARCHAR(20) PRIMARY KEY,
    Product_Name VARCHAR(100),
    Category_ID INTEGER,
    Brand_ID INTEGER,
    Price DECIMAL(10, 2),
    FOREIGN KEY (Category_ID) REFERENCES dim_product_categories(Category_ID),
    FOREIGN KEY (Brand_ID) REFERENCES dim_brands(Brand_ID)
);
