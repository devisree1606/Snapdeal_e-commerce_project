CREATE TABLE Customer (
    Customer_ID NUMBER PRIMARY KEY,
    Customer_Name VARCHAR2(100) NOT NULL,
    Email VARCHAR2(100) UNIQUE,
    Phone_Number VARCHAR2(15) UNIQUE,
    Address VARCHAR2(200) NOT NULL,
    Password VARCHAR2(50) NOT NULL
);

INSERT INTO Customer VALUES (101, 'Rahul', 'rahul@gmail.com', '9876543210', 'Chennai', 'Rahul@123');
INSERT INTO Customer VALUES (102, 'Priya', 'priya@gmail.com', '9876543211', 'Coimbatore', 'Priya@123');
INSERT INTO Customer VALUES (103, 'Arun', 'arun@gmail.com', '9876543212', 'Madurai', 'Arun@123');
INSERT INTO Customer VALUES (104, 'Sneha', 'sneha@gmail.com', '9876543213', 'Salem', 'Sneha@123');
INSERT INTO Customer VALUES (105, 'Vikram', 'vikram@gmail.com', '9876543214', 'Trichy', 'Vikram@123');
INSERT INTO Customer VALUES (106, 'Anjali', 'anjali@gmail.com', '9876543215', 'Erode', 'Anjali@123');
INSERT INTO Customer VALUES (107, 'Karthik', 'karthik@gmail.com', '9876543216', 'Tirunelveli', 'Karthik@123');
INSERT INTO Customer VALUES (108, 'Meena', 'meena@gmail.com', '9876543217', 'Vellore', 'Meena@123');
INSERT INTO Customer VALUES (109, 'Suresh', 'suresh@gmail.com', '9876543218', 'Thanjavur', 'Suresh@123');
INSERT INTO Customer VALUES (110, 'Divya', 'divya@gmail.com', '9876543219', 'Kanchipuram', 'Divya@123');
INSERT INTO Customer VALUES (111, 'Harini', 'harini@gmail.com', '9876543220', 'Namakkal', 'Harini@123');
INSERT INTO Customer VALUES (112, 'Monika', 'monika@gmail.com', '9876543221', 'Karur', 'Monika@123');
INSERT INTO Customer VALUES (113, 'Lucky', 'lucky@gmail.com', '9876543222', 'Dindigul', 'Lucky@123');
INSERT INTO Customer VALUES (114, 'Daniel', 'daniel@gmail.com', '9876543223', 'Cuddalore', 'Daniel@123');
INSERT INTO Customer VALUES (115, 'Srimathi', 'srimathi@gmail.com', '9876543224', 'Thoothukudi', 'Srimathi@123');

SELECT * FROM Customer;

UPDATE Customer
SET Address = 'Bangalore'
WHERE Customer_ID = 101;

UPDATE Customer
SET Phone_Number = '9876500000'
WHERE Customer_ID = 108;

UPDATE Customer
SET Customer_Name = 'Harini Devi',
    Email = 'harinidevi@gmail.com'
WHERE Customer_ID = 111;

SELECT * FROM Customer;

DELETE FROM Customer
WHERE Customer_ID = 113;

DELETE FROM Customer
WHERE Customer_ID = 114;

DELETE FROM Customer
WHERE Customer_ID = 115;

SELECT * FROM Customer;

COMMIT;