use sakila;
-- ¿Qué consulta ejecutarías para obtener todos los clientes dentro de city_id = 312? 

select * from customer;
select * from address;
select * from city;

-- filtrar
select * from address 
where city_id = 312;

select * from customer
where address_id in (256,517);

-- Su consulta debe devolver el nombre, apellido, correo electrónico y dirección del cliente.
select customer.first_name nombre, customer.last_name apellido, customer.email, address.address direccion from customer
INNER JOIN address ON address.address_id = customer.address_id
where address.address_id in (256,517);
-- ¿Qué consulta harías para obtener todas las películas de comedia? Su consulta debe devolver el título de la película, la descripción, el año de estreno, la calificación, las características especiales y el género (categoría).
select*from film;
select*from category;
select*from film_category;
select film.title, film.description, film.release_year, film.rating, film.special_features, category.name genero 
from film_category fc
INNER JOIN film ON fc.film_id = film.film_id
INNER JOIN category ON fc.category_id = category.category_id
where category.category_id = 5
;
-- ¿Qué consulta harías para obtener todas las películas unidas por actor_id = 5? Su consulta debe devolver la identificación del actor, el nombre del actor, el título de la película, la descripción y el año de lanzamiento.
select * from film_actor;
INNER JOIN actor ON actor.actor_id = film_actor.actor_id
INNER JOIN FILM ON film_actor.film_id = film.film_id
where actor.actor_id = 5
;
select customer.store_id, address.address_id, customer.first_name nombre, customer.last_name apellido, customer.email correo, address.address direccion from customer
INNER JOIN address ON address.address_id = customer.address_id
where customer.store_id = 1
and address.address_id in (1, 42, 312, 459)
;

-- ¿Qué consulta realizarías para obtener todas las películas con una "calificación = G" y "característica especial = detrás de escena", unidas por actor_id = 15?
-- Su consulta debe devolver el título de la película, la descripción, el año de lanzamiento, la calificación y la función especial. Sugerencia: puede usar la función LIKE para obtener la parte 'detrás de escena'.

select film.title titulo, film.description descripcion, film.release_year estreno, film.rating calificacion, film.special_features
from film_actor fa
INNER JOIN film ON fa.film_id = film.film_id
INNER JOIN actor ON fa.actor_id = actor.actor_id
where actor.actor_id = 15
and film.rating = 'G'
and film.special_features like '%ehind%'
;

-- ¿Qué consulta harías para obtener todos los actores que se unieron en el film_id = 369?
-- Su consulta debe devolver film_id, title, actor_id y actor_name.

select film.film_id, film.title titulo, actor.actor_id, concat(actor.first_name," ", actor.last_name) as actor_name
from film_actor fa
INNER JOIN film ON fa.film_id = film.film_id
INNER JOIN actor ON fa.actor_id = actor.actor_id
where film.film_id = 369
;

-- ¿Qué consulta harías para obtener todas las películas dramáticas con una tarifa de alquiler de 2.99?
-- Su consulta debe devolver el título de la película, la descripción, el año de estreno, la calificación, las características especiales y el género (categoría).

select film.title titulo, film.description descripcion, film.release_year estreno, film.rating calificacion, film.special_features otros, category.name genero
from film_category fc
INNER JOIN film ON fc.film_id = film.film_id
INNER JOIN category ON fc.category_id = category.category_id
where category.category_id = 7
and film.rental_rate = 2.99
;

-- ¿Qué consulta harías para obtener todas las películas de acción a las que se une SANDRA KILMER?
-- Su consulta debe devolver el título de la película, la descripción, el año de estreno, la calificación, las características especiales, el género (categoría) y el nombre y apellido del actor.

select film.title titulo, film.description descripcion, film.release_year estreno, film.rating calificacion, film.special_features otros, category.name genero, 'SANDRA KILMER' as actor_name
from (((film_category fc
INNER JOIN film ON fc.film_id = film.film_id)
INNER JOIN category ON fc.category_id = category.category_id)
INNER JOIN film_actor ON fc.film_id = film_actor.film_id)
where category.category_id = 1
and film_actor.actor_id = 23
;