
/* Задача 1
Создайте таблицу с мобильными телефонами, используя графический интерфейс. Заполните БД данными (поля и наполнение см. в презентации)
*/
USE dz1_schema;
-- создание таблицы
CREATE TABLE `mobiles` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `product_name` varchar(45) NOT NULL,
  `manufacturer` varchar(45) DEFAULT NULL,
  `product_count` int NOT NULL DEFAULT '0',
  `price` int DEFAULT '0',
  PRIMARY KEY (`id`)
);
-- наполнение нужными данными
INSERT INTO mobiles (product_name, manufacturer, product_count, price)
VALUES 
('iPhone X','Apple',3,76000),
('iPhone 8','Apple',2,51000),
('Galaxy S9','Samsung',2,56000),
('Galaxy S8','Samsung',1,41000),
('P20 Pro','Huawei',5,36000);


/* Задача 2
Выведите название, производителя и цену для товаров, количество которых превышает 2
*/
SELECT product_name, manufacturer,price 
FROM mobiles
WHERE product_count > 2;

/* Задача 3
Выведите весь ассортимент товаров марки “Samsung”
*/
SELECT * 
FROM mobiles
WHERE manufacturer = 'Samsung';

/* Задача 4
(по желанию) С помощью регулярных выражений найти:
*/
-- Товары, в которых есть упоминание "Iphone"
SELECT * 
FROM mobiles
WHERE product_name LIKE '%Iphone%';

-- Товары, в которых есть упоминание"Samsung"
SELECT * 
FROM mobiles
WHERE product_name LIKE '%Samsung%' or manufacturer LIKE '%Samsung%';

-- Товары, в которых есть ЦИФРЫ
SELECT * 
FROM mobiles
WHERE product_name REGEXP '^.*[0-9].*$';

-- Товары, в которых есть ЦИФРА "8" 
SELECT * 
FROM mobiles
WHERE product_name LIKE '%8%';
