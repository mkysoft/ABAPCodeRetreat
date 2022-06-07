*"* use this source file for your ABAP unit test classes
class ltcl_life_game definition final for testing
  duration short
  risk level harmless.

  private section.
    methods:
      first_test for testing raising cx_static_check,
      second_test for testing raising cx_static_check,
      third_test for testing raising cx_static_check,
      fourth_test for testing raising cx_static_check.
endclass.

class ltcl_life_game implementation.

  method first_test.
    data(lc_obj) = new ZMKY_LIFE_GAME(  ).
    data(lt_table) = VALUE zmky_life_game=>tt_matris( ( a = '' b = '' c = '' ) (  a = '' b = 'X' c = ''  ) (  a = '' b = '' c = 'X'  ) ).
    data(lv_result) = lc_obj->isLive( lt_table ).

    cl_abap_unit_assert=>assert_false( lv_result ).
  endmethod.

  method second_test.
    data(lc_obj) = new ZMKY_LIFE_GAME(  ).
    data(lt_table) = VALUE zmky_life_game=>tt_matris( ( a = '' b = '' c = '' ) (  a = 'X' b = 'X' c = ''  ) (  a = '' b = 'X' c = 'X'  ) ).
    data(lv_result) = lc_obj->isLive( lt_table ).

    cl_abap_unit_assert=>assert_true( lv_result ).
  endmethod.

  method third_test.
    data(lc_obj) = new ZMKY_LIFE_GAME(  ).
    data(lt_table) = VALUE zmky_life_game=>tt_matris( ( a = 'X' b = 'X' c = 'X' ) (  a = 'X' b = 'X' c = 'X'  ) (  a = 'X' b = 'X' c = 'X'  ) ).
    data(lv_result) = lc_obj->isLive( lt_table ).

    cl_abap_unit_assert=>assert_false( lv_result ).
  endmethod.

  method fourth_test.
    data(lc_obj) = new ZMKY_LIFE_GAME(  ).
    data(lt_table) = VALUE zmky_life_game=>tt_matris( ( a = '' b = '' c = '' ) (  a = 'X' b = '' c = ''  ) (  a = '' b = 'X' c = 'X'  ) ).
    data(lv_result) = lc_obj->isLive( lt_table ).

    cl_abap_unit_assert=>assert_true( lv_result ).
  endmethod.

endclass.
