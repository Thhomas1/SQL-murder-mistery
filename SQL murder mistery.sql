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




Pistas obtenidas por medio de la consulta:

El ID 14887 

El ID 16371

*/
              