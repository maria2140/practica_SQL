select c.id_coche as "Coche",
mo.modelo as "Modelo",
m.marca as "Marca",
g.grupo_marca as "Grupo de la marca",
c.fecha_compra as "Fecha de compra",
c.matricula as "Matrícula",
c2.color as "Color",
c.total_km as "Kilómetros totales",
a.aseguradora as "Aseguradora",
c.num_poliza as "Número de póliza"

from modelado_maria_ojie.coches c 

inner join modelado_maria_ojie.modelos mo on c.id_modelo = mo.id_modelo
inner join modelado_maria_ojie.marcas m on c.id_marca = m.id_marca
inner join modelado_maria_ojie.grupomarca g on c.id_grupo_marca = g.id_grupo_marca
inner join modelado_maria_ojie.colores c2 on c.id_color = c2.id_color
inner join modelado_maria_ojie.aseguradoras a on c.id_aseguradora = a.id_aseguradora
