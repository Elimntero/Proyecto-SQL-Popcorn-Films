# :popcorn:**Popcorn & Films**:clapper:

:page_with_curl:**Descripción**

Este proyecto consiste en una serie de consultas SQL diseñadas para extraer información relevante de una base de datos cinematográfica. El objetivo es analizar y obtener datos sobre películas, actores y clasificaciones de una forma eficiente.

:open_book:**Contenido del Script**

	1.	Películas con clasificación “R”. Extrae los títulos de todas las películas con clasificación por edades “R”.
	2.	Actores con un ID entre 30 y 40. Devuelve los nombres y el ID de los actores cuyo actor_id esté en ese rango.
	3.	Películas en las que el idioma coincide con el original. Muestra las películas cuyo language_id coincide con original_language_id.
	4.	Ordenar películas por duración. Lista todas las películas ordenadas de forma ascendente según su duración.
	5.	Actores cuyo apellido es “Allen”. Obtiene los nombres y apellidos de los actores que tienen “Allen” en su apellido.
	6.	Cantidad total de películas por clasificación. Agrupa las películas por clasificación y muestra la cantidad total en cada categoría.

:hammer_and_wrench:**Requisitos**

Para ejecutar estas consultas, se necesita:
- Un sistema de gestión de bases de datos compatible con SQL (PostgreSQL, MySQL, SQL Server, etc.).
- Acceso a la base de datos que contenga la información necesaria para la realización de las consultas y esquema entidad-relación en SQL.

:pushpin:**Instrucciones de Uso**

1. Preparar el entorno.
   - Instalar un gestor de bases de datos, en este caso, PostgreSQL.
   - Conectarse a la base de datos donde se encuentran las tablas necesarias, en este caso, "BBDD Popcorn & Films.sql".
3. Crear el esquema entidad-relación de la base de datos.
4. Ejecutar las consultas.
   - Crear un nuevo script.
   - Escribir los enunciados de las consultas.
   - Resolver las consultas en función de la información del esquema entidad-relación de la base de datos.
5.Ejecutar el script línea por línea.

:bar_chart:**Posibles Mejoras y Extensiones**

Las siguientes mejoras pueden hacer que el proyecto sea más robusto, eficiente y útil para la toma de decisiones:

- Incluir consultas avanzadas para un análisis más profundo sobre todas las tablas.
- Crear índices para mejorar el rendimiento de las consultas frecuentes.
- Implementar más vistas SQL para facilitar la reutilización de consultas comunes.
- Automatizar la ejecución de las consultas con scripts en Python o Power BI para visualizar los datos gráficamente.

📧 Contacto
