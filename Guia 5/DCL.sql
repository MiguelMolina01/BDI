use biblioteca;

create role if not exists 'SysAdmin';
create role if not exists 'Bibliotecario';
create role if not exists 'RRHH';

grant all on biblioteca.* TO 'SysAdmin';

grant select, insert, update, delete on biblioteca.direcciones to Bibliotecario;
grant select, insert, update, delete on biblioteca.lectores to Bibliotecario;
grant select, insert, update, delete on biblioteca.prestamos to Bibliotecario;
grant select, insert, update, delete on biblioteca.historialPrestamos to Bibliotecario;
grant select, insert, update, delete on biblioteca.moras to Bibliotecario;
grant select, insert, update, delete on biblioteca.libros to Bibliotecario;
grant select, insert, update, delete on biblioteca.autores to Bibliotecario;
grant select, insert, update, delete on biblioteca.categoriaLibros to Bibliotecario;
grant select, insert, update, delete on biblioteca.condicionLibros to Bibliotecario;
grant select, insert, update, delete on biblioteca.departamentos to Bibliotecario;
grant select, insert, update, delete on biblioteca.municipios to Bibliotecario;
grant select, insert, update, delete on biblioteca.distritos to Bibliotecario;
grant select, insert, update, delete on biblioteca.prestamoLibro to Bibliotecario;
grant select, insert, update, delete on biblioteca.autoresLibros to Bibliotecario;

grant select, insert, update, delete on biblioteca.empleados to RRHH;
grant select, insert, update, delete on biblioteca.direcciones to RRHH;
grant select, insert, update, delete on biblioteca.cargos to RRHH;
grant select, insert, update, delete on biblioteca.departamentos to RRHH;
grant select, insert, update, delete on biblioteca.municipios to RRHH;
grant select, insert, update, delete on biblioteca.distritos to RRHH;

create user if not exists 'admin_juancarlos'@'localhost' 
identified with sha256_password by '1234' 
password expire interval 180 day;

create user if not exists 'Biblio_diegofrancisco'@'localhost' 
identified with sha256_password by '1234' 
password expire interval 180 day;

create user if not exists 'Biblio_marycarmen'@'localhost' 
identified with sha256_password by '1234' 
password expire interval 180 day;

create user if not exists 'rrhh_rauledgardo'@'localhost' 
identified with sha256_password by '1234' 
password expire interval 180 day;

-- Consultar roles y usuarios
select * from mysql.user;

-- VINCULAR USUARIOS A ROLES
grant SysAdmin TO 'admin_juancarlos'@'localhost';
grant Bibliotecario TO 'Biblio_diegofrancisco'@'localhost'; 
grant Bibliotecario TO 'Biblio_marycarmen'@'localhost';
grant RRHH TO 'rrhh_rauledgardo'@'localhost';


    
    