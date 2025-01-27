# README - Popcorn & Films

📌 Descripción

Este proyecto consiste en una serie de consultas SQL diseñadas para extraer información relevante de una base de datos cinematográfica. El objetivo es analizar y obtener datos sobre películas, actores y clasificaciones de una forma eficiente.

📂 Contenido del Script
	1.	Películas con clasificación “R”
	•	Extrae los títulos de todas las películas con clasificación por edades “R”.
	2.	Actores con un ID entre 30 y 40
	•	Devuelve los nombres y el ID de los actores cuyo actor_id esté en ese rango.
	3.	Películas en las que el idioma coincide con el original
	•	Muestra las películas cuyo language_id coincide con original_language_id.
	4.	Ordenar películas por duración
	•	Lista todas las películas ordenadas de forma ascendente según su duración.
	5.	Actores cuyo apellido es “Allen”
	•	Obtiene los nombres y apellidos de los actores que tienen “Allen” en su apellido.
	6.	Cantidad total de películas por clasificación
	•	Agrupa las películas por clasificación y muestra la cantidad total en cada categoría.

🛠 Requisitos

Para ejecutar estas consultas, se necesita:
	•	Un sistema de gestión de bases de datos compatible con SQL (PostgreSQL, MySQL, SQL Server, etc.).
	•	Acceso a la base de datos que contenga las tablas film, actor, y otras necesarias.

📌 Instrucciones de Uso
	1.	Abrir un cliente SQL compatible.
	2.	Conectarse a la base de datos donde se encuentran las tablas necesarias.
	3.	Ejecutar el script línea por línea o en su totalidad según sea necesario.
