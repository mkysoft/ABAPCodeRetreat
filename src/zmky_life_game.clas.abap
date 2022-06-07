CLASS zmky_life_game DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    types: BEGIN OF st_row,
             a type abap_bool,
             b type abap_bool,
             c type abap_bool,
         end of st_row.
  types tt_matris type table of st_row
            WITH NON-UNIQUE KEY table_line.

    METHODS islive
      IMPORTING
        it_table TYPE tt_matris
      RETURNING VALUE(r_result) type abap_bool.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zmky_life_game IMPLEMENTATION.

  METHOD islive.
    data: ls_row type st_row,
          lv_total type i.

    loop at it_table into ls_row.

        if ls_row-a eq abap_true.
            add 1 to lv_total.
        endif.
        if ls_row-b eq abap_true.
            add 1 to lv_total.
        endif.
        if ls_row-c eq abap_true.
            add 1 to lv_total.
        endif.
    endloop.

   lv_total = lv_total - 1.

   if lv_total lt 2 or lv_total gt 3.
    r_result = abap_false.
    else.
    r_result = abap_true.
    endif.
  ENDMETHOD.

ENDCLASS.
