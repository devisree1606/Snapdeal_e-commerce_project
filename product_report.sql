CREATE TABLE Product (
    Product_ID NUMBER PRIMARY KEY,
    Product_Name VARCHAR2(100) NOT NULL,
    Category_ID NUMBER,
    Price NUMBER(10,2) NOT NULL,
    Stock NUMBER NOT NULL,
    Description VARCHAR2(200),
    FOREIGN KEY (Category_ID) REFERENCES Category(Category_ID)
);

INSERT INTO Product VALUES
(101, 'Gold Earrings', 1, 1500, 20, 'Elegant gold earrings');

INSERT INTO Product VALUES
(102, 'Silver Earrings', 1, 800, 30, 'Simple silver earrings');

INSERT INTO Product VALUES
(103, 'Pearl Necklace', 2, 2500, 15, 'Beautiful pearl necklace');

INSERT INTO Product VALUES
(104, 'Gold Ring', 3, 3500, 10, 'Classic gold ring');

INSERT INTO Product VALUES
(105, 'Diamond Ring', 3, 7500, 5, 'Diamond ring');

INSERT INTO Product VALUES
(106, 'Silver Bracelet', 4, 1200, 25, 'Stylish silver bracelet');

INSERT INTO Product VALUES
(107, 'Smart Watch', 5, 4500, 12, 'Modern smart watch');

INSERT INTO Product VALUES
(108, 'Hand Bag', 6, 1800, 20, 'Fashionable hand bag');

INSERT INTO Product VALUES
(109, 'Running Shoes', 7, 2200, 18, 'Comfortable running shoes');

INSERT INTO Product VALUES
(110, 'Cotton Shirt', 8, 900, 35, 'Comfortable cotton shirt');

INSERT INTO Product VALUES
(111, 'Lipstick', 9, 600, 40, 'Long lasting lipstick');

INSERT INTO Product VALUES
(112, 'Black Sunglasses', 10, 1100, 22, 'Stylish black sunglasses');

INSERT INTO Product VALUES
(113, 'Fashion Necklace', 2, 1600, 18, 'Trendy fashion necklace');

INSERT INTO Product VALUES
(114, 'Leather Bracelet', 4, 950, 28, 'Leather bracelet');

INSERT INTO Product VALUES
(115, 'Casual Shoes', 7, 1400, 25, 'Comfortable casual shoes');

COMMIT;

SELECT * FROM Product;

UPDATE Product
SET Price = 1700
WHERE Product_ID = 101;

UPDATE Product
SET Stock = 25
WHERE Product_ID = 108;

UPDATE Product
SET Product_Name = 'Premium Gold Ring',
    Price = 4000
WHERE Product_ID = 104;

COMMIT;

DELETE FROM Product
WHERE Product_ID = 115;

COMMIT;

SELECT
    c.Category_Name,
    p.Product_Name,
    p.Price,
    p.Stock
FROM Category c
JOIN Product p
ON c.Category_ID = p.Category_ID
ORDER BY c.Category_Name;

SELECT
    c.Category_Name,
    COUNT(p.Product_ID) AS Total_Products
FROM Category c
LEFT JOIN Product p
ON c.Category_ID = p.Category_ID
GROUP BY c.Category_Name
ORDER BY c.Category_Name;