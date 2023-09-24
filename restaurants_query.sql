/*SQL code*/

/*Todas las mesas ocupadas de un local en concreto, así como los clientes que las ocupan*/
/*All occupied tables in a particular establishment, as well as the customers using them.*/
/*opción 1 sabiendo id - option 1 with id*/
SELECT t.table_number as mesa, c.name as nombre FROM restaurants.clients_has_tables as rest 
JOIN restaurants.tables as t ON t.id = rest.tables_id 
JOIN restaurants.clients as c ON c.id = rest.clients_id
WHERE t.locals_id = 1;
/*opción 2 sabiendo nombre local - Option 2 with local's name*/
SELECT t.table_number as mesa, c.name as nombre FROM restaurants.clients_has_tables as rest 
JOIN restaurants.tables as t ON t.id = rest.tables_id 
JOIN restaurants.clients as c ON c.id = rest.clients_id
WHERE t.locals_id = (SELECT l.id FROM restaurants.locals as l WHERE l.name = 'L1');

/*Todos los locales marcados como favorito por un cliente, incluyendo la información del local y del cliente.*/
/*All locals marked as favourite by a customer, including the information of the local and the customer.*/
/*opción 1 sabiendo id - option 1 with id*/
SELECT l.name as local, l.address as direccion, l.phone as telefono_local, l.owner_name as responsable, l.open as abierto, c.name as nombre_cliente, c.phone as telefono_cliente, c.email as email_cliente 
FROM restaurants.favourites as fav 
JOIN restaurants.locals as l ON l.id = fav.locals_id 
JOIN restaurants.clients as c ON c.id = fav.clients_id
WHERE c.id = 1;
/*opción 2 sabiendo nombre del cliente - Option 2 with client's name*/
SELECT l.name as local, l.address as direccion, l.phone as telefono_local, l.owner_name as responsable, l.open as abierto, c.name as nombre_cliente, c.phone as telefono_cliente, c.email as email_cliente 
FROM restaurants.favourites as fav 
JOIN restaurants.locals as l ON l.id = fav.locals_id 
JOIN restaurants.clients as c ON c.id = fav.clients_id
WHERE c.id = (SELECT cl.id FROM restaurants.clients as cl WHERE cl.name = 'Aaa');