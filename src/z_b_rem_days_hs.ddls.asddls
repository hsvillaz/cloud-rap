@AbapCatalog.sqlViewName: 'ZV_REM_DAY_HS'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Remaining days'
//@Metadata.ignorePropagatedAnnotations: true
define view Z_B_REM_DAYS_HS
  as select from zrent_cars_hs
{
  key matricula as Matricula,
      marca     as Marca,
      case
        when alq_hasta <> ''
        then dats_days_between( cast( $session.system_date as abap.dats ), alq_hasta)
      end       as Dias
}
