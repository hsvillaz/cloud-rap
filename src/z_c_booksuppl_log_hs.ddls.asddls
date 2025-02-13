@EndUserText.label: 'Consumption Booking Supplement'
@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true
define view entity z_c_booksuppl_log_hs
  as projection on Z_I_BOOKSUPPL_LOG_HS
{
  key travel_id                   as TravelID,
  key booking_id                  as BookingID,
  key booking_supplement_id       as BookingSupplementID,
      supplement_id               as SupplementID,
      _SupplementText.Description as SupplementDescription : localized,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      price                       as Price,
      @Semantics.currencyCode: true
      currency_code               as CurrencyCode,
      last_changed_at             as LastChangedAt,

      /* Associations */
      _Travel  : redirected to Z_C_TRAVEL_LOG_HS,
      _Booking : redirected to parent z_c_booking_log_hs,
      _Product,
      _SupplementText
}
