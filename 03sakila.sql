USE sakila;
#1. ¿Qué consulta ejecutarías para obtener todos los clientes dentro de city_id = 312?
#Su consulta debe devolver el nombre, apellido, correo electrónico y dirección del cliente.
SELECT
  city.city_id as city_id,
  city,
  first_name,
  last_name,
  email,
  address
FROM
  city
  JOIN address ON city.city_id = address.city_id
  JOIN customer ON address.address_id = customer.address_id
WHERE
  city.city_id = 312;
#2. ¿Qué consulta harías para obtener todas las películas de comedia?
  # Su consulta debe devolver el título de la película, la descripción, el año de estreno, la calificación, las características especiales y el género (categoría).
SELECT
  film.film_id as film_id,
  title,
  description,
  release_year,
  rating,
  special_features,
  category.name as genre
FROM
  film
  JOIN film_category ON film.film_id = film_category.film_id
  JOIN category ON film_category.category_id = category.category_id
WHERE
  category.name = "Comedy";
#3. ¿Qué consulta harías para obtener todas las películas unidas por actor_id = 5?
  #Su consulta debe devolver la identificación del actor, el nombre del actor, el título de la película, la descripción y el año de lanzamiento.
SELECT
  actor.actor_id as actor_id,
  CONCAT(actor.first_name, " ", actor.last_name) as actor_name,
  film.film_id as film_id,
  title,
  description,
  release_year
FROM
  actor
  JOIN film_actor ON actor.actor_id = film_actor.actor_id
  JOIN film ON film_actor.film_id = film.film_id
WHERE
  actor.actor_id = 5;
#4. ¿Qué consulta ejecutaría para obtener todos los clientes en store_id = 1 y dentro de estas ciudades (1, 42, 312 y 459)?
  #Su consulta debe devolver el nombre, apellido, correo electrónico y dirección del cliente.
SELECT
  store.store_id as store_id,
  city_id,
  first_name,
  last_name,
  email,
  address
FROM
  customer
  JOIN address ON customer.address_id = address.address_id
  LEFT JOIN store ON customer.store_id = store.store_id
WHERE
  store.store_id = 1
  AND city_id in (1, 42, 312, 459);
#5. ¿Qué consulta realizarías para obtener todas las películas con una "calificación = G" y "característica especial = detrás de escena", unidas por actor_id = 15?
  #Su consulta debe devolver el título de la película, la descripción, el año de lanzamiento, la calificación y la función especial. Sugerencia: puede usar la función LIKE para obtener la parte 'detrás de escena'.
SELECT
  title,
  description,
  release_year,
  rating,
  special_features
FROM
  film
  JOIN film_actor ON film.film_id = film_actor.film_id
  JOIN actor ON film_actor.actor_id = actor.actor_id
WHERE
  special_features LIKE "%Behind the Scenes%" #refiere al texto, el que puede tener como contenido esto ademas de otro texto
  AND rating = "G"
  AND actor.actor_id = 15;


#6. ¿Qué consulta harías para obtener todos los actores que se unieron en el film_id = 369?
  #Su consulta debe devolver film_id, title, actor_id y actor_name.
SELECT
  film.film_id as film_id,
  title,
  actor.actor_id as actor_id,
  CONCAT(actor.first_name, " ", actor.last_name) as actor_name
FROM
  actor
  JOIN film_actor ON actor.actor_id = film_actor.actor_id
  JOIN film ON film_actor.film_id = film.film_id
  WHERE film.film_id=369;
  
  #7. ¿Qué consulta harías para obtener todas las películas dramáticas con una tarifa de alquiler de 2.99?
  #Su consulta debe devolver el título de la película, la descripción, el año de estreno, la calificación, las características especiales y el género (categoría).
  #8¿Qué consulta harías para obtener todas las películas de acción a las que se une SANDRA KILMER?
  Su consulta debe devolver el t í tulo de la pel í cula,
  la descripci ó n,
  el a ñ o de estreno,
  la calificaci ó n,
  las caracter í sticas especiales,
  el g é nero (categor í a) y el nombre y apellido del actor