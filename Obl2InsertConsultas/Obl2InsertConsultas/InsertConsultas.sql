Insert into Aerolinea values (1, '123456789', 'Sol');
Insert into Aerolinea values (2, '234567789', 'Argentinas');
Insert into Aerolinea values (3, '523648963', 'Pluna');
Insert into Aerolinea values (4, '564897413', 'Latam');
Insert into Aerolinea values (5, '897465132', 'Azul');

Insert into Avion values ('A320', '2', 'EADS', 'Airbus', '130')
Insert into Avion values ('A330', '1', 'EADS', 'Airbus', '130')
Insert into Avion values ('A340', '3', 'EADS', 'Airbus', '130')
Insert into Avion values ('A737', '4', 'EADS', 'Boing', '200')
Insert into Avion values ('A767', '5', 'EADS', 'Boing', '200')
Insert into Avion values ('A787', '4', 'EADS', 'Boing', '250')

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

Insert into RESERVA values ('01', '3000', '06-11-2018', 'Todo ok')
Insert into RESERVA values ('02', '2800', '08-11-2018', 'Todo ok')
Insert into RESERVA values ('03', '3300', '10-11-2018', 'Todo ok')

Insert into PAGO (idpago, idreserva, idpasajero, monto, tipo_comprobante, num_comprobante, impuesto) values ('01', '01', '48684676', '3000', 'coso', '658866', '30')
Insert into PAGO values ('02', '01', '48684676', '3000', 'coso', '658866', '30')
Insert into PAGO values ('03', '01', '48684676', '3000', 'coso', '658866', '30')
Insert into PAGO values ('04', '02', '48684676', '3000', 'coso', '658866', '30')
Insert into PAGO values ('05', '02', '48684676', '3000', 'coso', '658866', '30')
Insert into PAGO values ('06', '02', '48684676', '3000', 'coso', '658866', '30') /*No dejo*/

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




/*3)Listar todos los datos de los pasajeros para los cuales haya registrados en el sistema m�s de 5
pasajes pagos.*/



Select nombre, apaterno, amaterno from PASAJERO 
where idpasajero in (
Select count(PAGO.idpasajero) as cantidad, idpasajero from PAGO 
group by idpasajero having count(idpasajero) < 5)



Select * from pasajero order by idpasajero
/*SELECT Count(*) AS DistinctCountries
FROM (SELECT DISTINCT Country FROM Customers)*/





/*2)Listar todos los datos de los aviones con m�s de 20 asientos en clase �A� que no tengan asignado
ning�n destino que parta el d�a de ma�ana.*/


Select * from Avion 
where exists (Select count(idasiento) as cantidad, idavion 
from ASIENTO group by idavion) and
idavion not in (Select idavion from Vuelo where FechaHoraLlegada = (GETDATE() + 1))

select * from pasaje order by idpasajero





/*1)Listar el o los nombres de los usuarios con la mayor cantidad de pasajes comprados a su nombre.*/
Select nombre from PASAJERO
where exists(Select count(idpasajero) as cantidad, idpasajero 
			from Pasaje group by idpasajero)

select nombre 
from PASAJERO p,Pasaje pa
where p.idpasajero = pa.idpasajero and
exists(Select count(idpasajero) as cantidad, idpasajero 
			from Pasaje group by idpasajero)


/*where Tabla3 = (Select count(distinct idpasajero) as cantPasajes from Pasaje)
(cont) (Select count (distinct idpasajero) as cont from Pasaje)

*/