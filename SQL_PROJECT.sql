import mysql.connector
conn = mysql.connector.connect(
    host="localhost",
    database="Inventory_Management",
    user ="root",
    password="Chandi@123")
cor = conn.cursor() 

CREATE DATABASE Inventory_Management1;
CREATE TABLE manufacture1 (
    manufacture_id INT PRIMARY KEY,
    manufacturer_name VARCHAR(30),
    product_name VARCHAR(50),
    color VARCHAR(20),
    quantity INT,
    date_of_manufacture DATE,
    defective_item BOOLEAN
);

CREATE TABLE goods1 (
    goods_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    color VARCHAR(20),
    quantity INT,
    date_of_manufacture DATE
);

CREATE TABLE purchase1 (
    purchase_id INT PRIMARY KEY,
    store_name VARCHAR(50),
    product_name VARCHAR(50),
    color VARCHAR(20),
    quantity INT,
    purchase_amount FLOAT,
    purchase_date DATE
	);

CREATE TABLE sale1 (
    sale_id INT PRIMARY KEY,
    store_name VARCHAR(50),
    product_name VARCHAR(50),
    color VARCHAR(20),
    quantity INT,
    sale_amount FLOAT,
    sale_date DATE,
    profit_margin FLOAT
    );

INSERT INTO manufacture1 (manufacture_id,manufacturer_name, product_name, color, quantity, date_of_manufacture, defective_item)
VALUES (1,'HD Toys','Toy Car','Red',100,'2023-04-01',FALSE),
       (2,'Light Year Bros','Toy Car','Blue',50,'2023-04-01',FALSE),
       (3,'JDA','Wooden Chair','Brown',200,'2023-03-15',FALSE),
       (4,'SS Export','Wooden Table','Brown',50,'2023-04-15',FALSE),
       (5,'Disney','Toy Train','Green',75,'2023-04-01',TRUE),
       (6,'RR Textiles','Shirt','Blue',60,'2023-04-01',TRUE);
SELECT * FROM manufacture1;
INSERT INTO goods1 (goods_id, product_name, color, quantity, date_of_manufacture)
VALUES (1,'Toy Car','Red',50,'2023-04-01'),
       (2,'Toy Car','Blue',25,'2023-04-01'),
       (3,'Wooden Chair','Brown',100,'2023-03-15'),
       (4,'Wooden Table','Brown',25,'2023-04-15'),
       (5,'Toy Train','Green',50,'2023-04-01');
SELECT * FROM goods1;
INSERT INTO purchase1 (purchase_id, store_name, product_name, color, quantity, purchase_amount, purchase_date)
VALUES (1,'ORay','Toy Car','Red',10,25.00,'2023-04-05'),
	   (2,'MyKids','Toy Car','Red',20,40.00,'2023-04-07'),
       (3,'MyFurniture','Wooden Chair','Brown',50,50.00,'2023-03-20'),
       (4,'MyCare','Wooden Table','Brown',10,75.00,'2023-04-20'),
       (5,'OnlineMart','ToyCar','Blue',20,30.00,'2023-04-02'),
       (6,'ORay','Shirt','Blue',30,40.00,'2023-04-05');
SELECT * FROM purchase1;       
INSERT INTO sale1 (sale_id, store_name, product_name, color, quantity, sale_amount, sale_date, profit_margin)
VALUES (1,'ORay','Toy Car','Red',5,35.00,'2023-04-10',0.40),
(2,'MyKids','Toy Car','Red',10,40.00,'2023-04-07',0.50),
(3,'MyFurniture','Wooden Chair','Brown',20,75.00,'2023-04-10',0.60),
(4,'MyCare','Wooden Table','Brown',5,150.00,'2023-04-25',0.75),
(5,'OnlineMart','Toy Car','Blue',10,35.00,'2023-04-05',0.20);
SELECT * FROM sale1;
SELECT * FROM manufacture1 INNER JOIN purchase1 ON manufacture1.manufacture_id=purchase1.purchase_id;
DELETE FROM purchase1 WHERE store_name='ORay' AND product_name='Shirt';
UPDATE manufacture1 SET quantity=quantity-10 WHERE product_name='Toy Car' AND color='Red';
-- UPDATE goods1 SET price = 1 WHERE manufacture_id=1 AND store_name='MyKids' AND goods_id=1;
SELECT * FROM manufacture1 WHERE product_name='Wooden Chair' AND date_of_manufacture<'2023-05-01';
SELECT profit_margin FROM sale1 WHERE store_name='MyCare';
