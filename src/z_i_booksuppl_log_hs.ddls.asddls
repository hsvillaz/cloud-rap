@AbapCatalog.sqlViewName: 'ZVBSPLL_LOG_HS'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS Interface - Booking Supplement'
//@Metadata.ignorePropagatedAnnotations: true
define view Z_I_BOOKSUPPL_LOG_HS
  as select from zbooksuppl_log_h as BookingSupplement
  association        to parent Z_I_BOOKING_LOG_HS as _Booking        on  $projection.travel_id  = _Booking.travel_id
                                                                     and $projection.booking_id = _Booking.booking_id
  association [1..1] to Z_I_TRAVEL_LOG_HS         as _Travel         on  $projection.travel_id = _Travel.travel_id
  association [1..1] to /DMO/I_Supplement         as _Product        on  $projection.supplement_id = _Product.SupplementID
  association [1..*] to /DMO/I_SupplementText     as _SupplementText on  $projection.supplement_id = _SupplementText.SupplementID
{
  key travel_id,
  key booking_id,
  key booking_supplement_id,
      supplement_id,
      @Semantics.amount.currencyCode : 'currency_code'
      price,
      @Semantics.currencyCode: true
      currency_code,
      @Semantics.systemDateTime.lastChangedAt: true
      last_changed_at,

      /* Association to Parent */
      _Booking,

      /* Associations */
      _Travel,
      _Product,
      _SupplementText
}
