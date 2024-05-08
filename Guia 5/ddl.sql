create database Biblioteca;
use biblioteca;

create table departamentos(
	idDepartamento int primary key,
    departamento varchar(25) not null,
    pais varchar(25)
); 

create table municipios(
	idMunicipio int primary key,
    municipio varchar(30)not null,
    idDepartamento int(2) not null
);

create table distritos(
	idDistrito int primary key,
    distrito varchar(50) not null,
    idMunicipio int(3) not null
 );
 
 create table direcciones(
	idDireccion int primary key auto_increment,
    linea1 varchar(100) not null,
    linea2 varchar(50),
    idDistrito int(5),
    codigoPostal varchar(7)
);

alter table municipios add foreign key (idDepartamento) references departamentos(idDepartamento);
alter table distritos add foreign key (idMunicipio) references municipios(idMunicipio);
alter table direcciones add foreign key (idDistrito) references distritos(idDistrito);

create table cargos(
	idCargo int primary key,
    cargo varchar(25) not null
);

create table empleados(
	idempleado int primary key,
    nombresEmpleados varchar(100) not null,
    apellidoEmpleados varchar(100) not null,
    duiEmpleado char(9) not null,
    isssEmpleado char(9),
    fechanacEmpleado date not null,
    telefonoEmpleado varchar(15),
    correoEmpleado varchar(100)not null,
    idCargo int not null,
    idDireccion int not null
 );
 alter table Empleados add foreign key (idCargo) references cargos(idCargo);
 alter table Empleados add foreign key (idDireccion) references direcciones(idDireccion);
 
 create table lectores(
	idLector int primary key,
    nombreLector varchar(45) not null,
    apellidoLector varchar(45) not null,
    duiLector char(9) not null,
    telefonoLector varchar(15),
    idDireccion int not null
 );
 
 alter table lectores add foreign key (idDireccion) references direcciones(idDireccion);
 
 create table historialPrestamos(
	idHistorial int primary key,
    fechaEntregado date not null,
    fechaRecibido date not null
 );
  create table prestamos(
	idPrestamo int primary key,
    fechaPrestamo date not null,
    fechaDevolucion date not null,
    idHistorial int not null,
    idEmpleado int not null,
    idLector int not null
 );
 alter table prestamos add foreign key (idEmpleado) references empleados(idEmpleado);
 alter table prestamos add foreign key (idLector) references lectores(idLector);
 alter table prestamos add foreign key (idHistorial) references historialPrestamos(idHistorial);
 
CREATE TABLE moras (
  idMora int primary key,
  cantidadDias int not null,
  moraDia decimal not null,
  cantidadmora decimal not null,
  idPrestamo int(2) not null
);

alter table moras add foreign key (idPrestamo) references prestamos(idPrestamo);

CREATE TABLE autores(
  idAutor int primary key,
  nombreAutor VARCHAR(45) NOT NULL,
  apellidoAutor VARCHAR(45) NOT NULL
 );
 
CREATE TABLE categoriaLibros(
  idCategoria int primary key,
  categoria1 VARCHAR(45) NOT NULL,
  categoria2 VARCHAR(45) not NULL
  );
  
CREATE TABLE editoriales(
  idEditorial int primary key,
  editorial VARCHAR(45) NOT NULL
);

CREATE TABLE condicionLibros(
  idCondicionLibro int primary key,
  condicion VARCHAR(45) NOT NULL
  );

CREATE TABLE libros (
  ISBN CHAR(13) primary key,
  libro VARCHAR(100) NOT NULL,
  estado VARCHAR(45) NOT NULL,
  fechaPublicacion DATE NOT NULL,
  idEditorial INT NOT NULL,
  idCategoria int  NOT NULL,
  idCondicionLibro int  NOT NULL
);

create table prestamoLibro(
idPrestamoLibro int primary key,
ISBN char(13)not null,
idPrestamo int not null
);

alter table prestamoLibro add foreign key (ISBN) references libros(ISBN);
alter table prestamoLibro add foreign key (idPrestamo) references prestamos(idPrestamo);


CREATE TABLE autoreslibros (
  idAutoresLibro int primary key,
  idAutor int not null,
  ISBN char(13)not null
);

alter table libros add foreign key (idCategoria) references categoriaLibros(idCategoria);
alter table libros add foreign key (idEditorial) references editoriales(idEditorial);
alter table libros add foreign key (idCondicionLibro) references condicionLibros(idCondicionLibro);

alter table autoresLibros add foreign key (ISBN) references libros(ISBN);
alter table autoresLibros add foreign key (idAutor) references autores(idAutor);

create table roles(
	idRol int primary key auto_increment,
    rol varchar(50) not null    
);

create table opciones(
	idOpcion int primary key auto_increment,
    opcion varchar(50) not null
);

create table asignacionRolesOpciones(
	idAsignacion int primary key auto_increment,
    idRol int not null,
    idOpcion int not null
);

create table usuarios(
	idUsuario int primary key auto_increment,
    usuario varchar(50) not null,
    contrasenia varchar(50) not null,
    idRol int not null,
    idEmpleado int not null
);

alter table asignacionRolesOpciones add foreign key (idRol) references roles(idRol);
alter table asignacionRolesOpciones add foreign key (idOpcion) references opciones(idOpcion);
alter table usuarios add foreign key (idRol) references roles(idRol);
alter table usuarios add foreign key (idEmpleado) references empleados(idEmpleado);

