#cargo el script "PERSONAL" y lo ejecuto para generar la base de datos

USE personal;

#item 1: Obtener los datos completos de los empleados.
SELECT * FROM empleado;

#item 2: Obtener los datos completos de los departamentos.
SELECT * FROM departamento;

#item 3: Listar el nombre de los departamentos.
SELECT DISTINCT nombre_depto FROM departamento;

#item 4: Obtener el nombre y salario de todos los empleados.
SELECT nombre, salario from empleado;

#item 5: Listar todas las comisiones.
SELECT DISTINCT comision FROM empleado;

#item 6: Obtener los datos de los empleados cuyo cargo sea ‘Secretaria’
SELECT * FROM empleado WHERE cargo like "%Secretaria%";

#item 7: . Obtener los datos de los empleados vendedores, ordenados por nombre alfabéticamente.
SELECT * FROM empleado WHERE cargo like "%Vendedo%" ORDER BY nombre ASC;

#item 8: Obtener el nombre y cargo de todos los empleados, ordenados por salario de menor a ayor.
SELECT	nombre, cargo FROM empleado ORDER BY salario ASC;

#item 9: Elabore un listado donde para cada fila, figure el alias ‘Nombre’ y ‘Cargo’ para las respectivas tablas de empleados
SELECT nombre as "Nombre", cargo as "Cargo" from empleado;

#item 10: Listar los salarios y comisiones de los empleados del departamento 2000, ordenado por comisión de menor a mayor.
SELECT salario, comision FROM empleado WHERE id_depto = 2000 ORDER BY comision ASC;

#item 11: . Obtener el valor total a pagar que resulta de sumar el salario y la comisión de los empleados del departamento 3000 una bonificación de 500, en orden alfabético del empleado.
SELECT nombre, salario, comision, (salario+comision+500) as "Total a Pagar" from empleado where id_depto = 3000;

#item 12: Muestra los empleados cuyo nombre empiece con la letra J.
SELECT * FROM empleado WHERE nombre LIKE "j%";

#item 13: Listar el salario, la comisión, el salario total (salario + comisión) y nombre, de aquellos empleados que tienen comisión superior a 1000.
SELECT salario, comision, (salario+comision) AS "Salario Total", nombre FROM empleado WHERE comision >= 1000;

#item 14: Obtener un listado similar al anterior, pero de aquellos empleados que NO tienen comisión.
SELECT salario, comision, (salario+comision) AS "Salario Total", nombre FROM empleado WHERE comision = 0;

#item 15: Obtener la lista de los empleados que ganan una comisión superior a su sueldo.
SELECT * FROM empleado WHERE comision > salario;

#item 16: Listar los empleados cuya comisión es menor o igual que el 30% de su sueldo.
SELECT * FROM empleado WHERE comision <= salario*0.3;

#item 17: Hallar los empleados cuyo nombre no contiene la cadena “MA”
SELECT * FROM empleado WHERE nombre NOT LIKE "%MA%";

#item 18: . Obtener los nombres de los departamentos que sean “Ventas” ni “Investigación” ni ‘Mantenimiento'.
SELECT id_depto, nombre_depto from departamento WHERE nombre_depto IN ("VENTAS" , "INVESTIGACIÓN" , "MANTENIMIENTO"); 

#item 19: Ahora obtener los nombres de los departamentos que no sean “Ventas” ni “Investigación” ni ‘Mantenimiento.

SELECT nombre_depto from departamento WHERE nombre_depto NOT IN ("VENTAS" , "INVESTIGACIÓN" , "MANTENIMIENTO"); 

#item 20: 20. Mostrar el salario más alto de la empresa.
SELECT MAX(salario) from empleado;

#item 21:  Mostrar el nombre del último empleado de la lista por orden alfabético.
SELECT nombre FROM empleado ORDER BY nombre DESC LIMIT 1;

#item 22: Hallar el salario más alto, el más bajo y la diferencia entre ellos
SELECT MAX(salario) AS Maximo_Salario, MIN(salario) AS Minimo_Salario, (MAX(salario) - MIN(salario)) AS "Diferencia" FROM empleado;

#item 23: Hallar el salario promedio por departamento.
SELECT id_depto, AVG(Salario) FROM empleado GROUP BY id_depto;

#item 24: . Hallar los departamentos que tienen más de tres empleados. Mostrar el número de empleados de esos departamentos.
SELECT id_depto, COUNT(id_empleado) as cantidad_empleados FROM empleado GROUP BY id_depto HAVING cantidad_empleados>3;

#item 25: Mostrar el código y nombre de cada jefe, junto al número de empleados que dirige. Solo los que tengan más de dos empleados (2 incluido).
select 
RIGHT(cod_jefe, 3) as id_jefe, #estos son los ultimos tres numeros del cod_jefe, que vienen a ser un numero de empleado
(SELECT nombre FROM empleado WHERE id_empleado=id_jefe) as "Nombre Jefe", #esto es, usando esos ultimos 3 numeros, la busqueda de a que empleado corresponden
(SELECT cargo FROM empleado WHERE id_empleado=id_jefe) as "Cargo Jefe", #esto es lo mismo pero buscando el cargo de dicho empleado
count(id_empleado) as "Cantidad de Empleados"
					from empleado 
                    group by RIGHT(cod_jefe, 3) 
                    having count(id_empleado)>=2;
                    
#item 26: Hallar los departamentos que no tienen empleado
SELECT 
departamento.id_depto, 
COUNT(id_empleado) as cant_empleados 
					FROM empleado 
                    INNER JOIN departamento ON empleado.id_depto = departamento.id_depto 
                    GROUP BY id_depto 
                    HAVING cant_empleados=0; 
#no devuelve nada xq no hay deptos sin gente

#item 27: Mostrar la lista de los empleados cuyo salario es mayor o igual que el promedio de la empresa. Ordenarlo por departamento.
SELECT nombre, salario from empleado where salario>=(select AVG(salario) from empleado) ORDER BY id_depto;
