#Abrir el script de la base de datos llamada “nba.sql” y ejecutarlo para crear todas las tablas e 
#insertar datos en las mismas. A continuación, generar el modelo de entidad relación. Deberá 
#obtener un diagrama de entidad relación igual al que se muestra a continuación:

USE NBA;

#A continuación, se deben realizar las siguientes consultas sobre la base de datos:
#1. Mostrar el nombre de todos los jugadores ordenados alfabéticamente.
SELECT nombre from jugador ORDER BY nombre;

#2. Mostrar el nombre de los jugadores que sean pivots (‘C’) y que pesen más de 200 libras, ordenados por nombre alfabéticamente.
SELECT * from jugador WHERE posicion LIKE "%C%" AND peso >200 ORDER BY nombre ASC;

#3. Mostrar el nombre de todos los equipos ordenados alfabéticamente.
SELECT nombre FROM equipo ORDER BY nombre ASC;

#4. Mostrar el nombre de los equipos del este (East).
SELECT nombre, conferencia FROM equipo WHERE conferencia LIKE "%East%";

#5. Mostrar los equipos donde su ciudad empieza con la letra ‘c’, ordenados por nombre.
SELECT * FROM equipo WHERE ciudad LIKE "c%";

#6. Mostrar todos los jugadores y su equipo ordenados por nombre del equipo.
SELECT nombre, nombre_equipo FROM jugador ORDER BY nombre_equipo;

#7. Mostrar todos los jugadores del equipo “Raptors” ordenados por nombre.
SELECT * FROM jugador WHERE nombre_equipo LIKE "%Raptors%" ORDER BY nombre;

#8. Mostrar los puntos por partido del jugador ‘Pau Gasol’.
SELECT AVG(Puntos_por_partido) from estadistica WHERE jugador = (SELECT codigo from jugador WHERE nombre LIKE "Pau Gasol");

#9. Mostrar los puntos por partido del jugador ‘Pau Gasol’ en la temporada ’04/05′.
SELECT Puntos_por_partido from estadistica WHERE jugador = (SELECT codigo from jugador WHERE nombre LIKE "Pau Gasol") AND temporada LIKE "04/05";

#10. Mostrar el número de puntos de cada jugador en toda su carrera.


#11. Mostrar el número de jugadores de cada equipo.

#12. Mostrar el jugador que más puntos ha realizado en toda su carrera.

#13. Mostrar el nombre del equipo, conferencia y división del jugador más alto de la NBA.

#14. Mostrar la media de puntos en partidos de los equipos de la división Pacific.

#15. Mostrar el partido o partidos (equipo_local, equipo_visitante y diferencia) con mayor diferencia de puntos.

#16. Mostrar la media de puntos en partidos de los equipos de la división Pacific.

#17. Mostrar los puntos de cada equipo en los partidos, tanto de local como de visitante. 

#18. Mostrar quien gana en cada partido (codigo, equipo_local, equipo_visitante, equipo_ganador), en caso de empate sera null.