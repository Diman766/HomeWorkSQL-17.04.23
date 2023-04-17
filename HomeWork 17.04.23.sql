USE homework_2;
CREATE TABLE sales(
id SERIAL PRIMARY KEY,
order_date DATE NOT NULL,
count_product INT
);
INSERT INTO sales(order_date, count_product)
VALUES
(20220101, 156),(20220102, 180),(20220103, 21),(20220104, 124),(20220105, 341);

SELECT id,
	CASE 
		WHEN count_product<100 THEN 'Маленький заказ'
        WHEN 100<count_product AND count_product<300 THEN 'Средний'
        WHEN count_product>300 THEN 'Большой заказ'
        ELSE 'Неопределено'
	END AS 'Тип заказа'
FROM sales;

CREATE TABLE orders(
id SERIAL PRIMARY KEY,
employee_id VARCHAR(5) NOT NULL,
amount FLOAT NOT NULL,
order_status VARCHAR(10) not null
);
INSERT INTO orders(employee_id, amount, order_status)
VALUES
('e03', 15.00, 'OPEN'), ('e01', 25.50, 'OPEN'), ('e05', 100.70,'CLOSED'), ('e02', 22.18, 'OPEN'), ('e04', 9.50, 'CANCELLED');


SELECT id,employee_id, amount, order_status,
	CASE 
		WHEN order_status='OPEN' THEN 'Order is in open state'
		WHEN order_status='CLOSED' THEN 'Order is closed'
		WHEN order_status='CANCELLED' THEN 'Order is cancelled'
        ELSE 'Неопределено'
	END AS 'full_order_status'
FROM orders;