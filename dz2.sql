USE dz2;
-- 1 Используя операторы языка SQL, создайте табличку “sales”. Заполните ее данными

CREATE TABLE `sales` (
  `id` int NOT NULL AUTO_INCREMENT,
  `order_date` date NOT NULL,
  `count_product` int NOT NULL,
  PRIMARY KEY (`id`));
  
INSERT INTO `dz2`.`sales` ( `order_date`, `count_product`) VALUES ( '2022-01-01', '156');
INSERT INTO `dz2`.`sales` ( `order_date`, `count_product`) VALUES ( '2022-01-02', '180');
INSERT INTO `dz2`.`sales` ( `order_date`, `count_product`) VALUES ( '2022-01-03', '21');
INSERT INTO `dz2`.`sales` ( `order_date`, `count_product`) VALUES ( '2022-01-04', '124');
INSERT INTO `dz2`.`sales` ( `order_date`, `count_product`) VALUES ( '2022-01-05', '341');

SELECT * FROM dz2.sales;
  
-- 2 Cгруппируйте значений количества в 3 сегмента — меньше 100, 100-300 и больше 300.

SELECT 
	id,
	order_date, 
	count_product,
CASE
WHEN count_product < 100 
	THEN 'Маленький заказ'
WHEN  count_product >= 100 AND count_product <= 300 
	THEN 'Средний заказ'
WHEN count_product > 300 
	THEN 'Большой заказ'
END AS order_type
FROM dz2.sales;

-- 3 Coздайте таблицу “orders”, заполните ее значениями. Покажите “полный” статус заказа, используя оператор CASE

CREATE TABLE `dz2`.`orders` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `employees_id` VARCHAR(45) NOT NULL,
  `amount` DECIMAL(20,2) NOT NULL,
  `orders_status` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`));

INSERT INTO `dz2`.`orders` (`employees_id`, `amount`, `orders_status`) VALUES ('e03', '15.00', 'OPEN');
INSERT INTO `dz2`.`orders` (`employees_id`, `amount`, `orders_status`) VALUES ('e01', '25.50', 'OPEN');
INSERT INTO `dz2`.`orders` (`employees_id`, `amount`, `orders_status`) VALUES ('e05', '100.70', 'CLOSED');
INSERT INTO `dz2`.`orders` (`employees_id`, `amount`, `orders_status`) VALUES ('e02', '22.18', 'OPEN');
INSERT INTO `dz2`.`orders` (`employees_id`, `amount`, `orders_status`) VALUES ('e04', '9.50', 'CANCELLED');
  
SELECT 
	id,
	employees_id, 
	amount,
	orders_status,
CASE
WHEN orders_status = 'OPEN'
	THEN 'Order is in open state'
WHEN  orders_status = 'CLOSED'
	THEN 'Order is closed'
WHEN orders_status = 'CANCELLED'
	THEN 'Order is cancelled'
END AS full_order_status
FROM dz2.orders;

