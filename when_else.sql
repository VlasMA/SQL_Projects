use sales_ord;

drop table if exists sales;

create table sales(
id int not null,
order_date date,
amount int
);

insert sales(id, order_date, amount)
values 
(1, '2021-01-01', 150),
(1, '2021-01-02', 250),
(1, '2021-01-03', 100),
(1, '2021-01-04', 150),
(1, '2021-01-05', 350);

select * from sales;

-- Разделите  значения поля “amount” на 3 сегмента: меньше 100(“Маленький заказ”), 100-300(“Средний заказ”) и больше 300 (“Большой заказ”)

select amount, case
when amount <= 100 then 'Маленький заказ'
when amount >= 100 and amount < 300  then 'средний заказ'
when amount >= 300 then 'Большой заказ'
else 'fall'
end as 'статус заказа'
from sales;


-- Создать таблицу “orders”, заполнить ее значениями. Отобразить “полный” статус заказа, используя оператор CASE

drop table if exists orders;

create table orders(
order_id int primary key auto_increment not null,
employeeid varchar(10),
amount decimal(5,2) not null,
order_status varchar(20)
);

select * from orders;

insert orders (employeeid, amount, order_status)
values
('e03', '15.00' , 'open'),
('e01', '25.50' , 'open'),
('e05', '100.70' , 'closed'),
('e02', '22.18' , 'open'),
('e04', '9.50' , 'cancelled'),
('e04', '99.99' , 'open');

 
select order_id, order_status,
case
when order_status = 'open' then 'Order is in open state'
when order_status = 'closed' then 'Order is closed'
when order_status = 'cancelled' then 'Order is cancelled'
end as 'order_summary'
from orders;
