CLASS zmky_cell DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  methods ISLIVE
      RETURNING VALUE(r_result) type abap_bool.
  METHODS set_right
    IMPORTING
      lo_cell TYPE REF TO zmky_cell.
  METHODS set_left
    IMPORTING
      lo_cell TYPE REF TO zmky_cell.
  METHODS set_top
    IMPORTING
      lo_cell TYPE REF TO zmky_cell.
  METHODS set_bottom
    IMPORTING
      lo_cell TYPE REF TO zmky_cell.
  methods constructor importing iv_filled type abap_bool.
  methods GET_FILLED
      RETURNING VALUE(r_result) type abap_bool.


  PROTECTED SECTION.

  PRIVATE SECTION.
  data: leftc type ref to zmky_cell,
        rightc type ref to zmky_cell,
        topc type ref to zmky_cell,
        bottomc type ref to zmky_cell,
        filled type abap_bool.
    methods check_neighbour IMPORTING io_cell type ref to zmky_cell
                            RETURNING VALUE(r_result) type abap_bool.
    methods bool_to_i IMPORTING iv_bool type abap_bool
                      RETURNING VALUE(r_result) type i.
ENDCLASS.

CLASS zmky_cell IMPLEMENTATION.
  METHOD islive.
     data lv_count type i.

     lv_count = lv_count + bool_to_i( check_neighbour( leftc ) ).
     lv_count = lv_count + bool_to_i( check_neighbour( rightc ) ).
     lv_count = lv_count + bool_to_i( check_neighbour( bottomc ) ).
     lv_count = lv_count + bool_to_i( check_neighbour( topc ) ).

    if lv_count lt 2 or lv_count gt 3.
        r_result = abap_true.
     else.
        r_result = abap_false.
     endif.
  ENDMETHOD.

  METHOD get_filled.
    r_result = filled.
  ENDMETHOD.

  METHOD constructor.
    filled = iv_filled.
  ENDMETHOD.

  METHOD check_neighbour.
      if io_cell is not initial.
        r_result = io_cell->get_filled(  ).
      endif.
      r_result = abap_false.
  ENDMETHOD.

  METHOD bool_to_i.
    if iv_bool eq abap_true.
      r_result = 1.
    else.
      r_result = 0.
    endif.
  ENDMETHOD.

  METHOD set_right.
    leftc = lo_cell.
  ENDMETHOD.

  METHOD set_left.
    rightc = lo_cell.
  ENDMETHOD.

  METHOD set_bottom.
    bottomc = lo_cell.
  ENDMETHOD.

  METHOD set_top.
    topc = lo_cell.
  ENDMETHOD.

ENDCLASS.
