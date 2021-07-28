USE lead_gen_business;
--1. ¿Qué consulta ejecutaría para obtener los ingresos totales para marzo de 2012?
SELECT
  MONTHNAME(charged_datetime) as month,
  SUM(amount) as revenue
FROM
  billing
WHERE
  charged_datetime >= '2012-03'
  AND charged_datetime < '2012-04'
GROUP BY
  MONTHNAME(charged_datetime);
--WHERE charged_datetime LIKE '2012-03-%';
  --2. ¿Qué consulta ejecutaría para obtener los ingresos totales recaudados del cliente con una identificación de 2?
SELECT
  client_id,
  SUM(amount) as total_revenue
FROM
  billing
WHERE
  client_id = 2;
--3. ¿Qué consulta ejecutaría para obtener todos los sitios que posee client = 10?
SELECT
  domain_name as website,
  client_id
FROM
  sites
WHERE
  client_id = 10;
--4 ¿Qué consulta ejecutaría para obtener el número total de sitios creados por mes por año para el cliente con una identificación de 1? ¿Qué pasa con el cliente = 20?
SELECT
  client_id,
  COUNT(domain_name) as number_of_websites,
  MONTHNAME(created_datetime) as month_created,
  YEAR(created_datetime)
FROM
  sites
WHERE
  client_id = 1
GROUP BY
  MONTHNAME(created_datetime),
  YEAR(created_datetime);
SELECT
  client_id,
  COUNT(domain_name) as number_of_websites,
  MONTHNAME(created_datetime) as month_created,
  YEAR(created_datetime) as year_created
FROM
  sites
WHERE
  client_id = 20
GROUP BY
  MONTHNAME(created_datetime),
  YEAR(created_datetime);
--5  ¿Qué consulta ejecutaría para obtener el número total de clientes potenciales generados para cada uno de los sitios entre el 1 de enero de 2011 y el 15 de febrero de 2011?
SELECT
  sites.domain_name as website,
  COUNT(leads.first_name) as number_of_leads,
  leads.registered_datetime as date_generated
FROM
  leads
  JOIN sites ON leads.site_id = sites.site_id
WHERE
  leads.registered_datetime BETWEEN '2011-1-1'
  AND '2011-2-15'
GROUP BY sites.domain_name, leads.registered_datetime;