/*
crime_scene_report
drivers_license
facebook_event_checkin
interview
get_fit_now_member
get_fit_now_check_in
solution
income
person
*/

/*
SELECT *
FROM crime_scene_report
WHERE date = '20180115'
AND city = 'SQL City'
AND type = 'murder'
*/

--Informacion obtenida por medio de este query


              
-- The first witness lives at the last house on "Northwestern Dr". 
-- The second witness, named Annabel, lives somewhere on "Franklin Ave"

/*

Caso para el 1er Testigo

SELECT id, name, address_street_name,  MAX(address_number) address_number
FROM person
WHERE address_street_name = 'Northwestern Dr'

*/



/*

Caso para el 2do Testigo

SELECT id, name, address_street_name, address_number
FROM person
WHERE address_street_name = 'Franklin Ave'
AND name LIKE '%Annabel%'  

Los porcentajes los utilizamos para avisar a SQL 
que contenga ese nombre ya sea al incio o al final


*/


-- Pero si queremos los dos resultados en un mismo query utilizamos un UNION

/*

SELECT id, name, address_street_name,  MAX(address_number) address_number
FROM person
WHERE address_street_name = 'Northwestern Dr'

UNION

SELECT id, name, address_street_name, address_number
FROM person
WHERE address_street_name = 'Franklin Ave'
AND name LIKE '%Annabel%'

*/

-- Pero como todos sabemos solo nos interesa los ID, es decir los identificadores
-- Morty = 14887
-- Annabel = 16371





/*

SELECT * 
FROM interview
WHERE person_id IN (14887, 16371)

En este caso utilizamos el IN para poder mostrar una lista de ID's...




Pistas obtenidas por medio de los testigos:

1) El asesino era hombre
2) Miembro de un gimnasio (Confirmado por los dos testigos)
3) Gold member y su bag era 48Z
4) Auto con patente H42W
5) Fue el 9 de enero del 2018

*/

/*
SELECT *
FROM get_fit_now_member G
INNER JOIN get_fit_now_check_in C ON G.id = C.membership_id
INNER JOIN person P ON P.id = G.person_id
INNER JOIN drivers_license L ON L.id = P.license_id

WHERE C.check_in_date = '20180109'
AND G.membership_status = 'gold'
AND G.id LIKE '48Z%'
AND L.gender = 'male'
AND L.plate_number LIKE '%H42W%'

- ASESINO = Jeremy Bowers


-- Completamos los datos

INSERT INTO solution VALUES (1, 'Jeremy Bowers');
        
        SELECT value FROM solution;

*/

-- Pero hay algo mas detras de todo esto...

/*
SELECT * 
FROM interview
WHERE person_id = 67318


1)La info que sacamos es que es fue contratada por una mujer con mucha guita
2) Mucha plata
3) Estatura promedio 5'5 - 5'7
4) Pelo rojo
5) Auto Tesla Model S
6) Estuvo en el concierto SQL 3 veces en Diciembre de 2017 

*/


/*

SELECT P.id, P.name, I.annual_income, F.event_name, F.date, L.*
FROM person P
INNER JOIN drivers_license L ON L.id = P.license_id
INNER JOIN income I ON I.ssn = P.ssn
INNER JOIN facebook_event_checkin F ON F.person_id = P.id
WHERE L.gender = 'female'
AND L.car_make = 'Tesla'
AND L.car_model = 'Model S'
AND L.height >= 66
AND L.height <= 67
AND L.hair_color = 'red'


Obtuvimos que es Miranda Priestly 
Por lo tanto ponemos en la solucion...



INSERT INTO solution VALUES (1, 'Miranda Priestly');
        
        SELECT value FROM solution;
*/








