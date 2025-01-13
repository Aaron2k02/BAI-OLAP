CREATE TABLE dim_customers (
    Customer_ID VARCHAR(20) PRIMARY KEY,
    Customer_Name VARCHAR(100),
    Email VARCHAR(100),
    Phone_Number VARCHAR(15),
    Demographics_ID INTEGER,
    Geography_ID INTEGER,
    FOREIGN KEY (Demographics_ID) REFERENCES dim_demographics(Demographics_ID),
    FOREIGN KEY (Geography_ID) REFERENCES dim_geography(Geography_ID)
);
