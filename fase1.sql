/* *****************************************************
  INSTITUT TIC de Barcelona
    CFGS DAM1 A
    Mòdul: 0484 Bases de dades. 
    AUTORS: Brithany Silva i Alba Melendres
    DATA: 12/12/2024
****************************************************** */

-- Creació de les taules
drop table if exists Companyia;
drop table if exists Avio;
drop table if exists Aeroport;
drop table if exists Mostrador;
drop table if exists Personal;
drop table if exists Hostessa;
drop table if exists Pilot;
drop table if exists Passatger;
drop table if exists Vol;


create table Companyia (
    nom varchar (40) not null,
    IATA varchar (6) not null,
    CODE3 varchar (6) not null,
    ICAO varchar (6) not null,
    pais varchar (40) not null,
    filial_de varchar (40)
);

create table Avio (
    num_serie varchar (30) not null,
    tipus varchar (10)not null,
    fabricant varchar (20)not null,
    any_fabricacio year,
    companyia varchar (40) not null
);

create table Aeroport (
    codi varchar (4) not null,
    pais varchar (40) not null,
    ciutat varchar (40) not null,
    IATA varchar (4),
    nom varchar (55) not null,
    any_construccio year,
);

create table Mostrador (
    numero smallint unsigned,
    codi_aeroport varchar (4) not null
);

create table Personal (
    num_empleat int unsigned not null, 
    nom varchar (25) not null,
    cognom varchar (35) not null,
    passaport varchar (20) not null,
    sou float unsigned not null
);

create table Hostessa (
  num_empleat int unsigned not null,  
); 

create table Pilot (
  num_empleat int unsigned not null,
  hores_vol smallint
);

create table Passatger (
  passaport varchar(20) not null,
  nom varchar (30) not null,
  cognom varchar (50),
  email varchar (40),
  data_naixement date,
  genere char(1)
);

create table Vol (
  codi char(9) not null,
  aeroport_desti varchar (4) not null,
  data date not null,
  durada time not null,
  aeroport_origen varchar (4) not null,
  avio varchar (30) not null,
  hostessa int unsigned not null,  
  pilot int unsigned not null,
  descripcio varchar(100)
);