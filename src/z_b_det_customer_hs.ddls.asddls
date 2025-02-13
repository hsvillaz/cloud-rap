@AbapCatalog.sqlViewName: 'ZV_DET_CUST_HS'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Details Customers'
//@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define view Z_B_DET_CUSTOMER_HS
  as select from zrent_clients_hs
//  as select from zrent_cust_hs
{
  key doc_id    as Id,
  key matricula as Matricula,
      nombres   as Nombre,
      apellidos as Apellidos,
      email     as Email,
      cntr_type as TipoContrato    
}
