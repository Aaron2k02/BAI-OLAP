CREATE TABLE sales_fact (
    Order_ID VARCHAR(20) PRIMARY KEY,
    Customer_ID VARCHAR(20),
    Product_ID VARCHAR(20),
    Seller_ID VARCHAR(20),
    Quantity INTEGER,
    Order_Date DATE,
    Shipping_Cost DECIMAL(10, 2),
    Discount_Amount DECIMAL(10, 2),
    Payment_Method_ID INTEGER,
    Total_Amount DECIMAL(10, 2),
    Delivery_Status_ID INTEGER,
    Review_Rating INTEGER,
    FOREIGN KEY (Customer_ID) REFERENCES dim_customers(Customer_ID),
    FOREIGN KEY (Product_ID) REFERENCES dim_products(Product_ID),
    FOREIGN KEY (Payment_Method_ID) REFERENCES dim_payment_methods(Payment_Method_ID),
    FOREIGN KEY (Delivery_Status_ID) REFERENCES dim_delivery_status(Delivery_Status_ID)
);