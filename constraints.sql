/* *****************************************************
  INSTITUT TIC de Barcelona
    CFGS Desenvolupament d'Aplicacions Web 
    Mòdul: 0484 Bases de dades. 
    AUTORES: Brithany Silva i Alba Melendres
    DATA: 9 de Gener 2025
****************************************************** */

-- Claus primaries
alter table companyia
add constraint pk_companyia primary key (nom);

alter table personal 
add constraint pk_personal primary key (num_empleat);

alter table hostessa
add constraint pk_hostessa primary key (num_empleat); 

alter table pilot
add constraint pk_pilot primary key (num_empleat);

alter table avio
add constraint pk_avio primary key (num_serie);

alter table passatger
add constraint pk_passatger primary key (passaport);

alter table aeroport
add constraint pk_aeroport primary key (codi);

alter table Mostrador
add constraint pk_mostrador primary key (numero,codi_aeroport);

alter table vol
add constraint pk_vol primary key (codi);

alter table volar
add constraint pk_volar1 primary key (passatger, vol);

-- Clau foranea
-- Companyia
alter table companyia
add constraint fk_companyia foreign key(filial_de)
references companyia (nom); 

-- hostessa
alter table hostessa
add constraint fk_hostessa foreign key(num_empleat)
references personal (num_empleat);

--  pilot
alter table pilot
add constraint fk_pilot foreign key(num_empleat)
references personal (num_empleat);

-- avio
alter table avio
add constraint fk_avio foreign key(companyia)
references companyia (nom); 

-- Mostrador
alter table Mostrador
add constraint fk_mostrador foreign key(codi_aeroport)
references aeroport (codi);

-- Vol
alter table vol
add constraint fk_vol1 foreign key(aeroport_origen)
references aeroport (codi);

alter table vol
add constraint fk_vol2 foreign key(aeroport_desti)
references aeroport (codi);

alter table vol
add constraint fk_vol3 foreign key(avio)
references avio (num_serie);

alter table vol
add constraint fk_vol4 foreign key(hostessa)
references hostessa (num_empleat);

alter table vol
add constraint fk_vol5 foreign key(pilot)
references pilot (num_empleat);

-- Volar
alter table volar
add constraint fk_volar1 foreign key(passatger)
references passatger (passaport);

alter table volar
add constraint fk_volar2 foreign key(vol)
references vol (codi);

-- Restriccions textuals

-- El seient és un número entre 1 i 200.
alter table volar
add constraint ch_seient check (seient >= 1 and seient <= 200);

-- El número de passaport del personal no es pot repetir.
alter table personal
add constraint u_personal unique (passaport);

-- El tipus d’avió pot valer només COM-PAS, JET, o CARGO.
alter table avio
add constraint ch_avio check (tipus='COM-PAS' or tipus='JET' or tipus='CARGO');

-- La descripció del vol pot valer només ON-TIME, DELAYED, o UNKNOWN
alter table vol
add constraint ch_vol check (descripcio='ON-TIME' or descripcio='DELAYED' or descripcio='UNKNOWN');

-- Per ser pilot s’han de tenir com a mínim 400 hores de vol.
alter table pilot
add constraint ch_hores_Vol check (hores_Vol >= 400);

-- En un vol un seient no pot estar ocupat per més d’una persona.
alter table volar
add constraint u_volar unique (seient);

-- La durada dels vols ha de ser un valor entre 10 i 1200 (és a dir, entre 10 minuts i 20 hores)
alter table vol
add constraint ch_durada check (durada >= 10 and durada <= 1200);

-- El sou no pot ser negatiu. A més el sou mínim ha de ser de 20.000 dolars.
alter table personal
add constraint ch_sou check (sou >= 20000);

-- El codi IATA dels aeroports no es pot repetir.
alter table aeroport
add constraint u_IATA unique (IATA);