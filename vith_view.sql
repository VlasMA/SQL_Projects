-- Задание:
--1. Добавить в таблицу логов по одной записи на каждую категорию фильмов
--	в качестве даты создани указать last_update из таблицы category
--	в качестве(message) сообщения взять название категории.
--2. В табл логов для всех категорий, которые начинаются с буквы "S" установить в качетсве даты создания запись лога - текущюю датую.
--(те берем логи, смотрим какие логи относятся к категориям , присоединяем табл категории, оставляем категории на S, и для них меняем дату записи лога с пом фун NOW)
--3. Использую конструкцию with напишите запрос, который вернет максимальное количество сдач в аренду одного фильма
--4. Создайте представление, которое будет возвращать спсиок всех актеров и по каждому актеру будет 2 поля:
--	а) actor_id -сдентификатор актера
--	б) actor_name Имя и Фамилия актера через пробел




-- 1.
drop table if exists logs;
create table logs(
	created_at date not null
	,message varchar(1000) null
);

select * from logs;
-------------------
-- 1.
insert into logs(                  --добавление записи в табл
	created_at 
	,message
)
select 
	c.last_update as created_at 
	,c.name  as messege
	
from 
category c ;


-- 2.

select * from logs;


update logs    -- изменение талицы логов
set created_at  = current_date
where message like 'S%'


--3.  Использую конструкцию with выполню запрос, который вернет максимальное количество сдач в аренду одного фильма
-- Максимальная сумма, вырученная за один фильм
-----------------------

with film_title_and_counter as (
	select
		f.title as film
		, count(*) as film_cnt
	from film f 
		join inventory i 
			on f.film_id = i.film_id 
		join rental r 
			on r.inventory_id = i.inventory_id 
	group by film
)
select 
	max(film_cnt) 
from film_title_and_counter
--------------------------------------------------------------------------------

 --4. Создаю представление, которое будет возвращать спсиок всех актеров и по каждому актеру будет 2 поля:
--	а) actor_id -сдентификатор актера
--	б) actor_name Имя и Фамилия актера через пробел

select 
actor_id 
,concat(first_name, ' ' ,last_name) as FIO
from actor a 

------
drop view film_actor_id 
------

create view film_actor_id as (                -- 'это основная часть это отображение
	select 
actor_id 
,concat(first_name, ' ' ,last_name) as FIO
from actor a 
);
-- это мы создали отображение (выше)
-- теперь мы можем его использовать в любых запросах. Можем сдлать из него селект

select fio from film_actor_id ;
