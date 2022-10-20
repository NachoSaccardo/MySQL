USE tienda;

#Abrir el script de la base de datos llamada “tienda.sql” y ejecutarlo para crear sus tablas e 
#insertar datos en las mismas. A continuación, generar el modelo de entidad relación. Deberá 
#obtener un diagrama de entidad relación igual al que se muestra a continuación: 

#A continuación, se deben realizar las siguientes consultas sobre la base de datos:
#1. Lista el nombre de todos los productos que hay en la tabla producto.
SELECT nombre FROM producto;

#2. Lista los nombres y los precios de todos los productos de la tabla producto.
SELECT nombre, precio FROM producto;

#3. Lista todas las columnas de la tabla producto.
SHOW COLUMNS FROM producto;

#4. Lista los nombres y los precios de todos los productos de la tabla producto, redondeando el valor del precio.
SELECT nombre, ROUND(precio) FROM producto;

#5. Lista el código de los fabricantes que tienen productos en la tabla producto.
SELECT codigo_fabricante FROM producto;

#6. Lista el código de los fabricantes que tienen productos en la tabla producto, sin mostrar los repetidos.
SELECT DISTINCT codigo_fabricante FROM producto;

#7. Lista los nombres de los fabricantes ordenados de forma ascendente.
SELECT nombre FROM fabricante ORDER BY nombre ASC;

#8. Lista los nombres de los productos ordenados en primer lugar por el nombre de forma ascendente y en segundo lugar por el precio de forma descendente.
SELECT nombre, precio FROM producto ORDER BY nombre ASC, precio DESC;

#9. Devuelve una lista con las 5 primeras filas de la tabla fabricante.
SELECT * FROM fabricante LIMIT 5;

#10. Lista el nombre y el precio del producto más barato. (Utilice solamente las cláusulas ORDER BY y LIMIT)
SELECT nombre, precio FROM producto ORDER BY precio ASC LIMIT 1;

#11. Lista el nombre y el precio del producto más caro. (Utilice solamente las cláusulas ORDER BY y LIMIT)
SELECT nombre, precio FROM producto ORDER BY precio DESC LIMIT 1;

#12. Lista el nombre de los productos que tienen un precio menor o igual a $120.
SELECT nombre, precio FROM producto WHERE precio<=120;

#13. Lista todos los productos que tengan un precio entre $60 y $200. Utilizando el operador BETWEEN.
SELECT nombre, precio FROM producto WHERE precio BETWEEN 60 and 200;

#14. Lista todos los productos donde el código de fabricante sea 1, 3 o 5. Utilizando el operador IN.
SELECT * FROM PRODUCTO WHERE codigo_fabricante IN (1, 3, 5);

#15. Devuelve una lista con el nombre de todos los productos que contienen la cadena Portátil en el nombre.
SELECT nombre FROM producto WHERE nombre LIKE "%Portatil%";

#Consultas Multitabla 
#1. Devuelve una lista con el código del producto, nombre del producto, código del fabricante y nombre del fabricante, de todos los productos de la base de datos.
SELECT producto.codigo, 
producto.nombre, 
producto.codigo_fabricante, 
fabricante.nombre 
FROM producto 
INNER JOIN fabricante ON codigo_fabricante = fabricante.codigo;

#2. Devuelve una lista con el nombre del producto, precio y nombre de fabricante de todos los productos de la base de datos. 
#Ordene el resultado por el nombre del fabricante, por orden alfabético.
SELECT producto.codigo, 
producto.nombre, 
producto.codigo_fabricante, 
fabricante.nombre 
FROM producto 
INNER JOIN fabricante ON codigo_fabricante = fabricante.codigo
ORDER BY fabricante.nombre;

#3. Devuelve el nombre del producto, su precio y el nombre de su fabricante, del producto más barato. 
SELECT 
producto.nombre, 
producto.precio,
fabricante.nombre 
FROM producto 
INNER JOIN fabricante ON codigo_fabricante = fabricante.codigo
ORDER BY precio ASC LIMIT 1;

#4. Devuelve una lista de todos los productos del fabricante Lenovo.
SELECT * FROM producto INNER JOIN fabricante ON codigo_fabricante = fabricante.codigo WHERE fabricante.nombre LIKE "%Lenovo%";

#5. Devuelve una lista de todos los productos del fabricante Crucial que tengan un precio mayor que $200.
SELECT * FROM producto INNER JOIN fabricante ON codigo_fabricante = fabricante.codigo WHERE precio>200 AND fabricante.nombre LIKE "%Crucial%";
 
#6. Devuelve un listado con todos los productos de los fabricantes Asus, Hewlett-Packard. Utilizando el operador IN.
SELECT * FROM producto INNER JOIN fabricante ON codigo_fabricante = fabricante.codigo WHERE fabricante.nombre IN ("Asus", "Hewlett-Packard");

#7. Devuelve un listado con el nombre de producto, precio y nombre de fabricante, de todos los productos que tengan un precio 
#mayor o igual a $180. Ordene el resultado en primer lugar por el precio (en orden descendente) y en segundo lugar por el nombre (en orden ascendente)
SELECT producto.nombre, precio, fabricante.nombre FROM producto INNER JOIN fabricante ON codigo_fabricante = fabricante.codigo WHERE precio>=180 ORDER BY precio DESC, producto.nombre ASC;

#Consultas Multitabla 
#Resuelva todas las consultas utilizando las cláusulas LEFT JOIN y RIGHT JOIN.

#1. Devuelve un listado de todos los fabricantes que existen en la base de datos, junto con los productos que tiene cada uno de ellos. El listado deberá mostrar también aquellos 
#fabricantes que no tienen productos asociados.
SELECT * FROM fabricante LEFT JOIN producto ON codigo_fabricante = fabricante.codigo;


#2. Devuelve un listado donde sólo aparezcan aquellos fabricantes que no tienen ningún producto asociado.
SELECT * FROM fabricante LEFT JOIN producto ON codigo_fabricante = fabricante.codigo where producto.codigo IS NULL;

#Subconsultas (En la cláusula WHERE) Con operadores básicos de comparación
#1. Devuelve todos los productos del fabricante Lenovo. (Sin utilizar INNER JOIN)
SELECT * FROM producto where codigo_fabricante = (SELECT codigo from fabricante where nombre LIKE "%Lenovo%") ;

#2. Devuelve todos los datos de los productos que tienen el mismo precio que el producto más caro del fabricante Lenovo. (Sin utilizar INNER JOIN).
SELECT * FROM producto WHERE precio = (SELECT MAX(precio) FROM producto where codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre LIKE "%Lenovo%"));

#3. Lista el nombre del producto más caro del fabricante Lenovo.
SELECT nombre FROM producto WHERE precio = (SELECT MAX(precio) FROM producto where codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre LIKE "%Lenovo%"));

#4. Lista todos los productos del fabricante Asus que tienen un precio superior al precio medio de todos sus productos.
SELECT * FROM producto WHERE precio>(SELECT AVG(precio) from producto WHERE codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre LIKE "%Asus%")) AND codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre LIKE "%Asus%");

#Subconsultas con IN y NOT IN
#1. Devuelve los nombres de los fabricantes que tienen productos asociados. (Utilizando IN o NOT IN).
SELECT DISTINCT fabricante.nombre FROM fabricante LEFT JOIN producto ON codigo_fabricante = fabricante.codigo WHERE producto.codigo IS NOT NULL;

#2. Devuelve los nombres de los fabricantes que no tienen productos asociados. (Utilizando IN o NOT IN).
SELECT DISTINCT fabricante.nombre FROM fabricante LEFT JOIN producto ON codigo_fabricante = fabricante.codigo WHERE producto.codigo IS NULL;

#Subconsultas (En la cláusula HAVING)
#1. Devuelve un listado con todos los nombres de los fabricantes que tienen el mismo número de productos que el fabricante Lenovo.
SELECT fabricante.nombre, 
COUNT(producto.codigo), 
fabricante.codigo 
FROM fabricante 
LEFT JOIN producto ON codigo_fabricante = fabricante.codigo 
GROUP BY fabricante.nombre 
HAVING COUNT(producto.codigo)=
			(SELECT COUNT(producto.codigo) FROM fabricante LEFT JOIN producto ON codigo_fabricante = fabricante.codigo WHERE fabricante.nombre LIKE "%Lenovo%"); 

#haciendolo sin join
SELECT  codigo_fabricante, COUNT(codigo), (SELECT nombre FROM fabricante WHERE codigo = codigo_fabricante) 
FROM producto 
GROUP BY codigo_fabricante 
HAVING COUNT(codigo)=
		(SELECT COUNT(codigo) from producto WHERE codigo_fabricante=
				(SELECT codigo FROM fabricante WHERE nombre LIKE "Lenovo")); 