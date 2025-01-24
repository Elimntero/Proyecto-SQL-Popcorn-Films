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

select "title"
from "film"
where "rating" = 'R';

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




