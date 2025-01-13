CREATE TABLE dim_sellers (
    Seller_ID VARCHAR(20) PRIMARY KEY,
    Seller_Name VARCHAR(100),
    Location_ID INTEGER,
    Rating DECIMAL(3, 1),
    Total_Products INTEGER,
    FOREIGN KEY (Location_ID) REFERENCES dim_seller_locations(Location_ID)
);
