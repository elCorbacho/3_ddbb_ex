-- //ARCHIVO ENTREGADO A CARGAR //ARCHIVO ENTREGADO A CARGAR //ARCHIVO ENTREGADO A CARGAR //ARCHIVO ENTREGADO A CARGAR
-- //ARCHIVO ENTREGADO A CARGAR //ARCHIVO ENTREGADO A CARGAR //ARCHIVO ENTREGADO A CARGAR //ARCHIVO ENTREGADO A CARGAR

-- Creación de la tabla 'clientes'
CREATE TABLE clientes (
    id_cliente NUMBER PRIMARY KEY,
    apellido_paterno VARCHAR2(50),
    nombre VARCHAR2(50),
    estado_civil VARCHAR2(20),
    renta NUMBER
);

-- Creación de la tabla 'propiedades'
CREATE TABLE propiedades (
    id_propiedad NUMBER PRIMARY KEY,
    direccion VARCHAR2(100),
    tipo VARCHAR2(20),
    precio_arriendo NUMBER,
    id_cliente NUMBER,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);

-- Creación de la tabla 'inmobiliarias'
CREATE TABLE inmobiliarias (
    id_inmobiliaria NUMBER PRIMARY KEY,
    nombre VARCHAR2(100),
    contacto VARCHAR2(100)
);

-- Creación de la tabla 'convenios'
CREATE TABLE convenios (
    id_convenio NUMBER PRIMARY KEY,
    id_inmobiliaria NUMBER,
    fecha_inicio DATE,
    fecha_fin DATE,
    FOREIGN KEY (id_inmobiliaria) REFERENCES inmobiliarias(id_inmobiliaria)
);

-- Inserción de datos en la tabla 'clientes'
INSERT INTO clientes (id_cliente, apellido_paterno, nombre, estado_civil, renta) VALUES (1, 'Garcia', 'Juan', 'Soltero', 750000);
INSERT INTO clientes (id_cliente, apellido_paterno, nombre, estado_civil, renta) VALUES (2, 'Lopez', 'Ana', 'Divorciada', 850000);
INSERT INTO clientes (id_cliente, apellido_paterno, nombre, estado_civil, renta) VALUES (3, 'Martinez', 'Pedro', 'Separado', 900000);
INSERT INTO clientes (id_cliente, apellido_paterno, nombre, estado_civil, renta) VALUES (4, 'Rodriguez', 'Luis', 'Soltero', 600000);
INSERT INTO clientes (id_cliente, apellido_paterno, nombre, estado_civil, renta) VALUES (5, 'Sanchez', 'Maria', 'Divorciada', 820000);

-- Inserción de datos en la tabla 'propiedades'
INSERT INTO propiedades (id_propiedad, direccion, tipo, precio_arriendo, id_cliente) VALUES (1, 'Av. Siempre Viva 742', 'Departamento', 500000, 1);
INSERT INTO propiedades (id_propiedad, direccion, tipo, precio_arriendo, id_cliente) VALUES (2, 'Calle Falsa 123', 'Loft', 600000, 2);
INSERT INTO propiedades (id_propiedad, direccion, tipo, precio_arriendo, id_cliente) VALUES (3, 'Av. Las Flores 321', 'Departamento', 700000, 3);
INSERT INTO propiedades (id_propiedad, direccion, tipo, precio_arriendo, id_cliente) VALUES (4, 'Pasaje Los Cedros 456', 'Loft', 400000, 4);
INSERT INTO propiedades (id_propiedad, direccion, tipo, precio_arriendo, id_cliente) VALUES (5, 'Calle La Paz', 'Departamento', 800000, 5); --se completa con texto de instrucciones de examen

-- //FIN ARCHIVO ENTREGADO PARA  CARGAR //FIN ARCHIVO ENTREGADO PARA  CARGAR //FIN ARCHIVO ENTREGADO PARA  CARGAR //FIN ARCHIVO ENTREGADO PARA  CARGAR 
-- //FIN ARCHIVO ENTREGADO PARA  CARGAR //FIN ARCHIVO ENTREGADO PARA  CARGAR //FIN ARCHIVO ENTREGADO PARA  CARGAR //FIN ARCHIVO ENTREGADO PARA  CARGAR 



--  INSERCION DE DATOS PARA TABLA INMOBILIARIA
insert into inmobiliarias (id_inmobiliaria, nombre, contacto ) values (1, 'UN SUEÑO', 'contacto@unsueno.com');
insert into inmobiliarias (id_inmobiliaria, nombre, contacto ) values (2, 'HOGAR IDEAL', 'contacto@hogarideal.com');


-- INSERCIO DE DATOS DE CONVENIOS
insert into convenios (id_convenio, id_inmobiliaria, fecha_inicio, fecha_fin) values (1, 1, TO_DATE('2023-01-01', 'YYYY-MM-DD'), TO_DATE('2024-01-01', 'YYYY-MM-DD'));
insert into convenios (id_convenio, id_inmobiliaria, fecha_inicio, fecha_fin) values (2, 2, TO_DATE('2023-06-01', 'YYYY-MM-DD'), TO_DATE('2024-06-01', 'YYYY-MM-DD'));
insert into convenios (id_convenio, id_inmobiliaria, fecha_inicio, fecha_fin) values (3, 1, TO_DATE('2022-06-01', 'YYYY-MM-DD'), TO_DATE('2024-06-01', 'YYYY-MM-DD'));
insert into convenios (id_convenio, id_inmobiliaria, fecha_inicio, fecha_fin) values (4, 2, TO_DATE('2023-08-02', 'YYYY-MM-DD'), TO_DATE('2027-11-20', 'YYYY-MM-DD'));
insert into convenios (id_convenio, id_inmobiliaria, fecha_inicio, fecha_fin) values (5, 1, TO_DATE('2021-09-28', 'YYYY-MM-DD'), TO_DATE('2025-07-01', 'YYYY-MM-DD'));
insert into convenios (id_convenio, id_inmobiliaria, fecha_inicio, fecha_fin) values (6, 2, TO_DATE('2021-03-20', 'YYYY-MM-DD'), TO_DATE('2029-03-01', 'YYYY-MM-DD'));

--9.1 SELECT DE CLIENTES SOLTEROS, SEPARADOS, DIVORCIADOS ORDENADOS ALFABETICAMENTE POR APELLIDO PATERNO Y NOMBRE

select 
    apellido_paterno as "Apellido paterno",
    nombre as "nombre cliente"
from clientes 
where estado_civil in ('Soltero', 'Separado', 'Divorciada') 
 order by apellido_paterno asc, nombre asc;

--9.2 Obtener todos los clientes separados y divorciados con una renta mayor o igual a $800,000,
--ordenados alfabéticamente por apellido paterno y nombre.

select 
    apellido_paterno as "Apellido paterno",
    nombre as "Nombre",
    estado_civil as "Estado civil",
    renta as "Renta"
from clientes 
where estado_civil in ('Separado', 'Divorciada') and renta >= 800000
order by apellido_paterno asc, nombre asc;


-- 9.3 Crear una vista que contenga la información de los clientes que cumplen con los criterios 
--de la nueva estrategia de marketing (separados y divorciados con una renta mayor o igual a $800,000)

create VIEW estrategia_marketing as 
        select 
            apellido_paterno as "Apellido paterno",
            nombre as "Nombre",
            estado_civil as "Estado civil",
            renta as "Renta"
        from clientes 
        where estado_civil in ('Separado', 'Divorciada') and renta >= 800000
        order by apellido_paterno asc, nombre asc;

-- 9.4 Consultar la vista creada para verificar la información.

drop VIEW estrategia_marketing

select * from estrategia_marketing

-- 9.5 Obtener la lista de propiedades junto con la información del cliente asociado, ordenadas por tipo de propiedad y dirección.

select 
    propiedades.id_propiedad as "id propiedad", 
    propiedades.direccion as "direccion propiedad", 
    propiedades.tipo as "tipo de propiedad",
    clientes.id_cliente as "id cliente asociado", 
    clientes.nombre ||' '|| clientes.apellido_paterno as "Nombre Cliente asociado",
    clientes.estado_civil as "estado civil cliente",
    clientes.renta as "renta cliente"
from propiedades 
INNER JOIN clientes ON clientes.id_cliente = propiedades.id_cliente 
order by tipo asc, direccion asc
    
-- 9.6 Obtener la lista de convenios vigentes con sus respectivas inmobiliarias.
select 
    convenios.id_convenio as "nº convenio",
    convenios.fecha_inicio as "fecha inicio",
    convenios.fecha_fin as "fecha fin",
    inmobiliarias.id_inmobiliaria as "id inmobiliaria",
    inmobiliarias.nombre as "nombre inmobiliaria",
    inmobiliarias.contacto as "contacto de inmobiliaria"
from convenios
inner join inmobiliarias on inmobiliarias.id_inmobiliaria = convenios.id_inmobiliaria
where sysdate < convenios.fecha_fin


---
---
---



