use bd_4;

drop table if exists working;
 
create table working (
id int auto_increment primary key,
name varchar(50) not null,
surname varchar(10) not null,
speciality varchar (15) not null,
senjority int not null,
salary int not null,
age int not null);

insert into working (name, surname, speciality, senjority, salary, age)
values
('Вася', 'Васькин', 'Начальник', 40, 100000, 60),
('Петя', 'Петькин', 'Начальник', 8, 70000, 30),
('Катя', 'Каткина', 'Инжинер', 2, 70000, 25),
('Саша', 'Сашкин', 'Инжинер', 12, 50000, 35),
('Иван', 'Иванов', 'Рабочий', 40, 30000, 59),
('Петр', 'Петров', 'Рабочий', 20, 25000, 40),
('Сидор', 'Сидоров', 'Рабочий', 10, 20000, 35),
('Антон', 'Антонов', 'Рабочий', 8, 19000, 28),
('Юра', 'Юркин', 'Рабочий', 5, 15000, 25),
('Максим', 'Воронин', 'Рабочий', 2, 11000, 22),
('Юра', 'Галкин', 'Рабочий', 3, 12000, 24),
('Люся', 'Люськина', 'Уборщик', 10, 10000, 49);


select * from working;

-- Отсортировать поле “зарплата” (salary) в порядке убывания
select
*
from 
working
order by salary desc;

-- Отсортировать поле “зарплата” (salary) в порядке возрастания
select
*
from 
working
order by salary asc;

-- Вывести 5 максимальных зарплат (salary)
select
salary
from 
working
order by salary desc limit 5;

-- Подсчитать суммарную зарплату(salary) по каждой специальности (speciality)
select
speciality,
sum(salary)
from
working
group by speciality;

-- Кличество сотрудников по специальности “Рабочий” (speciality) в возрасте от 24 до 42 лет.
select
count(speciality) as 'рабочие в возрасте от 24 до 42 лет' 
from
working
where age >= 24 and age <=42
group by speciality
having
speciality = 'Рабочий'
;

-- Количество специальностей
select
count(distinct speciality)
from
working;

-- Специальности, у которых средний возраст сотрудника меньше 44 лет

select
speciality
from
	(select 
	speciality,
	avg(age)
	from
	working
	group by speciality
	having avg(age) < 44) p
    