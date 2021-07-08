use world;
select * from languages lg where lg.language like '%loven%';

-- ¿Qué consulta harías para obtener todos los países que hablan esloveno? Tu consulta debe devolver el nombre del país, el idioma y el porcentaje de idioma. Tu consulta debe organizar el resultado por porcentaje de idioma en orden descendente. (1)
select * from cities;
select * from countries;
select * from languages;

select lg.id,lg.language, lg.percentage from languages lg where lg.language like '%loven%';

select cou.name 
from countries cou 
where cou.id =16 or  cou.id =96 or cou.id =107 or cou.id =200;

select lg.language,lg.percentage, cou.name 
from languages lg, countries cou 
where lg.country_id = cou.id 
and lg.language = 'Slovene'
 ;select lg.language, lg.percentage from languages lg
where lg.language LIKE '%lovene%'
ORDER BY lg.percentage desc;
SELECT cou.name from countries cou
where cou.id in (16,96, 107,200);

select  name,language, percentage from languages
INNER JOIN countries ON languages.country_id = countries.id
where countries.id in (200,107,96,16)
order by percentage desc
;select * from cities;
select * from countries;
select * from languages; 


select * from cities;
select * from countries;
INNER JOIN countries ON cities.country_id = countries.id
;
-- ¿Qué consulta ejecutarías para mostrar el número total de ciudades para cada país? Su consulta debe devolver el nombre del país y el número total de ciudades. Tu consulta debe organizar el resultado por el número de ciudades en orden descendente. (3)

select * from cities;
select name from countries;

select * from cities , countries
where cities.country_id = countries.id
;

select countries.name from cities
INNER JOIN countries ON cities.country_id = countries.id
;
select countries.name, count(countries.name) total
from cities
INNER JOIN countries ON cities.country_id = countries.id
group by countries.name
order by total DESC;
-- ¿Qué consulta ejecutarías para obtener todos los idiomas en cada país con un porcentaje superior al 89%? 
-- Tu consulta debe organizar el resultado por porcentaje en orden descendente. (1)
select * from countries;
select * from languages;

select * from languages
where percentage >89
;

select countries.name, languages.language, languages.percentage from languages
INNER JOIN countries ON countries.id = languages.country_id
where percentage >89
order by languages.percentage desc;

select ct.name nombre, lg.language lenguaje, lg.percentage porcentaje from languages lg
INNER JOIN countries ct ON ct.id = lg.country_id
where lg.percentage >89
order by lg.percentage desc
;
-- ¿Qué consulta harías para obtener todas las ciudades de México con una población de más de 500,000?
-- Tu consulta debe organizar el resultado por población en orden descendente. (1)

select * from countries
where name like 'Mex%' 
;

select * from cities
where country_id = 136
and population > 500000
order by population DESC;
;

-- ¿Qué consulta haría para obtener todos los países con un área de superficie inferior a 501 y una población superior a 100,000? (2)
select * from countries; -- surface_area, population

select * from countries
where surface_area < 501
and population > 100000
;
-- ¿Qué consulta harías para obtener países con solo Monarquía Constitucional con un capital superior a 200 y una esperanza de vida superior a 75 años? (1)
select * from countries; -- government_form = 'Constitutional Monarchy'; capital; life_expectancy

select * from countries
where government_form = 'Constitutional Monarchy'
and capital > 200
and life_expectancy > 75
;
-- ¿Qué consulta harías para obtener todas las ciudades de Argentina dentro del distrito de Buenos Aires y tener una población superior a 500,000?
--  La consulta debe devolver el nombre del país, el nombre de la ciudad, el distrito y la población. (2)
select * from cities;
select * from countries;

select * from countries
where name like 'Ar%' -- 9
;

select * from cities
where country_id = 9
and district = 'Buenos Aires'
and population > 500000
;

select  countries.name pais, cities.name ciudad, cities.district distrito, cities.population poblacion
from cities
INNER JOIN countries ON countries.id = cities.country_id
where cities.country_id = 9
and cities.district = 'Buenos Aires'
and cities.population > 500000;

-- ¿Qué consulta harías para resumir el número de países en cada región? 
-- La consulta mostrar el nombre de la región y el número de países. Además, debe organizar el resultado por el número de países en orden descendente. (2)

select * from countries;

select region , count(region) numero_paises from countries
group by region
order by numero_paises DESC
;






