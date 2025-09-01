CLASS zcl_data_fill DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_data_fill IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
   INSERT zdt_bds_agency FROM ( SELECT * FROM /dmo/agency ).

    INSERT zdt_bds_bksuppl FROM ( SELECT * FROM /dmo/book_suppl ).

    INSERT zdt_bds_travel FROM ( SELECT * FROM /dmo/travel ).

    INSERT zdt_bds_customer FROM ( SELECT * FROM /dmo/customer ).

    INSERT zdt_bds_booking FROM ( SELECT * FROM /dmo/booking ).
    COMMIT WORK.
  ENDMETHOD.
ENDCLASS.
