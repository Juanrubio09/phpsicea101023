create database p24;
use p24;
create table tbUsuario(Id_UsuarioPK int(10) primary key auto_increment, nombre varchar(100),
 Correo_Electronico varchar (100), Telefono varchar (15), edad_est int(4), passwor varchar (15), Categoria varchar (15), estado varchar (15));
create table tbInstructor(Id_InstructorPK int (10) primary key auto_increment, Nom_Instructor varchar(100), 
categoria_Prof varchar(15), Num_Licencia varchar (15), Num_Certificado varchar (15), horasDictadas int (10));
create table tbCategoria(Id_CategoriaPK int (10) primary key auto_increment, Nom_Categoria varchar(100), 
Duracion int (10), Costo_Categoria  int (10));
CREATE TABLE tbClaseTeoria (
    Id_ClaseTeoriaPK INT(10) PRIMARY KEY AUTO_INCREMENT,
    Id_InstructorFK INT(10), 
    Nom_Clase VARCHAR(100),
    codigo INT(10),
    Hora_Clase TIME,
    fecha DATE,
    cupoEstudiantes INT(3),
    costoProfe INT(10),
    FOREIGN KEY (Id_InstructorFK) REFERENCES tbInstructor(Id_InstructorPK)
);

CREATE TABLE tbClaseTaller (
    Id_ClaseTallerPK INT(10) PRIMARY KEY AUTO_INCREMENT,
    Id_InstructorFK INT(10), 
    Nom_Clase VARCHAR(100),
    codigo INT(10),
    Hora_Clase TIME,
    fecha DATE,
    cupoEstudiantes INT(3),
    costoProfe INT(10),
    FOREIGN KEY (Id_InstructorFK) REFERENCES tbInstructor(Id_InstructorPK)
);

CREATE TABLE tbTiposAutos (
    auttipoPK INT(10) PRIMARY KEY AUTO_INCREMENT,
    autnombre VARCHAR(30),
    Id_CategoriaFK INT(10),         -- Clave foránea para tbCategoria
    Id_InstructorFK INT(10),        -- Clave foránea para tbInstructor
    FOREIGN KEY (Id_CategoriaFK) REFERENCES tbCategoria(Id_CategoriaPK),
    FOREIGN KEY (Id_InstructorFK) REFERENCES tbInstructor(Id_InstructorPK)
);
CREATE TABLE tbClasePractica (
    Id_ClasePracticaPK INT(10) PRIMARY KEY AUTO_INCREMENT,
    Id_InstructorFK INT(10), 
	Id_TiposAutosFK INT(10),
    Nom_Clase VARCHAR(100),
    codigo INT(10),
    Hora_Clase TIME,
    fecha DATE,
    cupoEstudiantes INT(3),
    costoProfe INT(10),
    FOREIGN KEY (Id_InstructorFK) REFERENCES tbInstructor(Id_InstructorPK),
	FOREIGN KEY (Id_TiposAutosFK ) REFERENCES tbTiposAutos(auttipoPK));
    
CREATE TABLE tbAsistencia (
    Id_AsistenciaPK INT(10) PRIMARY KEY AUTO_INCREMENT,
    Id_ClaseTeoriaFK INT(10) NULL,    -- Clave foránea para tbClaseTeoria
    Id_ClaseTallerFK INT(10) NULL,    -- Clave foránea para tbClaseTaller
    Id_ClasePracticaFK INT(10) NULL,  -- Clave foránea para tbClasePractica
    Id_UsuarioFK INT(10),             -- Clave foránea para tbUsuario
    fecha DATE,
    hora TIME,
    estado VARCHAR(10),
    FOREIGN KEY (Id_ClaseTeoriaFK) REFERENCES tbClaseTeoria(Id_ClaseTeoriaPK),
    FOREIGN KEY (Id_ClaseTallerFK) REFERENCES tbClaseTaller(Id_ClaseTallerPK),
    FOREIGN KEY (Id_ClasePracticaFK) REFERENCES tbClasePractica(Id_ClasePracticaPK),
    FOREIGN KEY (Id_UsuarioFK) REFERENCES tbUsuario(Id_UsuarioPK)
);


CREATE TABLE tbInasistencia (
    Id_InasistenciaPK INT(10) PRIMARY KEY AUTO_INCREMENT,
    Id_ClaseTeoriaFK INT(10) NULL,    -- Clave foránea para tbClaseTeoria
    Id_ClaseTallerFK INT(10) NULL,    -- Clave foránea para tbClaseTaller
    Id_ClasePracticaFK INT(10) NULL,  -- Clave foránea para tbClasePractica
    Id_UsuarioFK INT(10),             -- Clave foránea para tbUsuario
    fecha DATE,
    hora TIME,
    estado VARCHAR(10),
    FOREIGN KEY (Id_ClaseTeoriaFK) REFERENCES tbClaseTeoria(Id_ClaseTeoriaPK),
    FOREIGN KEY (Id_ClaseTallerFK) REFERENCES tbClaseTaller(Id_ClaseTallerPK),
    FOREIGN KEY (Id_ClasePracticaFK) REFERENCES tbClasePractica(Id_ClasePracticaPK),
    FOREIGN KEY (Id_UsuarioFK) REFERENCES tbUsuario(Id_UsuarioPK)
);

CREATE TABLE tbReserva (
    Id_ReservaPK INT(10) PRIMARY KEY AUTO_INCREMENT,
    Id_UsuarioFK INT(10),
    Id_ClaseTeoriaFK INT(10) NULL,    -- Clave foránea para tbClaseTeoria
    Id_ClaseTallerFK INT(10) NULL,    -- Clave foránea para tbClaseTaller
    Id_ClasePracticaFK INT(10) NULL,  -- Clave foránea para tbClasePractica
    Estado VARCHAR(20),
    Fecha_Solicitud DATE,
    Hora_Solicitud TIME(6),
    Fecha_Reservada DATE,
    Hora_Reservada TIME(6),
    FOREIGN KEY (Id_UsuarioFK) REFERENCES tbUsuario(Id_UsuarioPK),
    FOREIGN KEY (Id_ClaseTeoriaFK) REFERENCES tbClaseTeoria(Id_ClaseTeoriaPK),
    FOREIGN KEY (Id_ClaseTallerFK) REFERENCES tbClaseTaller(Id_ClaseTallerPK),
    FOREIGN KEY (Id_ClasePracticaFK) REFERENCES tbClasePractica(Id_ClasePracticaPK)
);

CREATE TABLE tbPagar (
    Id_PagarPK INT(10) PRIMARY KEY AUTO_INCREMENT,
    Id_ReservaFK INT(10),            -- Clave foránea para tbReserva
    Valor_Pagar VARCHAR(100),
    FOREIGN KEY (Id_ReservaFK) REFERENCES tbReserva(Id_ReservaPK)
);


create table tbAutomotores(autoplacaPK varchar(6), automarca varchar(30), autotipoFK int(10),
 automodelo int, autopasajeros int, autocilindraje int, autonumchasis varchar (20), primary key (autoplacaPK), foreign key (autotipoFK) references tbTiposAutos (auttipoPK)); 
create table tbAseguramientos(Id_SeguroPK int(6) primary key auto_increment, asefechainicio date, 
asefechaexpiracion date, asevalorasegurado int(100) , aseestado varchar(30), asecosto int(100), aseplacaFK varchar(6),  foreign key (aseplacaFK) references tbAutomotores (autoplacaPK));

CREATE TABLE tbEstudiantesInscr (
    Id_EstudiantesInscrPK INT(10) PRIMARY KEY AUTO_INCREMENT,
    Id_ClaseTeoriaFK INT(10) NULL,         -- Clave foránea para tbClaseTeoria
    Id_ClaseTallerFK INT(10) NULL,         -- Clave foránea para tbClaseTaller
    Id_ClasePracticaFK INT(10) NULL,       -- Clave foránea para tbClasePractica
    fecha DATE,
    hora TIME,
    FOREIGN KEY (Id_ClaseTeoriaFK) REFERENCES tbClaseTeoria(Id_ClaseTeoriaPK),
    FOREIGN KEY (Id_ClaseTallerFK) REFERENCES tbClaseTaller(Id_ClaseTallerPK),
    FOREIGN KEY (Id_ClasePracticaFK) REFERENCES tbClasePractica(Id_ClasePracticaPK)
);




