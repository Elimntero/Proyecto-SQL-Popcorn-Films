![Encabezado Popcorn & Films](https://github.com/Elimntero/Proyecto-SQL-Popcorn-Films/blob/main/Im%C3%A1genes/Encabezado%20Popcorn%20%26%20Films.png)
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

:pushpin:**Instrucciones de Uso**

1. Preparar el entorno.
- Instalar un gestor de bases de datos.

En este caso, instalo Dbeaver, donde tendremos que crear una conexión PostgreSQL (siendo esta una base de datos relacional de código abierto) para poder visualizar todas las tablas de nuestra base de datos.

![Dbeaver y PostgreSQL](https://github.com/Elimntero/Proyecto-SQL-Popcorn-Films/blob/main/Im%C3%A1genes/Dbeaver%20%2B%20Postgresql.png)
- Conectarse a la base de datos donde se encuentran las tablas necesarias, en este caso, "BBDD Popcorn & Films.sql".

![Secuencia Dbeaver](https://github.com/Elimntero/Proyecto-SQL-Popcorn-Films/blob/main/Im%C3%A1genes/Secuencia%20Dbeaver.png)

3. Crear el esquema entidad-relación de la base de datos.
![Esquema entidad relación BBDD](https://github.com/Elimntero/Proyecto-SQL-Popcorn-Films/blob/main/Esquema%20Entidad%20Relaci%C3%B3n%20Popcorn%20%26%20Films.png)

5. Ejecutar las consultas.
- Crear un nuevo script y ejecutarlo línea por línea.

![](https://github.com/Elimntero/Proyecto-SQL-Popcorn-Films/blob/main/Im%C3%A1genes/Nuevo%20Script%20SQL.png) 

![](https://github.com/Elimntero/Proyecto-SQL-Popcorn-Films/blob/main/Im%C3%A1genes/Script%20SQL.png)
- Escribir los enunciados de las consultas y resolverlas en función de la información del esquema entidad-relación de la base de datos.
   ![Ejemplo Consulta SQL](https://github.com/Elimntero/Proyecto-SQL-Popcorn-Films/blob/main/Im%C3%A1genes/Ejemplo%20de%20consulta%20resuelta.png)

:bar_chart:**Posibles Mejoras y Extensiones**

Las siguientes mejoras pueden hacer que el proyecto sea más robusto, eficiente y útil para la toma de decisiones:

- Incluir consultas avanzadas para un análisis más profundo sobre todas las tablas.
- Crear índices para mejorar el rendimiento de las consultas frecuentes.
- Implementar más vistas SQL para facilitar la reutilización de consultas comunes.
- Automatizar la ejecución de las consultas con scripts en Python o Power BI para visualizar los datos gráficamente.

:woman_technologist:**Autores y Agradecimientos**

 - Elizabeth Montero Domínguez: Análisis y desarrollo del proyecto.
 - Inspiración: [Base de datos de Popcorn & Films](https://raw.githubusercontent.com/Elimntero/Proyecto-SQL-Popcorn-Films/refs/heads/main/BBDD%20Popcorn%20%26%20Films.sql?token=GHSAT0AAAAAAC5DDGZL3XL5XZT6PLNBPQOMZ4X36DA) y soporte de herramientas.


