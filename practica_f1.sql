/* *****************************************************
  INSTITUT TIC de Barcelona
    CFGS: DAM 1A
    Mòdul: 0484 Bases de dades. 
    AUTORS: 
    - Estefanía Rubiano
    - Abigail Cáceres
    DATA: 19/12/2024
****************************************************** */

-- Creació de les taules

--Borrar las tablas anteriores 
drop table if exists COMPANYIA;
drop table if exists AVIO;
drop table if exists AEROPORT;
drop table if exists MOSTRADOR;
drop table if exists PERSONAL;
drop table if exists HOSTESSA;
drop table if exists PILOT;
drop table if exists PASSATGER;
drop table if exists VOL;
drop table if exists VOLAR;

create table COMPANYIA (
  nom varchar(40) NOT NULL,
  IATA varchar(6) NOT NULL,
  CODE3 varchar(6) NULL, 
  ICAO varchar(6) NULL,
  pais varchar(40) NOT NULL,
  filial_de varchar(40) NULL
);
create table PERSONAL (
  num_empleat integer NOT NULL,
  nom varchar(25) NOT NULL,
  cognom varchar(35) NOT NULL,
  passaport varchar(20) NOT NULL,
  sou float NOT NULL
);
create table HOSTESSA (
  num_empleat integer NOT NULL
);
create table PILOT (
  num_empleat integer NOT NULL,
  hores_vol integer NULL
);
create table AVIO (
  num_serie varchar(30) NOT NULL,
  tipus varchar(10) NOT NULL,
  fabricant varchar(20) NOT NULL,
  any_fabricacio year(4) NULL,
  companyia varchar(40) NOT NULL
);
create table PASSATGER (
  passaport varchar(20) NOT NULL,
  nom varchar(30) NOT NULL,
  cognom varchar(50) NULL,
  adreca varchar(70) NULL,
  telefon varchar(9) NULL,
  email varchar(40) NULL,
  data_naix date NULL,
  genere char(1) NULL
);
create table AEROPORT (
  codi varchar(4) NOT NULL,
  pais varchar(40) NOT NULL,
  ciutat varchar(40) NOT NULL,
  IATA varchar(4) NULL,
  nom varchar(55) NULL,
  any_construccio year(4) NULL
);
create table MOSTRADOR (
  numero integer NOT NULL,
  codi_aeroport varchar(4) NOT NULL
);
create table VOL (
  codi varchar(9) NOT NULL,
  aeroport_desti varchar(4) NOT NULL,
  data date NOT NULL,
  durada integer NOT NULL,
  aeroport_origen varchar(4) NOT NULL,
  avio varchar(30) NOT NULL,
  hostessa integer NULL,
  pilot integer NULL,
  descripcio text NULL
);
create table VOLAR (
  passatger varchar(20) NOT NULL,
  vol varchar(9) NOT NULL,
  seient varchar(5) NULL
)
