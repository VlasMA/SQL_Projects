use bd_2;

# создание табл мобильных телефонов

create table moobile_phone(
id int,
ProductName varchar (50),
Manufacturer varchar(50),
ProductCount int,
Price int
);

select
*
from
moobile_phone;


# Заполнение табл

insert into moobile_phone values
(1, 'IPhone X' , 'Apple', 3, 76000),
(2, 'IPhone 8' , 'Apple', 2, 51000),
(3, 'Galaxy S9' , 'Samsung', 2, 56000),
(4, 'Galaxy S8' , 'Samsung', 1, 41000),
(5, 'P20 Pro' , 'Huawey', 5, 36000);


# Вывести название, производителя, цену для товаров кол-во которых превышвет 2

select
	 ProductName,
	 Manufacturer,
	 Price
 from moobile_phone
 where ProductCount > 2;
 
# Вывести товары Samsung

select
*
from moobile_phone	
where Manufacturer like 'Sam%';

# Вывести инфо о телефонах где суммарный чек больше 100 000 и меньше 145 000

select
*
from moobile_phone
where (ProductCount * Price ) > '100000' and (ProductCount * Price ) < '145000';


--  С помощью регулярных выражений найти (можно использовать операторы “LIKE”, “RLIKE” для 4.3 ):
-- 	Товары, в которых есть упоминание "Iphone"   "Galaxy"
-- 	Товары, в которых есть ЦИФРЫ
-- 	Товары, в которых есть ЦИФРА "8"

select
*
from moobile_phone
where ProductName like 'IPh%';

select
*
from moobile_phone
where ProductName like '%Gal%';

select
*
from moobile_phone
where ProductName like '%8%';