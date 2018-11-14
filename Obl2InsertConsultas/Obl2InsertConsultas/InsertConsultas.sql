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

Insert into Pais values ('URY', 'Uruguay')
Insert into Pais values ('ARG', 'Argentina')
Insert into Pais values ('BRA', 'Brasil')
Insert into Pais values ('PRY', 'Paraguay')

Insert into Aeropuerto values ('MVD', 'Aeropuerto de Carrasco', 'URY');
Insert into Aeropuerto values ('EZE', 'Aeropuerto de Ezeiza', 'ARG');
Insert into Aeropuerto values ('GRU', 'Aeropuerto de Sao Paulo', 'BRA');

Insert into PASAJERO values ('48684676', 'Pablo', 'Ingold', 'Sosa', 'CI', 
'48684676', '09-05-1997', 'URY', '094992993', 'p.ingold@outlook.com');
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








/*4)Listar idpasajero, nombre, apellidos y asiento (idasiento y fila) que correspondan a pasajes
comprados para el destino cuyo IdVuelo es 255*/



Select (PASAJERO.idpasajero, PASAJERO.nombre, PASAJERO.apaterno, PASAJERO.amaterno, 
	Asiento.fila, Asiento.letra) from Total
where Total = (Select * from PASAJERO, Pasaje 
where PASAJERO.idpasajero = (Select * from Pasaje, ASIENTO 
where idavion in (Select * from Vuelo where idVuelo = '255'))

	/*Pasaje.idpasajero*/)


/*where Tabla1 = full outer join Pasaje.idpasaje = Tabla2.idpasaje
where Tabla2 = Select * from ASIENTO where idavion in (Select * from Vuelo where idVuelo = '255')*/




/*3)Listar todos los datos de los pasajeros para los cuales haya registrados en el sistema más de 5
pasajes pagos.*/



Select distinct p.idpasajero, nombre, apaterno, amaterno from PASAJERO p, PAGO 
where p.idpasajero = pago.idpasajero and
	exists(Select count(PAGO.idpasajero) as cantidad, idpasajero 
				from PAGO group by idpasajero)
				/*Falta filtro de > 5*/


Select * from pasajero order by idpasajero
/*SELECT Count(*) AS DistinctCountries
FROM (SELECT DISTINCT Country FROM Customers)*/





/*2)Listar todos los datos de los aviones con más de 20 asientos en clase “A” que no tengan asignado
ningún destino que parta el día de mañana.*/


Select distinct * from Avion a, ASIENTO 
where a.idavion = ASIENTO.idavion and
ASIENTO.idavion in (Select count(idasiento) as cantidad, idavion from ASIENTO 
			where asiento.idavion in(Select idavion, count(idavion) as cantAsiento from ASIENTO 
						where clase = 'Ejecutiva' group by idavion) group by idavion)

and a.idavion not in (Select idavion from Vuelo 
					where FechaHoraLlegada = (GETDATE() + 1))




select * from pasaje order by idpasajero





/*1)Listar el o los nombres de los usuarios con la mayor cantidad de pasajes comprados a su nombre.*/
/***************ESTE ANDA **************************/								  
select top 1 pasajero.nombre as Nombre,
		Count(pasaje.idpasajero) as Cantidad
from pasajero, pasaje
where pasajero.idpasajero = pasaje.idpasajero
group by PASAJERO.nombre
order by Cantidad desc								  
								  
/******************************************************/								  
								  
Select nombre from PASAJERO
where exists(Select count(idpasajero) as cantidad, idpasajero 
			from Pasaje group by idpasajero)

select nombre 
from PASAJERO p, Pasaje pa
where p.idpasajero = pa.idpasajero and
exists(Select pa.idpasajero, MAX(cantidad) 
		from (Select idpasajero, count(idpasajero) as cantidad  
				from Pasaje group by idpasajero) group by idpasajero)


/*where Tabla3 = (Select count(distinct idpasajero) as cantPasajes from Pasaje)
(cont) (Select count (distinct idpasajero) as cont from Pasaje)

*/
