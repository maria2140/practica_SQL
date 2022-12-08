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


from modelado_maria_ojie_fayos.coches c 



inner join modelado_maria_ojie_fayos.modelos mo on c.id_modelo = mo.id_modelo
inner join modelado_maria_ojie_fayos.marcas m on c.id_marca = m.id_marca
inner join modelado_maria_ojie_fayos.grupomarca g on c.id_grupo_marca = g.id_grupo_marca
inner join modelado_maria_ojie_fayos.colores c2 on c.id_color = c2.id_color
inner join modelado_maria_ojie_fayos.aseguradoras a on c.id_aseguradora = a.id_aseguradora
