*"* use this source file for your ABAP unit test classes
class ltcl_ definition final for testing
  duration short
  risk level harmless.

  private section.
    methods:
      first_test for testing raising cx_static_check.
endclass.


class ltcl_ implementation.

  method first_test.
    data(lo_cell11) = new zmky_cell( abap_false ).
    data(lo_cell12) = new zmky_cell( abap_false ).
    data(lo_cell13) = new zmky_cell( abap_false ).
    data(lo_cell21) = new zmky_cell( abap_false ).
    data(lo_cell22) = new zmky_cell( abap_true ).
    data(lo_cell23) = new zmky_cell( abap_false ).
    data(lo_cell31) = new zmky_cell( abap_false ).
    data(lo_cell32) = new zmky_cell( abap_false ).
    data(lo_cell33) = new zmky_cell( abap_false ).

    lo_cell11->set_right( lo_cell12 ).
    lo_cell12->set_left( lo_cell11 ).
    lo_cell12->set_right( lo_cell13 ).
    lo_cell13->set_left( lo_cell12 ).

    lo_cell11->set_bottom( lo_cell21 ).
    lo_cell12->set_bottom( lo_cell23 ).
    lo_cell13->set_bottom( lo_cell23 ).


    lo_cell21->set_right( lo_cell22 ).
    lo_cell22->set_left( lo_cell21 ).
    lo_cell22->set_right( lo_cell23 ).
    lo_cell23->set_left( lo_cell22 ).

    lo_cell21->set_top( lo_cell11 ).
    lo_cell22->set_top( lo_cell12 ).
    lo_cell23->set_top( lo_cell13 ).

    lo_cell21->set_bottom( lo_cell31 ).
    lo_cell22->set_bottom( lo_cell33 ).
    lo_cell23->set_bottom( lo_cell33 ).


    lo_cell31->set_right( lo_cell32 ).
    lo_cell32->set_left( lo_cell31 ).
    lo_cell32->set_right( lo_cell33 ).
    lo_cell33->set_left( lo_cell32 ).

    lo_cell31->set_top( lo_cell21 ).
    lo_cell32->set_top( lo_cell22 ).
    lo_cell33->set_top( lo_cell23 ).

    data(lv_result) = lo_cell22->islive(  ).
    cl_abap_unit_assert=>assert_true( lv_result ).
  endmethod.

endclass.
