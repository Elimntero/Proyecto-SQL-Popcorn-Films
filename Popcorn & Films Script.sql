-- 2. Nombres de todas las películas con una clasificación por edades de 'R'(aparece en rating de film).

select "title"as"Película"
from "film"
where "rating"='R'

-- 3. Encuentra los nombres de los actores que tengan un “actor_id" entre 30 y 40.

select "first_name" as "Nombre_Actor","actor_id" as "Identificación_Actor"
from "actor"
where "actor_id" between 30 and 40;

-- 4. Obtén las películas cuyo idioma coincide con el idioma original.

select "title" as "Película"
from "film"
where "language_id" = "original_language_id";

-- 5. Ordena las películas por duración de forma ascendente.

select "title" as "Película","rental_duration" as "Duración"
from "film"
order by "rental_duration" asc;

-- 6. Encuentra el nombre y apellido de los actores que tengan 'Allen' en su apellido.

select "first_name","last_name"
from "actor" 
where "last_name" like 'ALLEN';

-- 7. Encuentra la cantidad total de películas en cada clasificación de la tabla "film" y muestra la clasificación junto con el recuento.

select "rating" as "Clasificación", COUNT (*) as "Total_Películas"
from "film"
group by "rating"
order by "Total_Películas" desc;

-- 8. Encuentra el título de todas las películas que son 'PG13' o tienen una duración mayor a 3 horas en la tabla 'film'.

select "title"
from "film"
where "rating" = 'PG-13' or "length" > 180;

-- 9. Encuentra la variabilidad de lo que costaría reemplazar las películas.

select variance("replacement_cost") as "Varianza_Reemplazo"
from "film";

 -- 10. Encuentra la mayor y menor duración de una película de nuestra BBDD.

select
max ("length") as "Mayor_Duración",
min ("length") as "Mínima_Duración"
from "film";

-- 11. Encuentra lo que costó el antepenúltimo alquiler ordenado por día.

select "amount" as "Importe_Alquiler", "rental_date" as "Fecha_Alquiler" 
from "payment" as c
inner join "rental" as e 
on c."rental_id" = e."customer_id" 
order by "rental_date" desc
limit 1 offset 2;

-- 12. Encuentra el título de las películas en la tabla 'film' que no sean ni 'NC-17' ni 'G' en cuanto a su clasificación.

select "title" as "Película" ,"rating" as "Clasificación"
from "film"
where "rating" not in ('NC-17','G');

/* 13.  Encuentra el promedio de duración de las películas para cada clasificación de la tabla film.
 Muestra la clasificación junto con el promedio de duración.*/

select AVG ("rental_duration") as "Promedio_Duración_Películas","rating" as "Clasificación"
from "film"
group by "rental_duration","rating";

-- 14. Encuentra el título de todas las películas que tengan una duración mayor a 180 minutos.

select "title","length"
from "film" 
where "length" > 180;

-- 15. ¿Cuánto dinero ha generado en total la empresa?.

select sum ("amount") as "Ingresos_Totales"
from "payment";

-- 16. Muestra los 10 clientes con mayor valor de id.

select "first_name" as "Nombre","last_name" as "Apellido","customer_id" as "Id_Cliente"
from "customer"
order by "customer_id" DESC
limit 10;

-- 17. Encuentra el nombre y apellido de los actores que aparecen en la película con título "Egg Igby".

select concat(c."first_name",'',c."last_name") as "Nombre_Actor"
from "actor" as c
inner join "film_actor" as e on c."actor_id" = e."actor_id"
inner join "film" as f on e. "film_id" = f."film_id"
where f."title" = 'EGG IGBY';

-- 18. Secciona todos los nombres de las películas únicos.
select "title" as "Película"
from "film"
group by "title"
having count(*) = 1;

-- 19. Títulos de películas que son comedias y tienen una duración mayor a 180 minutos.

select c."title" as "Película_Comedia"
from "film" c
inner join "film_category" e on c."film_id" = e."film_id"
inner join "category" f on e."category_id" = f."category_id"
where f."name" = 'Comedy' and c."length" > 180;

-- 20. Categorías de películas con un promedio de duración superior a 110 minutos.

select c."name" as "Categoría_Película", AVG(e. "length") as "Promedio_Duración"
from "film" e
inner join "film_category" f on e."film_id"=f."film_id"
inner join "category" c on f."category_id"=c."category_id"
group by c."name"
having AVG(e. "length") > 110;

-- 21. Media de duración del alquiler de las películas.

select AVG ("rental_duration") as "Media_Duración_Alquiler_Películas"
from "film";

-- 22. Crear una columna con el nombre y apellidos de todos los actores y actrices.

select concat ("first_name",' ',"last_name") as "Actor_Actriz"
from "actor";

-- 23. Número de alquileres por día, ordenados de forma descendente.

select date("rental_date") as "Fecha", count(*) as "Alquiler_Total"
from "rental"
group by date("rental_date")
order by "Alquiler_Total" DESC;

-- 24. Películas con una duración superior al promedio.

select "title" as "Película", "length" as "Duración"
from "film"
where "length" >
  (select AVG("length") 
   from "film");

-- 25. Número de alquileres registrados por mes.

select extract('month' from "rental_date") as "Mes_Alquiler", count(*) as Número_Alquileres
from "rental"
group by extract('month' from "rental_date")
order by "Mes_Alquiler";

-- 26. Encuentra el promedio, la desviación estándar y la varianza del total pagado.

select AVG("amount") as "Promedio_Pago",
STDDEV("amount") as "Desviación_Estándar_Pago",
VARIANCE("amount") as "Varianza_Pago"
from "payment";

-- 27. ¿Qué películas se alquilan por encima del precio medio?.

select c."title" as "Película", c."rental_rate" as "Precio_Alquiler"
from "film" c
where c."rental_rate">
  (select AVG("rental_rate")
   from "film");

-- 28. Muestra el ID de los actores que hayan participado en más de 40 películas.

select "actor_id"
from "film_actor"
group by "actor_id"
having count("film_id") > 40;

-- 29. Obtener todas las películas y, si están disponibles en el inventario, mostrar la cantidad disponible.

select c."title" as "Película", count(e."inventory_id") as "Inventario_Disponible"
from "film" c
left join "inventory" e on c."film_id"=e."film_id"
group by c."title";

-- 30. Obtener los actores y el número de películas en las que han actuado.

select c."actor_id" as "Id_Actor", c."first_name" as "Nombre", c."last_name" as "Apellido", count(e."film_id") as "Recuento_Películas"
from "actor" c
left join "film_actor" e on c."actor_id" = e."actor_id"
group by c."actor_id", c."first_name", c."last_name";

-- 31. Obtener todas las películas y mostrar los actores que han actuado en ellas, incluso si algunas películas no tienen actores asociados.

select c."title" as "Película", e."first_name" as "Nombre_Actor", e."last_name" as "Apellido_Actor"
from "film" c
left join "film_actor" f on c."film_id" = f."film_id"
left join "actor" e on f."actor_id" = e."actor_id";

-- 32. Obtener todos los actores y mostrar las películas en las que han actuado, incluso si algunos actores no han actuado en ninguna película.

select c."first_name" as "Nombre", c."last_name" as "Apellido", e."title" as "Película"
from "actor" c
left join "film_actor" f on c."actor_id" = f."actor_id"
left join "film" e on f."film_id" = e."film_id";

-- 33. Obtener todas las películas que tenemos y todos los registros de alquiler.

select c."title" as "Película", e."rental_date" as "Registro_Alquiler"
from film c
full join "inventory" f on c."film_id" = f."film_id"
full join "rental" e on f."inventory_id" = e."inventory_id";

-- 34. Encuentra los 5 clientes que más dinero se hayan gastado.

select c."customer_id" as "Id_Cliente", c."first_name" as "Nombre", c."last_name" as "Apellido", sum(e."amount") as "Total_Gastado"
from "customer" c
join "payment" e on c."customer_id" = e."customer_id"
group by c."customer_id", c."first_name", c."last_name"
order by "Total_Gastado" desc 
limit 5;

-- 35. Selecciona todos los actores cuyo primer nombre es 'Johnny'.

select "actor_id" as "Id_Actor", "first_name" as "Nombre", "last_name" as "Apellido"
from "actor"
where "first_name" = 'JOHNNY';

-- 36. Renombra las columnas “first_name” como "Nombre" y “last_name” como "Apellido".

select "first_name" as "Nombre", "last_name" as "Apellido"
from "actor";

-- 37. Encuentra el ID del actor más bajo y más alto en la tabla "actor".

select min("actor_id") as "Id_Mín_Actor", max("actor_id") as "Id_Máx_Actor"
from "actor";

-- 38. Cuenta cuántos actores hay en la tabla “actor”.

select count(*) as Total_Actores
from "actor";

-- 39. Selecciona todos los actores y ordénalos por apellido en orden ascendente.

select "first_name" as "Nombre", "last_name" as "Apellido"
from "actor"
order by "last_name" asc;

-- 40. Selecciona las primeras 5 películas de la tabla “film”.

select "title" as "Película"
from "film"
limit 5;

-- 41. Agrupa los actores por su nombre y cuenta cuántos actores tienen el mismo nombre.

select "first_name" as "Nombre", count(*) as "Recuento_Nombres"
from "actor"
group by "first_name";

-- 42. Encuentra todos los alquileres y los nombres de los clientes que los realizaron.

select c."rental_id" as "Id_Alquiler", e."first_name" as "Nombre", e."last_name" as "Apellido"
from "rental" c
join "customer" e on c."customer_id" = e."customer_id";

-- 43. Muestra todos los clientesd y sus alquileres, incluyendo aquellos que no tienen alquileres.

select  e."rental_id" as "Id_Alquiler", c."first_name" as "Nombre", c."last_name" as "Apellido"
from "customer" c
left join "rental" e on c."customer_id" = e."customer_id";

-- 44. Realiza un CROSS JOIN entre las tablas film y category.

select *
from "film" c
cross join "category" e;

-- 45. Encuentra los actores que han participado en películas de la categoría 'Action'.
select c."first_name" as "Nombre",c."last_name" as "Apellido"
from "actor" c
join "film_actor" e on c."actor_id" = e."actor_id"
join "film_category" f on e."film_id" = f."film_id"
join "category" g on f."category_id" = g."category_id"
where g."name"='Action';

-- 46. Encuentra todos los actores que no han participado en películas.

select c."first_name" as "Nombre", c."last_name" as "Apellido"
from "actor" c
left join "film_actor" e on c."actor_id" = e."actor_id"
where e."actor_id" is null;

-- 47. Selecciona el nombre de los actores y la cantidad de películas en las que han participado.

select 
 concat(c."first_name", ' ', c."last_name") as "Actor_Actriz",
 count(e."film_id") as "Recuento_Películas"
from "actor" c
left join "film_actor" e on c."actor_id" = e."actor_id"
group by c."actor_id";


-- 48. Crea una vista llamada “actor_num_peliculas” que muestre los nombres de los actores y el número de películas en las que han participado.

create view "Actor_Num_Películas" as
select 
 concat(c."first_name", ' ', c."last_name") as "Actor_Actriz",
 count(e."film_id") as "Recuento_Películas"
from "actor" c
left join "film_actor" e on c."actor_id" = e."actor_id"
group by c."actor_id";

-- 49. Calcula el número total de alquileres realizados por cada cliente.

select 
 c."customer_id" as "Id_Cliente",
 concat(c."first_name", ' ', c."last_name") as "Nombre_Cliente",
 count(e."rental_id") as "Total_Alquileres"
from "customer" c
left join "rental" e on c."customer_id" = e."customer_id"
group by c."customer_id";

-- 50. Calcula la duración total de las películas en la categoría 'Action'.

select sum(c."length") as "Duración_Total_Action"
from "film" c
join "film_category" e on c."film_id" = e."film_id"
join "category" f on e."category_id" = f."category_id"
where f."name" = 'Action';

-- 51. Crea una tabla temporal llamada “cliente_rentas_temporal” para almacenar el total de alquileres por cliente.

create temp table "Cliente_Rentas_Temporal" as
select 
 c."customer_id",
 concat(c."first_name", ' ',c."last_name") as "Nombre_Cliente",
 count(e."rental_id") as "Total_Alquiler"
from "customer" c
left join "rental" e on c."customer_id" = e."customer_id"
group by c."customer_id";

-- 52. Crea una tabla temporal llamada “peliculas_alquiladas” que almacene las películas que han sido alquiladas al menos 10 veces.

create temp table "Películas_Alquiladas" as
select 
 c."film_id",
 c."title",
 count(f."rental_id") as "Recuento_Alquiler"
from "film" c
join "inventory" e on c."film_id" = e."film_id"
join "rental" f on e."inventory_id" = f."inventory_id"
group by c."film_id"
having count(f."rental_id") >= 10;

-- 53. Encuentra el título de las películas que han sido alquiladas por el cliente con el nombre ‘Tammy Sanders’ y que aún no se han devuelto.

select distinct f."title" as "Película"
from "customer" c
join "rental" r on c."customer_id" = r."customer_id"
join "inventory" i on r."inventory_id" = i."inventory_id"
join "film" f on i."film_id" = f."film_id"
where concat(c."first_name", ' ', c."last_name") = 'TAMMY SANDERS'
 and r."return_date" is null
order by f."title";

-- 54. Encuentra los nombres de los actores que han actuado en al menos una película que pertenece a la categoría 'Sci-Fi'.

select distinct concat (a."first_name", ' ', a."last_name") as "Nombre_Actor"
from "actor" a
join "film_actor" fa on a."actor_id" = fa."actor_id"
join "film_category" fc on fa."film_id" = fc."film_id"
join "category" c on fc."category_id" = c."category_id"
where c."name" = 'Sci-Fi'
order by "Nombre_Actor";

-- 55. Encuentra el nombre y apellido de los actores que han actuado en películas que se alquilaron después de que la película ‘Spartacus Cheaper’ se alquilara por primera vez.

select distinct a."first_name" as "Nombre",a."last_name" as "Apellido"
from "actor" a
join "film_actor" fa on a."actor_id" = fa."actor_id"
join "film" f on fa."film_id" = f."film_id"
join "inventory" i on f."film_id" = i."film_id"
join "rental" r on i."inventory_id" = r."inventory_id"
where r."rental_date" > 
   (select MIN("rental_date")
    from "rental" r
    join "inventory" i on r."inventory_id" = i."inventory_id"
    join "film" f on i."film_id" = f."film_id"
    where f."title" = 'SPARTACUS CHEAPER');

-- 56. Encuentra el nombre y apellido de los actores que no han actuado en ninguna película de la categoría 'Music'.

select "first_name" as "Nombre", a."last_name" as "Apellido"
from "actor" a
where a."actor_id" not in
   (select distinct fa."actor_id"
    from "film_actor" fa
    join "film_category" fc on fa."film_id" = fc."film_id"
    join "category" c on fc."category_id" = c."category_id"
    where c."name" = 'Music');

-- 57. Encuentra el título de todas las películas que fueron alquiladas por más de 8 días.

select distinct f."title" as "Película"
from "film" f
join "inventory" i on f."film_id" = i."film_id"
join "rental" r on i."inventory_id" = r."inventory_id"
where date_part('day', r."return_date" - r."rental_date") > 8;

-- 58. Encuentra el título de todas las películas que son de la misma categoría que 'Animation'.

select distinct f."title" as "Película_Animation"
from "film" f
join "film_category" fc on f."film_id" = fc."film_id"
join "category" c on fc."category_id" = c."category_id"
where c."category_id" =
   (select "category_id"
    from "category"
    where "name" = 'Animation');

-- 59. Encuentra los nombres de las películas que tienen la misma duración que la película con el título 'Dancing Fever'.

select f."title" as "Película"
from "film" f
where f."length" = 
   (select "length"
    from "film"
    where "title" = 'DANCING FEVER');

-- 60. Encuentra los nombres de los clientes que han alquilado al menos 7 películas distintas.

select c."first_name" as "Nombre_Cliente"
from "customer" c
join "rental" r on c."customer_id" = r."customer_id"
join "inventory" i on r."inventory_id" = i."inventory_id"
group by c."customer_id"
having count(distinct i."film_id") >= 7;

-- 61. Encuentra la cantidad total de películas alquiladas por categoría.

select c."name" as "Nombre_Categoría", count(r."rental_id") as "Total_Películas_Alquiladas"
from "category" c
join "film_category" fc on c."category_id" = fc."category_id"
join "inventory" i on fc."film_id" = i."film_id"
join "rental" r on i."inventory_id" = r."inventory_id"
group by c."name";

-- 62. Encuentra el número de películas por categoría estrenadas en 2006.

select c."name" as "Nombre_Categoría", count(f."film_id") AS "Recuento_Películas_2006"
from "category" c
join "film_category" fc on c."category_id" = fc."category_id"
join "film" f on fc."film_id" = f."film_id"
where f."release_year" = 2006
group by c."name";

-- 63. Obtén todas las combinaciones posibles de trabajadores con las tiendas.

select concat(s.first_name, ' ', s.last_name) AS "Nombre_Trabajador", s.store_id as "Id_Tienda", st.store_id AS "Otro_Id_Tienda"
from staff s
cross join store st;

/* 64. Encuentra la cantidad total de películas alquiladas por cada cliente.
Muestra el ID del cliente, su nombre y apellido junto con la cantidad de películas alquiladas.*/

select 
    c."customer_id" as "Id_Cliente",
    concat(c."first_name", ' ', c."last_name") as "Nombre_Cliente",
    count(r."rental_id") AS "Total_Películas_Alquiladas"
from "customer" c
join "rental" r on c."customer_id" = r."customer_id"
group by c."customer_id";
