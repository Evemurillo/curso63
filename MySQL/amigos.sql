use friends;

SELECT * FROM users;
select * from friendships;

-- Escribe una consulta SQL que devuelva una lista de usuarios junto con los nombres de sus amigos.

SELECT users.first_name, users.last_name, user2.first_name, user2.last_name
FROM users 
INNER JOIN friendships ON friendships.user_id = users.id
INNER JOIN users as user2 ON user2.id = friendships.friend_id;


-- Devuelva a todos los usuarios que son amigos de Kermit, 
-- asegúrese de que sus nombres se muestren en los resultados.

SELECT concat(user2.first_name, " ",user2.last_name) as Usuario, concat(users.first_name," ",users.last_name) as Amigos
FROM users 
INNER JOIN friendships ON friendships.user_id = users.id
INNER JOIN users as user2 ON user2.id = friendships.friend_id
where user2.id = 4;

-- Devuelve el recuento de todas las amistades.

select concat(users.first_name, "  ",users.last_name) as Usuarios, count(users.first_name) as Cantidad_amigos
from friendships
inner join users on users.id = friendships.user_id 
group by users.first_name, users.last_name; 

-- Descubre quién tiene más amigos y devuelve el recuento de sus amigos.

SELECT * from users;
select * -- concat(user2.first_name, " ",user2.last_name) as Usuario
FROM users 
group by users.user_id
INNER JOIN friendships ON friendships.user_id = users.id
INNER JOIN users as user2 ON user2.id = friendships.friend_id
WHERE friendchips.user_id = users_id
GROUP by user_id;

-- Devuelve a los amigos de Eli en orden alfabético.

select * from users; 

select concat(users2.first_name, " ",users2.last_name) as Amigo, concat(users.first_name," ",users.last_name)as Usuarios 
from users
inner join friendships on friendships.user_id = users.id
inner join users as users2 on users2.id = friendships.friend_id
where users2.id= 2
order by Usuarios asc;

-- Crea un nuevo usuario y hazlos amigos de Eli Byers, Kermit The Frog y Marky Mark.
select * from users;
INSERT INTO users (id, first_name,last_name,created_at) VALUES ('6', 'Monica', 'Monje', '2021-07-07 18:22:10');
INSERT INTO friendships (id, user_id, friend_id, created_at) VALUES ('7', '6', '2', '2021-07-07 18:30:05');
INSERT INTO friendships (id, user_id, friend_id, created_at) VALUES ('8', '6', '4', '2021-07-07 18:30:05');
INSERT INTO friendships (id, user_id, friend_id, created_at) VALUES ('9', '6', '5', '2021-07-07 18:30:05');
select * from  friendships;

select concat(users.first_name," ",users.last_name)as Nombre,  concat(users2.first_name, " ",users2.last_name) as Amigos 
from users
inner join friendships on friendships.user_id = users.id
inner join users as users2 on users2.id = friendships.friend_id;

