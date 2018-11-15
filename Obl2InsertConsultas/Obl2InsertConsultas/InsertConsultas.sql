Insert into Aerolinea values (1, '123456789', 'Sol');
Insert into Aerolinea values (2, '234567789', 'Argentinas');
Insert into Aerolinea values (3, '523648963', 'Pluna');
Insert into Aerolinea values (4, '564897413', 'Latam');
Insert into Aerolinea values (5, '897465132', 'Azul');

Insert into Avion values ('A320', '2', 'EADS', 'Airbus', '130')
Insert into Avion values ('A330', '1', 'EADS', 'Airbus', '200')
Insert into Avion values ('A340', '3', 'EADS', 'Airbus', '250')
Insert into Avion values ('B737', '4', 'EADS', 'Boeing', '130')
Insert into Avion values ('B767', '5', 'EADS', 'Boeing', '200')
Insert into Avion values ('B787', '4', 'EADS', 'Boeing', '250')

insert into asiento values (1, 'a', 1, 'A', 'A320')
insert into asiento values (2, 'b', 1, 'A', 'A320')
insert into asiento values (3, 'e', 1, 'A', 'A320')
insert into asiento values (4, 'f', 1, 'A', 'A320')
insert into asiento values (5, 'a', 9, 'B', 'B737')
insert into asiento values (6, 'b', 9, 'B', 'B737')
insert into asiento values (7, 'f', 35, 'B', 'B767')
insert into asiento values (8, 'e', 39, 'B', 'B767')

INSERT [ASIENTO] ([idasiento], [letra], [fila], [clase], [idavion]) VALUES (50, N'B ', 50, N'Ejecutiva', N'BA690')

Insert into Pais values ('URY', 'Uruguay')
Insert into Pais values ('ARG', 'Argentina')
Insert into Pais values ('BRA', 'Brasil')
Insert into Pais values ('PRY', 'Paraguay')

Insert into Aeropuerto values ('MVD', 'Aeropuerto de Carrasco', 'URY');
Insert into Aeropuerto values ('EZE', 'Aeropuerto de Ezeiza', 'ARG');
Insert into Aeropuerto values ('GRU', 'Aeropuerto de Sao Paulo', 'BRA');

Insert into PASAJERO values ('48684676', 'Pablo', 'Ingold', 'Sosa', 'CI', 
'48684676', '09-05-1997', 'UY', '094992993', 'p.ingold@outlook.com');
Insert into PASAJERO values ('45769845', 'Marcos', 'Julius', 'Mont', 'CI', 
'45769845', '09-05-1991', 'URY', '094556556', 'fnfoasf@outlook.com');
Insert into PASAJERO values ('35769845', 'Julio', 'Alberto', 'Cuadrados', 'CI', 
'35769845', '07-06-1993', 'URY', '094564720', 'gensad@gmail.com');

Insert into usuario values ('p.ingold@outlook.com', '123456', '48684676')
Insert into usuario values ('fnfoasf@outlook.com', '123456', '45769845')
Insert into usuario values ('gensad@gamil.com', '123456', '35769845')

insert into reserva(costo, observacion) values(3000, 'dudas')
insert into reserva(costo, observacion) values(5000, 'todo ok')
insert into reserva(costo, observacion) values(1500, 'todo ok')
insert into reserva(costo, observacion) values(0, 'dudas')

Insert into PAGO (idreserva, idpasajero, monto, tipo_comprobante, num_comprobante, impuesto) values ('01', '48684676', '3000', 'coso', '658866', '30')
Insert into PAGO (idreserva, idpasajero, monto, tipo_comprobante, num_comprobante, impuesto) values ('01', '48684676', '3000', 'coso', '658866', '30')
Insert into PAGO (idreserva, idpasajero, monto, tipo_comprobante, num_comprobante, impuesto) values ('01', '48684676', '3000', 'coso', '658866', '30')
Insert into PAGO (idreserva, idpasajero, monto, tipo_comprobante, num_comprobante, impuesto) values ('02', '48684676', '3000', 'coso', '658866', '30')
Insert into PAGO (idreserva, idpasajero, monto, tipo_comprobante, num_comprobante, impuesto) values ('02', '48684676', '3000', 'coso', '658866', '30')
Insert into PAGO (idreserva, idpasajero, monto, tipo_comprobante, num_comprobante, impuesto) values ('02', '48684676', '3000', 'coso', '658866', '30')


Insert into TARIFA values ('01', 'A', '30', '2500', '01-01-2020')
Insert into TARIFA values ('02', 'B', '20', '2500', '01-01-2020')
Insert into TARIFA values ('03', 'C', '10', '2500', '01-01-2020')

SET IDENTITY_INSERT [Pasaje] ON
INSERT [Pasaje] ([idPasaje], [idreserva], [idpasajero], [idasiento], [idtarifa], [idavion]) VALUES (59, 42, '48684676', 11, 1253, N'US107')
INSERT [Pasaje] ([idPasaje], [idreserva], [idpasajero], [idasiento], [idtarifa], [idavion]) VALUES (59, 42, '', 11, 1253, N'US107')
INSERT [Pasaje] ([idPasaje], [idreserva], [idpasajero], [idasiento], [idtarifa], [idavion]) VALUES (59, 42, N'VAFFE   ', 11, 1253, N'US107')
INSERT [Pasaje] ([idPasaje], [idreserva], [idpasajero], [idasiento], [idtarifa], [idavion]) VALUES (59, 42, N'VAFFE   ', 11, 1253, N'US107')





/*5. Listar todos los Destinos y cantidad de pasajes comprados durante el mes de Setiembre de este año
para c/u de los destinos del pasajero cuyo correo es soyuruguayo@gmail.com. La lista debe estar
ordenada por destino ascendente.*/

/*******************Este anda*************/
Select Todos.idpais, count(Distinct Todos.nombre) as cant from PASAJERO p, (Select Pasaje.idPasaje, Pasaje.idpasajero, Destinos.nombre, Destinos.idpais 
										from Pasaje, (Select Aeropuerto.nombre, Aeropuerto.idpais, Vuelo.idavion from Vuelo, Aeropuerto
															where Aeropuerto.IdAeropuerto = Vuelo.idAeropuertoDestino
															and Vuelo.FechaHoraSalida between '2018-09-01' and '2018-09-30') as Destinos
									where Pasaje.idavion = Destinos.idavion) as Todos
	where Todos.idpasajero = p.idpasajero and p.email = 'soyuruguayo@gmail.com' GROUP BY Todos.nombre, Todos.idpais
	


Select Todos.nombre, Todos.idpais, count(Distinct Todos.nombre) as cant from PASAJERO p, (Select Pasaje.idPasaje, Pasaje.idpasajero, Destinos.nombre, Destinos.idpais 
								from Pasaje, (Select Aeropuerto.nombre, Aeropuerto.idpais, Vuelo.idavion from Vuelo, Aeropuerto
													where Aeropuerto.IdAeropuerto = Vuelo.idAeropuertoDestino
													and Vuelo.FechaHoraSalida between '2018-01-01' and '2018-12-30') as Destinos
							where Pasaje.idavion = Destinos.idavion) as Todos
where Todos.idpasajero = p.idpasajero and p.email = 'ALFKI@Germany.com' GROUP BY Todos.nombre, Todos.idpais





/*4)Listar idpasajero, nombre, apellidos y asiento (idasiento y fila) que correspondan a pasajes
comprados para el destino cuyo IdVuelo es 255*/




select distinct pasajero.idpasajero, pasajero.nombre, pasajero.apaterno, pasajero.apaterno, asiento.idasiento, asiento.fila, vuelo.idvuelo
	from pasajero, asiento, vuelo, Pasaje
	where vuelo.idavion = ASIENTO.idavion and
	      ASIENTO.idasiento = Pasaje.idasiento and
		  Pasaje.idpasajero = PASAJERO.idpasajero and
		  Vuelo.idVuelo = 255
	group by pasajero.idpasajero, pasajero.nombre, pasajero.apaterno, pasajero.apaterno, asiento.idasiento, asiento.fila, vuelo.idvuelo





Select * from Vuelo, Asiento
where Vuelo.idavion = Asiento.idavion and vuelo.idVuelo = 255











/*3)Listar todos los datos de los pasajeros para los cuales haya registrados en el sistema más de 5
pasajes pagos.*/
/***************ESTE ANDA **************************/

select pasajero.*
from pasajero, pago
where pasajero.idpasajero = pago.idpasajero
group by pasajero.idpasajero, pasajero.nombre, pasajero.apaterno, pasajero.amaterno, pasajero.tipo_documento, pasajero.num_documento, pasajero.fecha_nacimiento, pasajero.idpais, pasajero.telefono, pasajero.email
having count(distinct pago.idpago) >= 5


/*2)Listar todos los datos de los aviones con más de 20 asientos en clase “A” que no tengan asignado
ningún destino que parta el día de mañana.*/


Select distinct * from Avion a
where idavion in (Select idavion from ASIENTO 
							where clase = 'Ejecutiva' group by idavion having count(idavion) > 8)
	and a.idavion in (Select idavion from Vuelo 
							where FechaHoraSalida = (GETDATE() + 1))


SET IDENTITY_INSERT [Vuelo] ON 
INSERT [Vuelo] ([idVuelo], [idAeropuertoOrigen], [idAeropuertoDestino], [idavion], [FechaHoraSalida], [FechaHoraLlegada]) 
VALUES (603, N'HKG  ', N'ABA  ', N'AE113', CAST(N'2018-11-15T10:48:02.167' AS DateTime), CAST(N'2018-11-16T10:48:02.167' AS DateTime))


select * from asiento where idavion = 'AE113'
select * from pasaje order by idpasajero

select * from asiento where idavion = 'AE113'



/*1)Listar el o los nombres de los usuarios con la mayor cantidad de pasajes comprados a su nombre.*/
/***************ESTE ANDA **************************/								  
select top 1 pasajero.nombre as Nombre,
		Count(pasaje.idpasajero) as Cantidad
from pasajero, pasaje
where pasajero.idpasajero = pasaje.idpasajero
group by PASAJERO.nombre
order by Cantidad desc							  


Select Pasajero.nombre, Contador.Cantidad as Cantidad from Pasajero, (Select p.idpasajero, count(p.idpasajero) as Cantidad 
															from Pasaje p group by idpasajero) as Contador
where pasajero.idpasajero = Contador.idpasajero 
group by PASAJERO.nombre, Contador.Cantidad having Contador.Cantidad = (Select top 1 Contador.Cantidad from (Select p.idpasajero, count(p.idpasajero) as Cantidad 
																						from Pasaje p group by idpasajero) as Contador)




order by cantidad desc

