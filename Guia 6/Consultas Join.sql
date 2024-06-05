use biblioteca;

-- Mostrar una lista de todos los préstamos realizados, con los detalles del cliente
-- que realizó el préstamo, el libro que prestó y el tiempo de duración del préstamo.
    select
		pre.idPrestamo,lib.libro, lec.nombreLector,lec.apellidoLector,lec.duiLector,
        pre.fechaPrestamo,pre.fechaDevolucion
        from lectores lec
        inner join prestamos pre on pre.idLector = lec.idlector
        inner join prestamoLibro preli on preli.idPrestamo = pre.idPrestamo
        inner join libros lib on preli.ISBN = lib.ISBN;
        
-- Mostrar una lista de todas las moratorias que existan en la base de datos,
-- incluyendo los datos del cliente, el libro que prestó, la cantidad de tiempo que
-- tardó en devolver el libro y el monto a pagar de la mora.

SELECT
  m.idMora,l.nombreLector,l.apellidoLector,
  lb.libro ,m.cantidadDias,m.moraDia ,
  m.cantidadmora
FROM Moras m
inner join Prestamos p on m.idPrestamo = p.idPrestamo
inner join Lectores  l on p.idLector = l.idLector
inner join PrestamoLibro  pl on p.idPrestamo = pl.idPrestamo
inner join Libros lb on pl.ISBN = lb.ISBN;