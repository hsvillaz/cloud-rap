@AbapCatalog.sqlViewName: 'ZVBOOK_LOG_HS'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interfase - Booking'
//@Metadata.ignorePropagatedAnnotations: true
define view Z_I_BOOKING_LOG_HS
  as select from zbooking_log_hs as Booking
  composition [0..*] of Z_I_BOOKSUPPL_LOG_HS as _BookingSupplement
  association        to parent Z_I_TRAVEL_LOG_HS    as _Travel on $projection.travel_id = _Travel.travel_id
  association [1..1] to /DMO/I_Customer      as _Customer      on $projection.customer_id = _Customer.CustomerID
  association [1..1] to /DMO/I_Carrier       as _Carrier       on $projection.carrier_id = _Carrier.AirlineID
  association [1..*] to /DMO/I_Connection    as _Connection    on $projection.connection_id = _Connection.ConnectionID
{
  key travel_id,
  key booking_id,
      booking_date,
      customer_id,
      carrier_id,
      connection_id,
      flight_date,
      @Semantics.amount.currencyCode: 'currency_code'
      flight_price,
      @Semantics.currencyCode: true
      currency_code,
      booking_status,
      last_changed_at,

      /* Association to Parent */
      _Travel,

      /* Composition */
      _BookingSupplement,

      /* Associations */
      _Customer,
      _Carrier,
      _Connection
}
