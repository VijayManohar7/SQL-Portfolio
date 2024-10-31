CREATE DATABASE Sales;
USE Sales;
CREATE TABLE Orders (
    Order_Id INT PRIMARY KEY,
    Customer_name VARCHAR(100) NOT NULL,
    Product_Category VARCHAR(50),
    Ordered_item VARCHAR(100),
    Contact_No VARCHAR(15) UNIQUE NOT NULL
);
ALTER TABLE Orders 
ADD order_quantity INT;
RENAME TABLE Orders TO sales_orders;
INSERT INTO sales_orders (Order_Id, Customer_name, Product_Category, Ordered_item, Contact_No, order_quantity) VALUES
(1, 'Alice', 'Electronics', 'Laptop', '1234567890', 1),
(2, 'Bob', 'Clothing', 'T-Shirt', '2345678901', 3),
(3, 'Charlie', 'Furniture', 'Chair', '3456789012', 4),
(4, 'David', 'Electronics', 'Headphones', '4567890123', 2),
(5, 'Eva', 'Books', 'Novel', '5678901234', 5),
(6, 'Frank', 'Groceries', 'Rice', '6789012345', 10),
(7, 'Grace', 'Clothing', 'Jacket', '7890123456', 1),
(8, 'Henry', 'Furniture', 'Table', '8901234567', 2),
(9, 'Ivy', 'Electronics', 'Camera', '9012345678', 3),
(10, 'Jack', 'Books', 'Magazine', '0123456789', 2);
SELECT Customer_name, Ordered_item FROM sales_orders;
UPDATE sales_orders 
SET Ordered_item = 'Tablet' 
WHERE Order_Id = 1;
DROP TABLE sales_orders;

