CREATE TABLE Review (
    Review_ID   NUMBER PRIMARY KEY,
    Customer_ID NUMBER,
    Product_ID  NUMBER,
    Review_Text VARCHAR2(500),
    Review_Date DATE NOT NULL,
    FOREIGN KEY (Customer_ID) REFERENCES Customer(ID),
    FOREIGN KEY (Product_ID) REFERENCES Product(Product_ID)
);

CREATE TABLE Rating (
    Rating_ID   NUMBER PRIMARY KEY,
    Product_ID  NUMBER,
    Customer_ID NUMBER,
    Rating      NUMBER(1) CHECK (Rating BETWEEN 1 AND 5),
    Rating_Date DATE NOT NULL,
    FOREIGN KEY (Product_ID) REFERENCES Product(Product_ID),
    FOREIGN KEY (Customer_ID) REFERENCES Customer(ID)
);

INSERT INTO Review VALUES
(1, 1, 23, 'Excellent running shoes and very comfortable', DATE '2026-10-01');

INSERT INTO Review VALUES
(2, 2, 24, 'Good quality casual shoes and nice design', DATE '2026-10-02');

INSERT INTO Review VALUES
(3, 3, 25, 'Very durable and comfortable sports shoes', DATE '2026-10-03');

INSERT INTO Review VALUES
(4, 4, 26, 'Very useful book for self improvement', DATE '2026-10-04');

INSERT INTO Review VALUES
(5, 5, 27, 'Good book for learning Python programming', DATE '2026-10-05');

INSERT INTO Review VALUES
(6, 6, 28, 'Interesting book about personal finance', DATE '2026-10-06');

INSERT INTO Review VALUES
(7, 1, 29, 'Good face cream with moisturizing effect', DATE '2026-10-07');

INSERT INTO Review VALUES
(8, 2, 30, 'Nice lipstick with long lasting color', DATE '2026-10-08');

INSERT INTO Review VALUES
(9, 3, 31, 'Good body lotion and pleasant to use', DATE '2026-10-08');

INSERT INTO Review VALUES
(10, 4, 32, 'Good quality wheat flour', DATE '2026-10-08');

INSERT INTO Review VALUES
(11, 5, 33, 'Good quality salt at a reasonable price', DATE '2026-10-08');

INSERT INTO Review VALUES
(12, 6, 34, 'Tasty instant coffee and easy to prepare', DATE '2026-10-08');

INSERT INTO Review VALUES
(13, 1, 35, 'Very comfortable yoga mat', DATE '2026-10-08');

INSERT INTO Review VALUES
(14, 2, 36, 'Good cricket bat and lightweight', DATE '2026-10-08');

COMMIT;

INSERT INTO Rating VALUES
(1, 23, 1, 5, DATE '2026-10-01');

INSERT INTO Rating VALUES
(2, 24, 2, 4, DATE '2026-10-02');

INSERT INTO Rating VALUES
(3, 25, 3, 5, DATE '2026-10-03');

INSERT INTO Rating VALUES
(4, 26, 4, 5, DATE '2026-10-04');

INSERT INTO Rating VALUES
(5, 27, 5, 4, DATE '2026-10-05');

INSERT INTO Rating VALUES
(6, 28, 6, 3, DATE '2026-10-06');

INSERT INTO Rating VALUES
(7, 29, 1, 4, DATE '2026-10-07');

INSERT INTO Rating VALUES
(8, 30, 2, 5, DATE '2026-10-08');

INSERT INTO Rating VALUES
(9, 31, 3, 4, DATE '2026-10-08');

INSERT INTO Rating VALUES
(10, 32, 4, 3, DATE '2026-10-08');

INSERT INTO Rating VALUES
(11, 33, 5, 4, DATE '2026-10-08');

INSERT INTO Rating VALUES
(12, 34, 6, 5, DATE '2026-10-08');

INSERT INTO Rating VALUES
(13, 35, 1, 5, DATE '2026-10-08');

INSERT INTO Rating VALUES
(14, 36, 2, 4, DATE '2026-10-08');

COMMIT;

SELECT * FROM Review;

SELECT * FROM Rating;

SELECT P.Product_ID,
       P.Product_Name,
       C.ID AS Customer_ID,
       C.Name AS Customer_Name,
       R.Review_Text,
       R.Review_Date
FROM Product P, Customer C, Review R
WHERE P.Product_ID = R.Product_ID
AND C.ID = R.Customer_ID
ORDER BY P.Product_ID;

SELECT Product_ID,
       AVG(Rating) AS Average_Rating
FROM Rating
GROUP BY Product_ID
ORDER BY Product_ID;

SELECT Product_ID,
       AVG(Rating) AS Average_Rating
FROM Rating
GROUP BY Product_ID
HAVING AVG(Rating) >= 4
ORDER BY Average_Rating DESC;

SELECT COUNT(Rating) AS Total_Ratings,
       SUM(Rating) AS Total_Rating,
       AVG(Rating) AS Average_Rating,
       MAX(Rating) AS Highest_Rating,
       MIN(Rating) AS Lowest_Rating
FROM Rating;

