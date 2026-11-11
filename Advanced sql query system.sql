SQL> SELECT * FROM PRODUCT 
  2  WHERE PRICE > (SELECT AVG(PRICE) FROM PRODUCT);

PRODUCT_ID
----------
PRODUCT_NAME
--------------------------------------------------------------------------------
CATEGORY_ID      PRICE      STOCK
----------- ---------- ----------
DESCRIPTION
--------------------------------------------------------------------------------
         1
Laptop
          1      50000         10
Laptop for daily use


PRODUCT_ID
----------
PRODUCT_NAME
--------------------------------------------------------------------------------
CATEGORY_ID      PRICE      STOCK
----------- ---------- ----------
DESCRIPTION
--------------------------------------------------------------------------------
         2
Mobile
          2      20000         15
Smartphone


SQL> 
SQL> SELECT PRODUCT_ID, PRODUCT_NAME, PRICE 
  2  FROM PRODUCT 
  3  WHERE PRICE > (SELECT AVG(PRICE) FROM PRODUCT) 
  4  ORDER BY PRICE DESC;

PRODUCT_ID
----------
PRODUCT_NAME
--------------------------------------------------------------------------------
     PRICE
----------
         1
Laptop
     50000

         2
Mobile
     20000

PRODUCT_ID
----------
PRODUCT_NAME
--------------------------------------------------------------------------------
     PRICE
----------


SQL> 
SQL> SELECT C.CUSTOMER_ID, C.CUSTOMER_NAME, SUM(O.TOTAL_AMOUNT) AS TOTAL_PURCHASE 
  2  FROM CUSTOMER C 
  3  JOIN ORDERS O ON C.CUSTOMER_ID = O.CUSTOMER_ID 
  4  GROUP BY C.CUSTOMER_ID, C.CUSTOMER_NAME 
  5  HAVING SUM(O.TOTAL_AMOUNT) = (
  6      SELECT MAX(TOTAL_PURCHASE) 
  7      FROM (
  8          SELECT SUM(TOTAL_AMOUNT) AS TOTAL_PURCHASE 
  9          FROM ORDERS 
 10          GROUP BY CUSTOMER_ID
 11      ) AS max_table
 12  );
    ) AS max_table
      *
ERROR at line 11:
ORA-00907: missing right parenthesis


SQL> 
SQL> SELECT C.CUSTOMER_NAME, O.ORDER_ID, P.PRODUCT_NAME, O.QUANTITY, O.TOTAL_AMOUNT, O.ORDER_STATUS, PY.PAYMENT_METHOD, PY.PAYMENT_STATUS 
  2  FROM CUSTOMER C
  3  JOIN ORDERS O ON C.CUSTOMER_ID = O.CUSTOMER_ID
  4  JOIN PRODUCT P ON O.PRODUCT_ID = P.PRODUCT_ID
  5  JOIN PAYMENT PY ON O.ORDER_ID = PY.ORDER_ID
  6  ORDER BY O.ORDER_ID;

CUSTOMER_NAME
--------------------------------------------------------------------------------
  ORDER_ID
----------
PRODUCT_NAME
--------------------------------------------------------------------------------
  QUANTITY TOTAL_AMOUNT ORDER_STATUS         PAYMENT_METHOD
---------- ------------ -------------------- ------------------------------
PAYMENT_STATUS
--------------------
Rahul
      1001
Laptop

CUSTOMER_NAME
--------------------------------------------------------------------------------
  ORDER_ID
----------
PRODUCT_NAME
--------------------------------------------------------------------------------
  QUANTITY TOTAL_AMOUNT ORDER_STATUS         PAYMENT_METHOD
---------- ------------ -------------------- ------------------------------
PAYMENT_STATUS
--------------------
         1        50000 Delivered            UPI
Paid


CUSTOMER_NAME
--------------------------------------------------------------------------------
  ORDER_ID
----------
PRODUCT_NAME
--------------------------------------------------------------------------------
  QUANTITY TOTAL_AMOUNT ORDER_STATUS         PAYMENT_METHOD
---------- ------------ -------------------- ------------------------------
PAYMENT_STATUS
--------------------
Priya
      1002
Mobile

CUSTOMER_NAME
--------------------------------------------------------------------------------
  ORDER_ID
----------
PRODUCT_NAME
--------------------------------------------------------------------------------
  QUANTITY TOTAL_AMOUNT ORDER_STATUS         PAYMENT_METHOD
---------- ------------ -------------------- ------------------------------
PAYMENT_STATUS
--------------------
         1        20000 Shipped              Card
Paid


CUSTOMER_NAME
--------------------------------------------------------------------------------
  ORDER_ID
----------
PRODUCT_NAME
--------------------------------------------------------------------------------
  QUANTITY TOTAL_AMOUNT ORDER_STATUS         PAYMENT_METHOD
---------- ------------ -------------------- ------------------------------
PAYMENT_STATUS
--------------------
Arun
      1003
Headphones

CUSTOMER_NAME
--------------------------------------------------------------------------------
  ORDER_ID
----------
PRODUCT_NAME
--------------------------------------------------------------------------------
  QUANTITY TOTAL_AMOUNT ORDER_STATUS         PAYMENT_METHOD
---------- ------------ -------------------- ------------------------------
PAYMENT_STATUS
--------------------
         2         3000 Pending              Cash
Pending


CUSTOMER_NAME
--------------------------------------------------------------------------------
  ORDER_ID
----------
PRODUCT_NAME
--------------------------------------------------------------------------------
  QUANTITY TOTAL_AMOUNT ORDER_STATUS         PAYMENT_METHOD
---------- ------------ -------------------- ------------------------------
PAYMENT_STATUS
--------------------
Sneha
      1004
Keyboard

CUSTOMER_NAME
--------------------------------------------------------------------------------
  ORDER_ID
----------
PRODUCT_NAME
--------------------------------------------------------------------------------
  QUANTITY TOTAL_AMOUNT ORDER_STATUS         PAYMENT_METHOD
---------- ------------ -------------------- ------------------------------
PAYMENT_STATUS
--------------------
         1         1000 Delivered            UPI
Paid


SQL> 
SQL> SELECT C.CUSTOMER_ID, C.CUSTOMER_NAME, COUNT(O.ORDER_ID) AS TOTAL_ORDERS, SUM(O.TOTAL_AMOUNT) AS TOTAL_PURCHASE, AVG(O.TOTAL_AMOUNT) AS AVERAGE_PURCHASE 
  2  FROM CUSTOMER C 
  3  JOIN ORDERS O ON C.CUSTOMER_ID = O.CUSTOMER_ID 
  4  GROUP BY C.CUSTOMER_ID, C.CUSTOMER_NAME 
  5  ORDER BY TOTAL_PURCHASE DESC;

CUSTOMER_ID
-----------
CUSTOMER_NAME
--------------------------------------------------------------------------------
TOTAL_ORDERS TOTAL_PURCHASE AVERAGE_PURCHASE
------------ -------------- ----------------
        101
Rahul
           1          50000            50000

        102
Priya
           1          20000            20000

CUSTOMER_ID
-----------
CUSTOMER_NAME
--------------------------------------------------------------------------------
TOTAL_ORDERS TOTAL_PURCHASE AVERAGE_PURCHASE
------------ -------------- ----------------

        103
Arun
           1           3000             3000

        104
Sneha

CUSTOMER_ID
-----------
CUSTOMER_NAME
--------------------------------------------------------------------------------
TOTAL_ORDERS TOTAL_PURCHASE AVERAGE_PURCHASE
------------ -------------- ----------------
           1           1000             1000


SQL> 
SQL> SELECT ORDER_STATUS, COUNT(*) AS TOTAL_ORDERS, SUM(TOTAL_AMOUNT) AS TOTAL_AMOUNT 
  2  FROM ORDERS 
  3  GROUP BY ORDER_STATUS 
  4  ORDER BY TOTAL_AMOUNT DESC;

ORDER_STATUS         TOTAL_ORDERS TOTAL_AMOUNT
-------------------- ------------ ------------
Delivered                       2        51000
Shipped                         1        20000
Pending                         1         3000

SQL> 
SQL> SELECT PAYMENT_STATUS, COUNT(*) AS TOTAL_PAYMENTS, SUM(AMOUNT) AS TOTAL_AMOUNT 
  2  FROM PAYMENT 
  3  GROUP BY PAYMENT_STATUS 
  4  ORDER BY TOTAL_AMOUNT DESC;

PAYMENT_STATUS       TOTAL_PAYMENTS TOTAL_AMOUNT
-------------------- -------------- ------------
Paid                              3        71000
Pending                           1         3000

SQL>                                
