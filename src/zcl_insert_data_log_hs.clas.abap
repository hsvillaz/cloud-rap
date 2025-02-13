CLASS zcl_insert_data_log_hs DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.


CLASS zcl_insert_data_log_hs IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA: lt_travel  TYPE TABLE OF ztravel_log_hs,
          lt_booking TYPE TABLE OF zbooking_log_hs,
          lt_suppl   TYPE TABLE OF zbooksuppl_log_h.

    FREE: lt_travel,lt_booking,lt_suppl.

    SELECT client,travel_id,agency_id,customer_id,begin_date,end_date,booking_fee,
           total_price,currency_code,description,status AS overall_status,createdby AS created_by,
           createdat AS created_at,lastchangedby AS last_changed_by,lastchangedat AS last_changed_at
     FROM /dmo/travel
     ORDER BY travel_id
     INTO TABLE @lt_travel
     UP TO 50 ROWS.

    out->write( |Travel data: { lines( lt_travel ) }| ).

    SELECT *
    FROM /dmo/booking
    FOR ALL ENTRIES IN @lt_travel
    WHERE travel_id = @lt_travel-travel_id
    ORDER BY PRIMARY KEY
    INTO CORRESPONDING FIELDS OF TABLE @lt_booking.

    out->write( |Booking data: { lines( lt_booking ) }| ).

    SELECT DISTINCT *
    FROM /dmo/book_suppl
    FOR ALL ENTRIES IN @lt_booking
    WHERE travel_id = @lt_booking-travel_id
      AND booking_id = @lt_booking-booking_id
    ORDER BY PRIMARY KEY
    INTO CORRESPONDING FIELDS OF TABLE @lt_suppl.

    out->write( |Supply data: { lines( lt_suppl ) }| ).

    DELETE FROM: ztravel_log_hs,
                 zbooking_log_hs,
                 zbooksuppl_log_h.

    COMMIT WORK AND WAIT.

    INSERT ztravel_log_hs   FROM TABLE @lt_travel.
    INSERT zbooking_log_hs  FROM TABLE @lt_booking.
    INSERT zbooksuppl_log_h FROM TABLE @lt_suppl.

    COMMIT WORK AND WAIT.

    out->write( 'Data loading successfully DONE' ).

  ENDMETHOD.
ENDCLASS.
