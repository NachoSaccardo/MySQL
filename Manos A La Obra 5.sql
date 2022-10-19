USE superheroe;
INSERT INTO creador (id_creador, nombre) VALUES (1, 'Marvel');
INSERT INTO creador (id_creador, nombre) VALUES (2, 'DC Comics');
SELECT * FROM creador;
SELECT * FROM personaje;

INSERT INTO personaje (id_personaje, nombre_real, personaje, Inteligencia, fuerza, velocidad, poder, aparicion, ocupacion, id_creador) VALUES (1, 'Bruce Banner', 'Hulk', 160, '600 mil', 75, 98, 1962, 'Fisico Nuclear', 1);
INSERT INTO personaje (id_personaje, nombre_real, personaje, Inteligencia, fuerza, velocidad, poder, aparicion, ocupacion, id_creador) VALUES (2, 'Tony Stark', 'Iron Man', 170, '200 mil', 70, 123, 1963, 'Inventor Industrial', 1);
INSERT INTO personaje (id_personaje, nombre_real, personaje, Inteligencia, fuerza, velocidad, poder, aparicion, ocupacion, id_creador) VALUES (3, 'Thor Odinson', 'Thor', 145, 'infinita', 100, 235, 1962, 'Rey de Asgard', 1);
INSERT INTO personaje (id_personaje, nombre_real, personaje, Inteligencia, fuerza, velocidad, poder, aparicion, ocupacion, id_creador) VALUES (4, 'Wanda Maximoff', 'Bruja Escarlata', 170, '100 mil', 90, 345, 1964 , 'Bruja', 1);
INSERT INTO personaje (id_personaje, nombre_real, personaje, Inteligencia, fuerza, velocidad, poder, aparicion, ocupacion, id_creador) VALUES (5, 'Carol Danvers', 'Capitana Marvel', 157, '250 mil', 85, 128, 1968, 'Oficial de Inteligencia', 1);
INSERT INTO personaje (id_personaje, nombre_real, personaje, Inteligencia, fuerza, velocidad, poder, aparicion, ocupacion, id_creador) VALUES (6, 'Thanos', 'Thanos', 170, 'infinita', 40, 306, 1973, 'Adorador de la Muerte', 1);
INSERT INTO personaje (id_personaje, nombre_real, personaje, Inteligencia, fuerza, velocidad, poder, aparicion, ocupacion, id_creador) VALUES (7, 'Peter Parker', 'Spiderman', 165, '25 mil', 80, 74, 1962, 'Fotografo', 1);
INSERT INTO personaje (id_personaje, nombre_real, personaje, Inteligencia, fuerza, velocidad, poder, aparicion, ocupacion, id_creador) VALUES (8, 'Steve Rogers', 'Capitan America', 145, '600', 45, 60, 1941, 'Oficial Federal', 1);
INSERT INTO personaje (id_personaje, nombre_real, personaje, Inteligencia, fuerza, velocidad, poder, aparicion, ocupacion, id_creador) VALUES (9, 'Bobby Drake', 'Ice Man', 140, '2 mil', 64, 122, 1963, 'Contador', 1);
INSERT INTO personaje (id_personaje, nombre_real, personaje, Inteligencia, fuerza, velocidad, poder, aparicion, ocupacion, id_creador) VALUES (10, 'Barry Allen', 'Flash', 160, '10 mil', 120, 168, 1956, 'Cientifico Forense', 2);
INSERT INTO personaje (id_personaje, nombre_real, personaje, Inteligencia, fuerza, velocidad, poder, aparicion, ocupacion, id_creador) VALUES (11, 'Bruce Wayne', 'Batman', 170, '500', 32, 47, 1939, 'Hombre de Negocios', 2);
INSERT INTO personaje (id_personaje, nombre_real, personaje, Inteligencia, fuerza, velocidad, poder, aparicion, ocupacion, id_creador) VALUES (12, 'Clark Kent', 'Superman', 165, 'infinita', 120, 182, 1948, 'Reportero', 2);
INSERT INTO personaje (id_personaje, nombre_real, personaje, Inteligencia, fuerza, velocidad, poder, aparicion, ocupacion, id_creador) VALUES (13, 'Diana Prince', 'Mujer Maravilla', 160, 'infinita', 95, 127, 1949, 'Princesa Guerrera', 2);

select * from personaje;
UPDATE personaje set aparicion=1938 where (personaje = 'Superman');

DELETE FROM personaje where personaje="Flash";