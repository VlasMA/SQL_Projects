use bd_1;

-- пользователи
DROP TABLE IF EXISTS users;
CREATE TABLE users (
	id SERIAL PRIMARY KEY, -- SERIAL = BIGINT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE
    firstname VARCHAR(50),
    lastname VARCHAR(50) COMMENT 'Фамилия',
    email VARCHAR(120) UNIQUE
);

INSERT INTO users (id, firstname, lastname, email) VALUES 
(1, 'Reuben', 'Nienow', 'arlo50@example.org'),
(2, 'Frederik', 'Upton', 'terrence.cartwright@example.org'),
(3, 'Unique', 'Windler', 'rupert55@example.org'),
(4, 'Norene', 'West', 'rebekah29@example.net'),
(5, 'Frederick', 'Effertz', 'von.bridget@example.net'),
(6, 'Victoria', 'Medhurst', 'sstehr@example.net'),
(7, 'Austyn', 'Braun', 'itzel.beahan@example.com'),
(8, 'Jaida', 'Kilback', 'johnathan.wisozk@example.com'),
(9, 'Mireya', 'Orn', 'missouri87@example.org'),
(10, 'Jordyn', 'Jerde', 'edach@example.com');

select * from users;


-- Создать таблицу users_old, аналогичную таблице users. Создать процедуру,  
-- с помощью которой можно переместить любого (одного) пользователя из таблицы users в таблицу users_old. 
-- (использование транзакции с выбором commit или rollback – обязательно).


DROP TABLE IF EXISTS users_old;
CREATE TABLE users_old (
	id INT PRIMARY KEY auto_increment, 
    firstname varchar(50), 
    lastname varchar(50), 
    email varchar(120)
);

DELIMITER $$
DROP PROCEDURE IF EXISTS move;
CREATE PROCEDURE  move (IN num1 INT) 
	DETERMINISTIC
BEGIN
INSERT INTO users_old (firstname,lastname,email) 
SELECT firstname, lastname, email 
	FROM users 
	WHERE users.id = num1;
DELETE FROM users 
	WHERE id = num1;
COMMIT;
END$$

DELIMITER ;

CALL move(7); -- Проверяем.

select * from users_old;




-- Создать функцию hello(), которая будет возвращать приветствие, в зависимости от текущего времени суток.
--  С 6:00 до 12:00 функция должна возвращать фразу "Доброе утро", с 12:00 до 18:00 функция должна возвращать фразу "Добрый день",
--  с 18:00 до 00:00 — "Добрый вечер", с 00:00 до 6:00 — "Доброй ночи".


DROP FUNCTION IF EXISTS get_greeting;
DELIMITER //
CREATE FUNCTION get_greeting()
RETURNS char(50)
DETERMINISTIC
BEGIN

declare hour int;
declare msg varchar(50);
SET @hour =  CURTIME();


IF @hour >= '06:00' AND @hour < '12:00'
        then set msg = 'Доброе утро';
ELSEIF @hour >= '12:00' AND @hour < '18:00'
        then set msg = 'Добрый день';
ELSEIF @hour >= '18:00' AND @hour < '23:59'
        then set msg = 'Добрый вечер';
ELSE SET msg =  'Доброй ночи';
end if;
RETURN msg;
END//
DELIMITER ;

SELECT get_greeting();