USE world;

#	1
SELECT 
    name, language, percentage
FROM
    countries
        JOIN
    languages ON countries.id = languages.country_id
WHERE
    languages.language = 'Slovene'
ORDER BY percentage DESC;
#2
SELECT 
    countries.name AS country_name, COUNT(*) AS Count
FROM
    countries
        JOIN
    cities ON countries.id = cities.country_id
GROUP BY country_name ORDER BY Count DESC ;

#3 ciudades de MEXICO Con poblacion > 500000, poblacion DES

SELECT 
    cities.name AS city_name,
    cities.population AS city_population
FROM
    countries
        JOIN
    cities ON countries.id = cities.country_id
WHERE
    countries.name = 'Mexico'
        AND cities.population > 500000 #no aguanta alias
ORDER BY city_population DESC;

#4 todos los idiomas en cada pais con porcentaje > 89%  porcentaje desc (nombre pais, lenguaje porcentaje)
SELECT 
    countries.name AS country_name, language, percentage
FROM
    countries
        JOIN
    languages ON countries.id = languages.country_id
WHERE
    percentage > 89
ORDER BY percentage DESC;
