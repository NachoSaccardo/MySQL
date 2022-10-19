#25. Mostrar el código y nombre de cada jefe, junto al número de empleados que dirige.
#Solo los que tengan más de dos empleados (2 incluido).

USE personal;
select * from departamento;
select * from empleado;




#con este busco, entre los codigos de jefe, tomando solo los ultimos 3 digitos, todos los valores unicos distintos de NULL
select DISTINCT RIGHT(cod_jefe, 3) from empleado where cod_jefe is NOT NULL;

#con este, uso ese listado de codigos obtenido antes, para compararlo con mi lista de empleados contra id_empleado, y devolver los nombres de esas personas. Estos son los jefes
select id_empleado, nombre from empleado where id_empleado in (select DISTINCT RIGHT(cod_jefe, 3) from empleado where cod_jefe is NOT NULL);

#aca pretendo que me agrupe a todos loe empleados por codigo de jefe y me cuente cuantos empleados tiene cada jefe, mostrandome ademas el nombre y cargo de dicho jefe, pero no funciona bien

select 
count(id_empleado) as "Cantidad de Empleados", 
RIGHT(cod_jefe, 3) as id_jefe, 
(SELECT nombre FROM empleado WHERE id_empleado=id_jefe) as "Nombre Jefe", 
(SELECT cargo FROM empleado WHERE id_empleado=id_jefe) as "Cargo Jefe"
														from empleado 
                                                        group by RIGHT(cod_jefe, 3) 
                                                        having count(id_empleado)>=2;

#aca cree una tabla con los codigos de los jefes para probar y ver de cruzarla
create table jefes (id_empleado INT UNSIGNED AUTO_INCREMENT, Nombre varchar(20), FOREIGN KEY (id_empleado) references empleado(id_empleado));
INSERT Into jefes(id_empleado, nombre) select id_empleado, nombre from empleado where id_empleado in (select DISTINCT RIGHT(cod_jefe, 3) from empleado where cod_jefe is NOT NULL);
select * from jefes;
select distinct cod_jefe from empleado;