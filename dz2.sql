DROP DATABASE IF EXISTS dz2_db;
CREATE  DATABASE dz2_db;
USE dz2_db;

# 1.Используя операторы языка SQL, создайте табличку “sales”. Заполните ее данными.
DROP TABLE IF EXISTS sales;
CREATE TABLE sales (
	id SERIAL PRIMARY KEY,
	order_date DATE,
	count_product INT
);
INSERT INTO sales (order_date,count_product)
VALUES
('2022-01-01',156),
('2022-01-02',180),
('2022-01-03',21),
('2022-01-04',124),
('2022-01-05',341);

# Для данных таблицы “sales” укажите тип заказа в зависимости от 
# кол-ва : меньше 100 - Маленький заказ; от 100 до 300 - Средний заказ; 
# больше 300 - Большой заказ.
SELECT 	id AS 'id заказа',
		CASE 
			WHEN count_product < 100 THEN 'Маленький заказ'
			WHEN count_product < 300 AND count_product >= 100 THEN 'Средний заказ'
			WHEN count_product >= 300 THEN 'Большой заказ'
		END AS 'Тип заказа'
FROM sales;

# Создайте таблицу “orders”, заполните ее значениями. 
DROP TABLE IF EXISTS orders;
CREATE TABLE orders (
	id SERIAL PRIMARY KEY,
	employee_id VARCHAR(10),
	amount DECIMAL(7,2),
	order_status VARCHAR(20)
);
INSERT INTO orders (employee_id,amount,order_status)
VALUES
('e03',15.00,'OPEN'),
('e01',25.5,'OPEN'),
('e05',100.7,'CLOSED'),
('e02',22.18,'OPEN'),
('e04',9.5,'CANCELLED');

# Выберите все заказы. В зависимости от поля order_status
# выведите столбец full_order_status: 
# OPEN – «Order is in open state» ; CLOSED - «Order is closed»; 
# CANCELLED - «Order is cancelled»
SELECT 	id, 
		employee_id, 
		FORMAT(amount,2) AS 'amount', 
		order_status,
		IF (order_status = 'OPEN', '«Order is in open state»',
			IF (order_status = 'CLOSED', '«Order is closed»',
				IF (order_status = 'CANCELLED', '«Order is cancelled»', 'n/a')
			)
		) AS 'full_order_status'
FROM orders;
