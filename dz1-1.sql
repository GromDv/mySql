DROP DATABASE IF EXISTS dz1_db;
CREATE DATABASE dz1_db;
USE dz1_db;

CREATE TABLE mobiles (
	id SERIAL,
    product_name VARCHAR(45) NOT NULL, 
    manufacturer VARCHAR(45), 
    product_count INT, 
    price INT
);

INSERT INTO mobiles (product_name, manufacturer, product_count, price)
VALUES 
('iPhone X','Apple',3,76000),
('iPhone 8','Apple',2,51000),
('Galaxy S9','Samsung',2,56000),
('Galaxy S8','Samsung',1,41000),
('P20 Pro','Huawei',5,36000);

SELECT product_name, manufacturer,price 
FROM mobiles
WHERE product_count > 2;

SELECT * 
FROM mobiles
WHERE manufacturer = 'Samsung';

SELECT * 
FROM mobiles
WHERE product_name LIKE '%Iphone%';

SELECT * 
FROM mobiles
WHERE product_name LIKE '%Samsung%' or manufacturer LIKE '%Samsung%';