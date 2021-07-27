USE lead_gen_business;

--1. ¿Qué consulta ejecutaría para obtener los ingresos totales para marzo de 2012?

SELECT MONTHNAME(charged_datetime) as month, SUM(amount) as revenue FROM billing WHERE charged_datetime>='2012-03' AND charged_datetime<'2012-04'
GROUP BY MONTHNAME(charged_datetime); --WHERE charged_datetime LIKE '2012-03-%';

--2. ¿Qué consulta ejecutaría para obtener los ingresos totales recaudados del cliente con una identificación de 2?
SELECT client_id, SUM(amount) as total_revenue FROM  billing WHERE client_id = 2;

--3. ¿Qué consulta ejecutaría para obtener todos los sitios que posee client = 10? 
SELECT domain_name as website, client_id FROM 

