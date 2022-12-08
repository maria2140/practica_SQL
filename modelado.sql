-- DDL --
-- crear esquema --
create schema modelado_maria_ojie_fayos authorization zprrluvm;


-- crear tablas --

-- tabla coches --

create table modelado_maria_ojie_fayos.coches(
id_coche integer NOT NULL, -- PK
id_color integer NOT NULL, -- FK -> colores
id_modelo integer NOT NULL, -- FK -> modelos
id_marca integer NOT NULL, -- FK -> marcas
id_grupo_marca integer NOT NULL, -- FK -> grupoMarca
id_aseguradora integer NOT NULL, -- FK -> aseguradoras 
matricula varchar(10) NOT NULL,
fecha_compra date NOT NULL,
total_km integer NOT NULL,
num_poliza integer NULL
);


alter table modelado_maria_ojie_fayos.coches
add constraint coche_pk primary key (id_coche);


-- tabla colores --

create table modelado_maria_ojie_fayos.colores(
id_color integer NOT NULL, -- PK
color varchar(20) NOT NULL
);

alter table modelado_maria_ojie_fayos.colores
add constraint color_pk primary key (id_color);


-- tabla modelos --
create table modelado_maria_ojie_fayos.modelos(
id_modelo integer NOT NULL, -- PK
id_marca integer NOT NULL, -- FK -> marcas 
modelo varchar(40) NOT NULL
);

alter table modelado_maria_ojie_fayos.modelos
add constraint modelo_pk primary key (id_modelo);

-- tabla marcas --
create table modelado_maria_ojie_fayos.marcas(
id_marca integer NOT NULL, -- PK
id_grupo_marca integer NOT NULL, -- FK -> grupoMarca
marca varchar(40) NOT NULL
);

alter table modelado_maria_ojie_fayos.marcas
add constraint grupo_marca_pk primary key (id_marca);

-- tabla grupoMarca --
create table modelado_maria_ojie_fayos.grupoMarca(
id_grupo_marca integer NOT NULL, -- PK
grupo_marca varchar(40) NOT NULL
);

alter table modelado_maria_ojie_fayos.grupoMarca
add constraint grupoMarca_pk primary key (id_grupo_marca);

-- tabla seguros --
create table modelado_maria_ojie_fayos.seguros(
id_seguro integer NOT NULL, -- PK
id_coche integer NOT NULL, -- FK -> coches
id_aseguradora integer NOT NULL -- FK -> aseguradoras 
);

alter table modelado_maria_ojie_fayos.seguros
add constraint seguros_pk primary key (id_seguro);

-- tabla aseguradoras--
create table modelado_maria_ojie_fayos.aseguradoras(
id_aseguradora integer NOT NULL, -- PK
aseguradora varchar(30) NOT NULL
);

alter table modelado_maria_ojie_fayos.aseguradoras
add constraint aseguradoras_pk primary key (id_aseguradora);


-- tabla monedas --
create table modelado_maria_ojie_fayos.monedas(
id_moneda varchar(20) NOT NULL, -- PK
moneda varchar(20) NOT NULL
);

alter table modelado_maria_ojie_fayos.monedas
add constraint monedas_pk primary key (id_moneda);


-- tabla revisiones -- 

create table modelado_maria_ojie_fayos.revisiones(
id_revision integer NOT NULL, -- PK
id_coche integer NOT NULL, -- FK -> coches
fecha_revision date NOT NULL,
kilometros integer NOT NULL,
precio integer NOT NULL,
id_moneda varchar(20) NOT NULL -- FK -> monedas 
);

alter table modelado_maria_ojie_fayos.revisiones
add constraint revisiones_coche_kf primary key (id_revision);

-- FK--

alter table modelado_maria_ojie_fayos.coches
add constraint color_coche_kf foreign key (id_color)
references modelado_maria_ojie_fayos.colores (id_color);

alter table modelado_maria_ojie_fayos.coches
add constraint modelo_coche_kf foreign key (id_modelo)
references modelado_maria_ojie_fayos.modelos (id_modelo);

alter table modelado_maria_ojie_fayos.coches
add constraint marca_coche_kf foreign key (id_marca)
references modelado_maria_ojie_fayos.marcas (id_marca);

alter table modelado_maria_ojie_fayos.coches
add constraint grupo_marca_coche_kf foreign key (id_grupo_marca)
references modelado_maria_ojie_fayos.grupoMarca (id_grupo_marca);

alter table modelado_maria_ojie_fayos.coches
add constraint aseguradora_coche_kf foreign key (id_aseguradora)
references modelado_maria_ojie_fayos.aseguradoras (id_aseguradora);

alter table modelado_maria_ojie_fayos.modelos
add constraint marca_modelo_kf foreign key (id_marca)
references modelado_maria_ojie_fayos.marcas (id_marca);

alter table modelado_maria_ojie_fayos.marcas
add constraint marca_modelo_kf foreign key (id_grupo_marca)
references modelado_maria_ojie_fayos.grupoMarca (id_grupo_marca);

alter table modelado_maria_ojie_fayos.seguros
add constraint coche foreign key (id_coche)
references modelado_maria_ojie_fayos.coches (id_coche);

alter table modelado_maria_ojie_fayos.seguros 
add constraint aseguradora foreign key (id_aseguradora)
references modelado_maria_ojie_fayos.aseguradoras (id_aseguradora);

alter table modelado_maria_ojie_fayos.revisiones
add constraint moneda_revision_pk foreign key (id_moneda)
references modelado_maria_ojie_fayos.monedas (id_moneda);

alter table modelado_maria_ojie_fayos.revisiones
add constraint coche foreign key (id_coche)
references modelado_maria_ojie_fayos.coches (id_coche);



-- DML --

--  monedas --

insert into modelado_maria_ojie_fayos.monedas 
(id_moneda, moneda)
values('001', 'euro');

insert into modelado_maria_ojie_fayos.monedas 
(id_moneda, moneda)
values('002', 'dolar');

insert into modelado_maria_ojie_fayos.monedas 
(id_moneda, moneda)
values('003', 'yen');

insert into modelado_maria_ojie_fayos.monedas 
(id_moneda, moneda)
values('004', 'pound');

--  colores --

insert into modelado_maria_ojie_fayos.colores  
(id_color, color)
values('001', 'Rojo');

insert into modelado_maria_ojie_fayos.colores  
(id_color, color)
values('002', 'Negro');


insert into modelado_maria_ojie_fayos.colores  
(id_color, color)
values('003', 'Gris');


insert into modelado_maria_ojie_fayos.colores  
(id_color, color)
values('004', 'Blanco');


insert into modelado_maria_ojie_fayos.colores  
(id_color, color)
values('005', 'Azul');



--  grupoMarca --

insert into modelado_maria_ojie_fayos.grupomarca  
(id_grupo_marca, grupo_marca)
values('001', 'PSA');

insert into modelado_maria_ojie_fayos.grupomarca 
(id_grupo_marca, grupo_marca)
values('002', 'FCA');

insert into modelado_maria_ojie_fayos.grupomarca 
(id_grupo_marca, grupo_marca)
values('003', 'BMW Group');

--  marcas --

insert into modelado_maria_ojie_fayos.marcas  
(id_marca, id_grupo_marca, marca)
values('001', '001', 'Citroën');

insert into modelado_maria_ojie_fayos.marcas  
(id_marca, id_grupo_marca, marca)
values('002', '001', 'Opel');

insert into modelado_maria_ojie_fayos.marcas  
(id_marca, id_grupo_marca, marca)
values('003', '002', 'Jeep');

insert into modelado_maria_ojie_fayos.marcas  
(id_marca, id_grupo_marca, marca)
values('004', '003', 'BMW');

insert into modelado_maria_ojie_fayos.marcas  
(id_marca, id_grupo_marca, marca)
values('005', '003', 'Mini');

--  modelos --
insert into modelado_maria_ojie_fayos.modelos  
(id_modelo, id_marca, modelo)
values('001', '001', 'C3');

insert into modelado_maria_ojie_fayos.modelos  
(id_modelo, id_marca, modelo)
values('002', '001', 'Spacetourer');

insert into modelado_maria_ojie_fayos.modelos  
(id_modelo, id_marca, modelo)
values('003', '002', 'Corsa');

insert into modelado_maria_ojie_fayos.modelos  
(id_modelo, id_marca, modelo)
values('004', '002', 'Mokka');

insert into modelado_maria_ojie_fayos.modelos  
(id_modelo, id_marca, modelo)
values('005', '003', 'Gladiator');

insert into modelado_maria_ojie_fayos.modelos  
(id_modelo, id_marca, modelo)
values('006', '003', 'Renegade');

insert into modelado_maria_ojie_fayos.modelos  
(id_modelo, id_marca, modelo)
values('007', '004', 'X5 M50i');

insert into modelado_maria_ojie_fayos.modelos  
(id_modelo, id_marca, modelo)
values('008', '004', 'X3 xDrive20d xLine');

insert into modelado_maria_ojie_fayos.modelos  
(id_modelo, id_marca, modelo)
values('009', '005', 'Clubman');

insert into modelado_maria_ojie_fayos.modelos  
(id_modelo, id_marca, modelo)
values('010', '005', 'Countryman');

--  aseguradoras --
insert into modelado_maria_ojie_fayos.aseguradoras  
(id_aseguradora, aseguradora)
values('001', 'Mapfre');

insert into modelado_maria_ojie_fayos.aseguradoras  
(id_aseguradora, aseguradora)
values('002', 'Allianz');

insert into modelado_maria_ojie_fayos.aseguradoras  
(id_aseguradora, aseguradora)
values('003', 'Generali');

-- coches --
insert into modelado_maria_ojie_fayos.coches 
(id_coche, id_color, id_modelo, id_marca, id_grupo_marca, id_aseguradora, matricula, fecha_compra, total_km, num_poliza)
values('001', '001', '001', '001', '001', '001', '7122BDK', '2018-01-11', '75498', '100000001');

insert into modelado_maria_ojie_fayos.coches 
(id_coche, id_color, id_modelo, id_marca, id_grupo_marca, id_aseguradora, matricula, fecha_compra, total_km, num_poliza)
values('002', '002', '001', '001', '001', '002', '4468FCM', '2015-12-09', '54223', '100000002');

insert into modelado_maria_ojie_fayos.coches 
(id_coche, id_color, id_modelo, id_marca, id_grupo_marca, id_aseguradora, matricula, fecha_compra, total_km, num_poliza)
values('003', '003', '002', '001', '001', '003', '3437HLF', '2016-12-22', '57529', '100000003');

insert into modelado_maria_ojie_fayos.coches 
(id_coche, id_color, id_modelo, id_marca, id_grupo_marca, id_aseguradora, matricula, fecha_compra, total_km, num_poliza)
values('004', '004', '002', '001', '001', '001', '2102FJM', '2018-03-10', '43761', '100000004');

insert into modelado_maria_ojie_fayos.coches 
(id_coche, id_color, id_modelo, id_marca, id_grupo_marca, id_aseguradora, matricula, fecha_compra, total_km, num_poliza)
values('005', '005', '003', '002', '001', '002', '0067GNJ', '2018-07-18', '40212', '100000005');

insert into modelado_maria_ojie_fayos.coches 
(id_coche, id_color, id_modelo, id_marca, id_grupo_marca, id_aseguradora, matricula, fecha_compra, total_km, num_poliza)
values('006', '001', '003', '002', '001', '003', '5022GGG', '2015-07-02', '77918', '100000006');

insert into modelado_maria_ojie_fayos.coches 
(id_coche, id_color, id_modelo, id_marca, id_grupo_marca, id_aseguradora, matricula, fecha_compra, total_km, num_poliza)
values('007', '002', '004', '002', '001', '001', '0425KCG', '2018-07-16', '56953', '100000007');

insert into modelado_maria_ojie_fayos.coches 
(id_coche, id_color, id_modelo, id_marca, id_grupo_marca, id_aseguradora, matricula, fecha_compra, total_km, num_poliza)
values('008', '003', '004', '002', '001', '002', '1934MNB', '2015-04-17', '43175', '100000008');

insert into modelado_maria_ojie_fayos.coches 
(id_coche, id_color, id_modelo, id_marca, id_grupo_marca, id_aseguradora, matricula, fecha_compra, total_km, num_poliza)
values('009', '004', '007', '004', '003', '003', '1892FHK', '2018-05-09', '58314', '100000009');

insert into modelado_maria_ojie_fayos.coches 
(id_coche, id_color, id_modelo, id_marca, id_grupo_marca, id_aseguradora, matricula, fecha_compra, total_km, num_poliza)
values('010', '005', '007', '004', '003', '001', '0654JGG', '2015-05-16', '62828', '100000010');

insert into modelado_maria_ojie_fayos.coches 
(id_coche, id_color, id_modelo, id_marca, id_grupo_marca, id_aseguradora, matricula, fecha_compra, total_km, num_poliza)
values('011', '001', '008', '004', '003', '002', '1562NJH', '2016-07-18', '53966', '100000011');

insert into modelado_maria_ojie_fayos.coches 
(id_coche, id_color, id_modelo, id_marca, id_grupo_marca, id_aseguradora, matricula, fecha_compra, total_km, num_poliza)
values('012', '002', '008', '004', '003', '003', '2346NKNO', '2018-01-29', '62913', '100000012');

insert into modelado_maria_ojie_fayos.coches 
(id_coche, id_color, id_modelo, id_marca, id_grupo_marca, id_aseguradora, matricula, fecha_compra, total_km, num_poliza)
values('013', '003', '009', '005', '003', '001', '3467NYU', '2018-11-07', '56151', '100000013');

insert into modelado_maria_ojie_fayos.coches 
(id_coche, id_color, id_modelo, id_marca, id_grupo_marca, id_aseguradora, matricula, fecha_compra, total_km, num_poliza)
values('014', '004', '009', '005', '003', '002', '8907VVV', '2017-04-07', '55310', '100000014');

insert into modelado_maria_ojie_fayos.coches 
(id_coche, id_color, id_modelo, id_marca, id_grupo_marca, id_aseguradora, matricula, fecha_compra, total_km, num_poliza)
values('015', '005', '010', '005', '003', '003', '3457BGY', '2015-07-15', '55944', '100000015');

insert into modelado_maria_ojie_fayos.coches 
(id_coche, id_color, id_modelo, id_marca, id_grupo_marca, id_aseguradora, matricula, fecha_compra, total_km, num_poliza)
values('016', '001', '010', '005', '003', '001', '1278NML', '2018-05-15', '53406', '100000016');

insert into modelado_maria_ojie_fayos.coches 
(id_coche, id_color, id_modelo, id_marca, id_grupo_marca, id_aseguradora, matricula, fecha_compra, total_km, num_poliza)
values('017', '002', '005', '003', '002', '002', '2246VBH', '2018-11-05', '74447', '100000017');

insert into modelado_maria_ojie_fayos.coches 
(id_coche, id_color, id_modelo, id_marca, id_grupo_marca, id_aseguradora, matricula, fecha_compra, total_km, num_poliza)
values('018', '003', '005', '003', '002', '003', '4567BGT', '2018-12-25', '50552', '100000018');

insert into modelado_maria_ojie_fayos.coches 
(id_coche, id_color, id_modelo, id_marca, id_grupo_marca, id_aseguradora, matricula, fecha_compra, total_km, num_poliza)
values('019', '004', '006', '003', '002', '001', '1458MKO', '2015-08-20', '59770', '100000019');

insert into modelado_maria_ojie_fayos.coches 
(id_coche, id_color, id_modelo, id_marca, id_grupo_marca, id_aseguradora, matricula, fecha_compra, total_km, num_poliza)
values('020', '005', '006', '003', '002', '002', '7789RFT', '2016-08-31', '78456', '100000020');



-- seguros --

insert into modelado_maria_ojie_fayos.seguros  
(id_seguro, id_coche, id_aseguradora)
values('001', '001', '001'); 

insert into modelado_maria_ojie_fayos.seguros  
(id_seguro, id_coche, id_aseguradora)
values('002', '002', '002');

insert into modelado_maria_ojie_fayos.seguros  
(id_seguro, id_coche, id_aseguradora)
values('003', '003', '003');

insert into modelado_maria_ojie_fayos.seguros  
(id_seguro, id_coche, id_aseguradora)
values('004', '004', '001');

insert into modelado_maria_ojie_fayos.seguros  
(id_seguro, id_coche, id_aseguradora)
values('005', '005', '002');

insert into modelado_maria_ojie_fayos.seguros  
(id_seguro, id_coche, id_aseguradora)
values('006', '006', '003');

insert into modelado_maria_ojie_fayos.seguros  
(id_seguro, id_coche, id_aseguradora)
values('007', '007', '001');

insert into modelado_maria_ojie_fayos.seguros  
(id_seguro, id_coche, id_aseguradora)
values('008', '008', '002');

insert into modelado_maria_ojie_fayos.seguros  
(id_seguro, id_coche, id_aseguradora)
values('009', '009', '003');

insert into modelado_maria_ojie_fayos.seguros  
(id_seguro, id_coche, id_aseguradora)
values('010', '010', '001');

insert into modelado_maria_ojie_fayos.seguros  
(id_seguro, id_coche, id_aseguradora)
values('011', '011', '002');

insert into modelado_maria_ojie_fayos.seguros  
(id_seguro, id_coche, id_aseguradora)
values('012', '012', '003');

insert into modelado_maria_ojie_fayos.seguros  
(id_seguro, id_coche, id_aseguradora)
values('013', '013', '001');

insert into modelado_maria_ojie_fayos.seguros  
(id_seguro, id_coche, id_aseguradora)
values('014', '014', '002');

insert into modelado_maria_ojie_fayos.seguros  
(id_seguro, id_coche, id_aseguradora)
values('015', '015', '003');

insert into modelado_maria_ojie_fayos.seguros  
(id_seguro, id_coche, id_aseguradora)
values('016', '016', '001');

insert into modelado_maria_ojie_fayos.seguros  
(id_seguro, id_coche, id_aseguradora)
values('017', '017', '002');

insert into modelado_maria_ojie_fayos.seguros  
(id_seguro, id_coche, id_aseguradora)
values('018', '018', '003');

insert into modelado_maria_ojie_fayos.seguros  
(id_seguro, id_coche, id_aseguradora)
values('019', '019', '001');

insert into modelado_maria_ojie_fayos.seguros  
(id_seguro, id_coche, id_aseguradora)
values('020', '020', '002');

-- revisiones -- 

insert into modelado_maria_ojie_fayos.revisiones  
(id_revision, id_coche, id_moneda, fecha_revision, kilometros, precio)
values('001', '001', '001', '2019-2-1', '39916', '200');

insert into modelado_maria_ojie_fayos.revisiones  
(id_revision, id_coche, id_moneda, fecha_revision, kilometros, precio)
values('002', '001', '002', '2021-4-12', '74490', '500');

insert into modelado_maria_ojie_fayos.revisiones  
(id_revision, id_coche, id_moneda, fecha_revision, kilometros, precio)
values('003', '002', '003', '2019-3-15', '28031', '250');

insert into modelado_maria_ojie_fayos.revisiones  
(id_revision, id_coche, id_moneda, fecha_revision, kilometros, precio)
values('004', '002', '004', '2021-5-19', '78238', '300');

insert into modelado_maria_ojie_fayos.revisiones  
(id_revision, id_coche, id_moneda, fecha_revision, kilometros, precio)
values('005', '003', '001', '2019-5-12', '24512', '360');

insert into modelado_maria_ojie_fayos.revisiones  
(id_revision, id_coche, id_moneda, fecha_revision, kilometros, precio)
values('006', '003', '002', '2021-3-6', '84095', '400');

insert into modelado_maria_ojie_fayos.revisiones  
(id_revision, id_coche, id_moneda, fecha_revision, kilometros, precio)
values('007', '004', '003', '2019-8-20', '29733', '200');

insert into modelado_maria_ojie_fayos.revisiones  
(id_revision, id_coche, id_moneda, fecha_revision, kilometros, precio)
values('008', '004', '004', '2021-5-21', '63584', '500');

insert into modelado_maria_ojie_fayos.revisiones  
(id_revision, id_coche, id_moneda, fecha_revision, kilometros, precio)
values('009', '005', '001', '2019-2-14', '23353', '100');

insert into modelado_maria_ojie_fayos.revisiones  
(id_revision, id_coche, id_moneda, fecha_revision, kilometros, precio)
values('010', '005', '002', '2021-6-30', '77098', '500');

insert into modelado_maria_ojie_fayos.revisiones  
(id_revision, id_coche, id_moneda, fecha_revision, kilometros, precio)
values('011', '006', '003', '2019-12-1', '31542', '300');

insert into modelado_maria_ojie_fayos.revisiones  
(id_revision, id_coche, id_moneda, fecha_revision, kilometros, precio)
values('012', '006', '004', '2021-4-7', '87100', '200');

insert into modelado_maria_ojie_fayos.revisiones  
(id_revision, id_coche, id_moneda, fecha_revision, kilometros, precio)
values('013', '007', '001', '2019-9-12', '29203', '150');

insert into modelado_maria_ojie_fayos.revisiones  
(id_revision, id_coche, id_moneda, fecha_revision, kilometros, precio)
values('014', '007', '002', '2021-8-2', '50079', '300');

insert into modelado_maria_ojie_fayos.revisiones  
(id_revision, id_coche, id_moneda, fecha_revision, kilometros, precio)
values('015', '008', '003', '2019-4-15', '39377', '400');

insert into modelado_maria_ojie_fayos.revisiones  
(id_revision, id_coche, id_moneda, fecha_revision, kilometros, precio)
values('016', '008', '004', '2021-5-4', '64572', '600');

insert into modelado_maria_ojie_fayos.revisiones  
(id_revision, id_coche, id_moneda, fecha_revision, kilometros, precio)
values('017', '009', '001', '2019-6-21', '44846', '800');

insert into modelado_maria_ojie_fayos.revisiones  
(id_revision, id_coche, id_moneda, fecha_revision, kilometros, precio)
values('018', '009', '002', '2021-7-21', '84164', '300');

insert into modelado_maria_ojie_fayos.revisiones  
(id_revision, id_coche, id_moneda, fecha_revision, kilometros, precio)
values('019', '010', '003', '2019-2-16', '32265', '200');

insert into modelado_maria_ojie_fayos.revisiones  
(id_revision, id_coche, id_moneda, fecha_revision, kilometros, precio)
values('020', '010', '004', '2021-12-5', '53510', '350');

insert into modelado_maria_ojie_fayos.revisiones  
(id_revision, id_coche, id_moneda, fecha_revision, kilometros, precio)
values('021', '011', '001', '2019-7-13', '32001', '280');

insert into modelado_maria_ojie_fayos.revisiones  
(id_revision, id_coche, id_moneda, fecha_revision, kilometros, precio)
values('022', '011', '002', '2021-8-3', '62295', '400');

insert into modelado_maria_ojie_fayos.revisiones  
(id_revision, id_coche, id_moneda, fecha_revision, kilometros, precio)
values('023', '012', '003', '2019-11-4', '47269', '150');

insert into modelado_maria_ojie_fayos.revisiones  
(id_revision, id_coche, id_moneda, fecha_revision, kilometros, precio)
values('024', '012', '004', '2021-9-21', '70381', '200');

insert into modelado_maria_ojie_fayos.revisiones  
(id_revision, id_coche, id_moneda, fecha_revision, kilometros, precio)
values('025', '013', '001', '2019-4-6', '46172', '400');

insert into modelado_maria_ojie_fayos.revisiones  
(id_revision, id_coche, id_moneda, fecha_revision, kilometros, precio)
values('026', '013', '002', '2021-5-2', '84868', '300');

insert into modelado_maria_ojie_fayos.revisiones  
(id_revision, id_coche, id_moneda, fecha_revision, kilometros, precio)
values('027', '014', '003', '2019-5-29', '26891', '250');

insert into modelado_maria_ojie_fayos.revisiones  
(id_revision, id_coche, id_moneda, fecha_revision, kilometros, precio)
values('028', '014', '004', '2021-9-25', '67354', '450');

insert into modelado_maria_ojie_fayos.revisiones  
(id_revision, id_coche, id_moneda, fecha_revision, kilometros, precio)
values('029', '015', '001', '2019-4-19', '20199', '640');

insert into modelado_maria_ojie_fayos.revisiones  
(id_revision, id_coche, id_moneda, fecha_revision, kilometros, precio)
values('030', '015', '002', '2021-5-29', '53857', '100');

insert into modelado_maria_ojie_fayos.revisiones  
(id_revision, id_coche, id_moneda, fecha_revision, kilometros, precio)
values('031', '016', '003', '2019-6-21', '34730', '450');

insert into modelado_maria_ojie_fayos.revisiones  
(id_revision, id_coche, id_moneda, fecha_revision, kilometros, precio)
values('032', '016', '004', '2021-9-4', '81131', '300');

insert into modelado_maria_ojie_fayos.revisiones  
(id_revision, id_coche, id_moneda, fecha_revision, kilometros, precio)
values('033', '017', '001', '2019-6-10', '29652', '400');

insert into modelado_maria_ojie_fayos.revisiones  
(id_revision, id_coche, id_moneda, fecha_revision, kilometros, precio)
values('034', '017', '002', '2021-1-20', '84092', '460');

insert into modelado_maria_ojie_fayos.revisiones  
(id_revision, id_coche, id_moneda, fecha_revision, kilometros, precio)
values('035', '018', '003', '2019-3-16', '44765', '500');

insert into modelado_maria_ojie_fayos.revisiones  
(id_revision, id_coche, id_moneda, fecha_revision, kilometros, precio)
values('036', '018', '004', '2021-6-16', '63977', '100');

insert into modelado_maria_ojie_fayos.revisiones  
(id_revision, id_coche, id_moneda, fecha_revision, kilometros, precio)
values('037', '019', '001', '2019-9-30', '47811', '200');

insert into modelado_maria_ojie_fayos.revisiones  
(id_revision, id_coche, id_moneda, fecha_revision, kilometros, precio)
values('038', '019', '002', '2021-4-21', '69637', '350');

insert into modelado_maria_ojie_fayos.revisiones  
(id_revision, id_coche, id_moneda, fecha_revision, kilometros, precio)
values('039', '020', '003', '2019-12-2', '47922', '400');

insert into modelado_maria_ojie_fayos.revisiones  
(id_revision, id_coche, id_moneda, fecha_revision, kilometros, precio)
values('040', '020', '004', '2021-5-6', '79402', '500');

