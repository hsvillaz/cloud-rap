@AbapCatalog.sqlViewName: 'ZV_BRANDS_HS'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Brands'
//@Metadata.ignorePropagatedAnnotations: true
define view Z_B_BRANDS_HS
  as select from zrent_brands_hs
{
  key marca as Marca,
      @UI.hidden: true
      url   as Imagen
}
