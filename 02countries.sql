USE world;
#	1
SELECT
  name,
  language,
  percentage
FROM
  countries
  JOIN languages ON countries.id = languages.country_id
WHERE
  languages.language = 'Slovene'
ORDER BY
  percentage DESC;
#2
SELECT
  countries.name AS country_name,
  COUNT(*) AS Count
FROM
  countries
  JOIN cities ON countries.id = cities.country_id
GROUP BY
  country_name
ORDER BY
  Count DESC;
#3 ciudades de MEXICO Con poblacion > 500000, poblacion DES
SELECT
  cities.name AS city_name,
  cities.population AS city_population
FROM
  countries
  JOIN cities ON countries.id = cities.country_id
WHERE
  countries.name = 'Mexico'
  AND cities.population > 500000 #no aguanta alias
ORDER BY
  city_population DESC;
#4 todos los idiomas en cada pais con porcentaje > 89%  porcentaje desc (nombre pais, lenguaje porcentaje)
SELECT
  countries.name AS country_name,
  language,
  percentage
FROM
  countries
  JOIN languages ON countries.id = languages.country_id
WHERE
  percentage > 89
ORDER BY
  percentage DESC;
#5 ¿Qué consulta haría para obtener todos los países con un área de superficie inferior a 501 y una población superior a 100,000? (2)
SELECT
  countries.name as country_name,
  surface_area,
  population
FROM
  countries
WHERE
  surface_area < 501
  and population > 100000;
#6 ¿Qué consulta harías para obtener países con solo Monarquía Constitucional con un capital superior a 200 y una esperanza de vida superior a 75 años? (1)
SELECT
  countries.name as country_name,
  government_form,
  capital,
  life_expectancy
  
FROM
  countries
WHERE
  government_form = 'Constitutional Monarchy'
  AND capital > 200
  AND life_expectancy > 75;