create database Biblioteca;
use biblioteca;

create table departamentos(
	idDepartamento char(2) primary key,
    departamento varchar(25) not null,
    pais varchar(25)
); 

create table municipios(
	idMunicipio char(3) primary key,
    municipio varchar(30)not null,
    idDepartamento char(2) not null
);

create table distritos(
	idDistrito char(5) primary key,
    distrito varchar(50) not null,
    idMunicipio char(3) not null
 );
 
 create table direcciones(
	idDireccion int primary key auto_increment,
    linea1 varchar(100) not null,
    linea2 varchar(50),
    idDistrito char(5),
    codigoPostal varchar(7)
);

alter table municipios add foreign key (idDepartamento) references departamentos(idDepartamento);
alter table distritos add foreign key (idMunicipio) references municipios(idMunicipio);
alter table direcciones add foreign key (idDistrito) references distritos(idDistrito);

create table cargos(
	idCargo char(2) primary key,
    cargo varchar(25) not null
);

create table empleados(
	idempleado char(2) primary key,
    nombresEmpleados varchar(100) not null,
    apellidoEmpleados varchar(100) not null,
    duiEmpleado char(10) not null,
    isssEmpleado char(9),
    fechanacEmpleado date not null,
    telefonoEmpleado varchar(15),
    correoEmpleado varchar(100)not null,
    idCargo char(2)not null,
    idDireccion int not null
 );
 alter table Empleados add foreign key (idCargo) references cargos(idCargo);
 alter table Empleados add foreign key (idDireccion) references direcciones(idDireccion);
 
 create table lectores(
	idLector char(2) primary key,
    nombreLector varchar(45) not null,
    apellidoLector varchar(45) not null
 );
 
 create table historialPrestamos(
	idHistorial char(2) primary key,
    fechaEntregado date not null,
    fechaRecibido date not null
 );
  create table prestamos(
	idPrestamo char(2) primary key,
    fechaPrestamo date not null,
    fechaDevolucion date not null,
    idHistorial char(2) not null,
    idEmpleado char(2) not null,
    idLector char(2) not null
 );
 alter table prestamos add foreign key (idEmpleado) references empleados(idEmpleado);
 alter table prestamos add foreign key (idLector) references lectores(idLector);
 alter table prestamos add foreign key (idHistorial) references historialPrestamos(idHistorial);
 
CREATE TABLE moras (
  idMora CHAR(2) primary key,
  cantidadDias int not null,
  moraDia decimal not null,
  cantidadmora decimal not null,
  idPrestamo CHAR(2) not null
);

alter table moras add foreign key (idPrestamo) references prestamos(idPrestamo);

CREATE TABLE autores(
  idAutor CHAR(2) primary key,
  nombreAutor VARCHAR(45) NOT NULL,
  apellidoAutor VARCHAR(45) NOT NULL
 );
 
CREATE TABLE categoriaLibros(
  idCategoria CHAR(2) primary key,
  categoria1 VARCHAR(45) NOT NULL,
  categoria2 VARCHAR(45) not NULL
  );
  
CREATE TABLE editoriales(
  idEditorial INT primary key,
  editorial VARCHAR(45) NOT NULL
);

CREATE TABLE condicionLibros(
  idCondicionLibro CHAR(2) primary key,
  condicion VARCHAR(45) NOT NULL
  );

CREATE TABLE libros (
  ISBN CHAR(13) primary key,
  libro VARCHAR(100) NOT NULL,
  estado VARCHAR(45) NOT NULL,
  fechaPublicacion DATE NOT NULL,
  idEditorial INT NOT NULL,
  idCategoria CHAR(2) NOT NULL,
  idCondicionLibro CHAR(2) NOT NULL
);

create table prestamoLibro(
idPrestamoLibro int primary key,
ISBN char(13)not null,
idPrestamo char(2) not null
);

alter table prestamoLibro add foreign key (ISBN) references libros(ISBN);
alter table prestamoLibro add foreign key (idPrestamo) references prestamos(idPrestamo);


CREATE TABLE autoreslibros (
  idAutoresLibro int primary key,
  idAutor char(2)not null,
  ISBN char(13)not null
);

alter table libros add foreign key (idCategoria) references categoriaLibros(idCategoria);
alter table libros add foreign key (idEditorial) references editoriales(idEditorial);
alter table libros add foreign key (idCondicionLibro) references condicionLibros(idCondicionLibro);

alter table autoresLibros add foreign key (ISBN) references libros(ISBN);
alter table autoresLibros add foreign key (idAutor) references autores(idAutor);