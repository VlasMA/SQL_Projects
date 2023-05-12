-- найти среднее кол-во фильмов в которых снимались актеры. В качестве результата должно быть выведено число

-- найти все категории фильмов, в которых фильмов 60 и более

-- вначале найдем в скольки фильмах снялся каждый актер

select 
a.actor_id 
,count(*) as "кол-во фильмов"
from 
	film f 
	join film_actor fa 
		on f.film_id = fa.film_id 
	join actor a 
		on a.actor_id = fa.actor_id 
group by a.actor_id ;

-- второй этап

select 
avg ("кол-во фильмов") as "Среднее кол-во фильмов в которых снялись актеры"
from 
(
	select 
	a.actor_id 
	,count(*) as "кол-во фильмов"
	from 
		film f 
		join film_actor fa 
			on f.film_id = fa.film_id 
		join actor a 
			on a.actor_id = fa.actor_id 
	group by a.actor_id 
)avg_films_actors
	
		
-- найти все категории фильмов, в которых фильмов 60 и более

select 
c."name" as "Категория"
,count(*) as "Кол-во фильмов в категории"
from 
	film f 
	join film_category fc 
		on f.film_id = fc.category_id 
	join category c 
		on c.category_id = fc.category_id 
group by c."name" 

having 
	count(*) >= 60;
