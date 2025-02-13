@AbapCatalog.sqlViewName: 'ZV_CARS_HS'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Cars'
//@Metadata.ignorePropagatedAnnotations: true
define view Z_B_CARS_HS
  as select from zrent_cars_hs
{
  key matricula    as Matricula,
      marca        as Marca,
      modelo       as Modelo,
      color        as Color,
      motor        as Motor,
      potencia     as Potencia,
      und_potencia as Unidad,
      combustible  as Combustible,
      consumo      as Consumo,
      fecha_fabr   as FechaFabricacion,
      puertas      as Puertas,
      precio       as Precio,
      moneda       as Moneda,
      alquilado    as Alquilado,
      alq_desde    as Desde,
      alq_hasta    as Hasta
}
