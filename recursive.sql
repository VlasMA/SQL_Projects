-- рекурсия
-- Задание
-- 1 . Посчитать для менеджера 2 сколько всего у него подчиненных
-- 2. Посчитать для сотрудника 19 сколько всего начальников над ним
-- 3. С помощью рекрсивного вывести менеджера 1 и его подсчиненных со 2го и 3го уровней иерархии
-- (подчиненные 4го уровня иерархии не должны попасть в результат)   (нужно добавить условие where)



--1.
WITH RECURSIVE subordinates AS (
	SELECT 
		employee_id, manager_id, full_name
	FROM 
		employees
	WHERE manager_id = 2	--здесь указываем, подчиненных какого именно менеджера считаем
	
union

	SELECT 
		e.employee_id, e.manager_id, e.full_name
	FROM 
		employees e
	JOIN subordinates s 
		ON s.employee_id = e.manager_id
) 
SELECT count(*) from subordinates;
-------------------------------------------------------------------------------------------------------------------


--2
WITH RECURSIVE subordinates AS (
	SELECT 
		employee_id, manager_id, full_name
	FROM 
		employees
	where
		employee_id = 19
		
union

	select
		e.employee_id, e.manager_id, e.full_name
	from
		employees e
	JOIN subordinates s
		on s.manager_id = e.employee_id
) 
SELECT count(*)-1 as number_of_managers 
from subordinates


-- 3.

--3. Менеджер 1 и его подчиненные 
-- со 2-го и 3-го уровней иерархии 
--(подчиненные 4-го уровня иерархии не должны попасть в выборку).
--------------------------------------------------------------------------
WITH RECURSIVE subordinates AS (
	select
		employee_id, manager_id, full_name, 1 as level
	from 
		employees
	where employee_id = 1
	
union

	select
		e.employee_id, e.manager_id, e.full_name, level+1
	from
		employees e
	JOIN subordinates s 
		ON s.employee_id = e.manager_id
) 
select * from subordinates
where level < 4