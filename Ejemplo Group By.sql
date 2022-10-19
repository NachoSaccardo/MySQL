

create schema empresa;

USE empresa;

create table empleados (Id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY, Nombre varchar(20) NOT NULL, Salario int NOT NULL, Comision int NOT NULL);

DROP TABLE empleados;
DROP SCHEMA empresa;

insert into empleados value (1, "Franco", 1000, 500);
insert into empleados value (2, "Mariela", 2000, 200);
insert into empleados value (3, "Franco", 1000, 800);
insert into empleados value (4, "Mariela", 2000, 350);

select * from empleados;

#4. GROUP BY
#Especifica una consulta sumaria. En vez de producir una fila de resultados por cada fila de
#datos de la base de datos, una consulta sumaria agrupa todas las filas similares y luego
#produce una fila sumaria de resultados para cada grupo de los nombres de columnas
#enunciados en esta cláusula. En otras palabras, esta cláusula permitirá agrupar un conjunto de columnas con valores
#repetidos y utilizar las funciones de agregación sobre las columnas con valores no repetidos.
#Esta cláusula puede omitirse. SELECT nombre/s de la/s columna/s FROM tablaOrigen GROUP BY nombres de columna/s por la cual Agrupar;

#El resultado de la consulta muestra que agrupa todos los nombres repetidos bajo un solo
#nombre y el salario es la suma de los salarios de las filas que fueron agrupadas.

SELECT nombre, SUM(salario) FROM Empleados GROUP BY nombre;

#Otro ejemplo de un group by sería:
#Teniendo la siguiente tabla de personas:

CREATE TABLE empleados_pais (ID int unsigned auto_increment primary key, nombre varchar(20), pais varchar(20));

INSERT INTO empleados_pais value (1, "Franco", "Argentina");
INSERT INTO empleados_pais value (2, "Guliana", "Alemania");
INSERT INTO empleados_pais VALUE (3, "Agustin", "Argentina");

SELECT * FROM empleados_pais;

SELECT COUNT(ID), pais FROM empleados_pais GROUP BY pais;

#Cuenta la cantidad de gente que tengo en cada pais, devuelve la cuenta de cantidad de IDs agrupado por pais
