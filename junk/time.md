```
         7632889 function calls (5145791 primitive calls) in 119.626 seconds

   Ordered by: internal time

   ncalls  tottime  percall  cumtime  percall filename:lineno(function)
       30   86.376    2.879   91.538    3.051 {method 'minors' of 'sage.matrix.matrix2.Matrix' objects}
    66310   24.192    0.000   24.192    0.000 {method 'determinant' of 'sage.matrix.matrix_mpolynomial_dense.Matrix_mpolynomial_dense' objects}
2916509/429537    2.142    0.000    2.142    0.000 combination.py:369(_iterator)
   419659    1.988    0.000    2.259    0.000 matrix_space.py:754(__call__)
   419657    1.656    0.000    1.858    0.000 matrix_space.py:448(__classcall__)
       26    0.759    0.029    0.911    0.035 multi_polynomial_ideal.py:666(complete_primary_decomposition)
       14    0.594    0.042    0.774    0.055 mvy.py:230(<listcomp>)
    66318    0.430    0.000    1.178    0.000 {method 'matrix_from_rows_and_columns' of 'sage.matrix.matrix1.Matrix' objects}
       12    0.428    0.036   26.201    2.183 mvy.py:179(minors_with_last_col)
   419657    0.139    0.000    0.202    0.000 matrix_space.py:104(get_matrix_class)
   839346    0.113    0.000    0.113    0.000 matrix_space.py:1938(nrows)
   839346    0.099    0.000    0.099    0.000 matrix_space.py:1926(ncols)
   354652    0.097    0.000    0.097    0.000 {method 'normal_form' of 'sage.libs.singular.groebner_strategy.GroebnerStrategy' objects}
       26    0.096    0.004    0.096    0.004 {sage.libs.singular.function.lib}
   354652    0.093    0.000    0.213    0.000 multi_polynomial_ideal.py:4493(reduce)
       16    0.073    0.005    0.107    0.007 mvy.py:267(<listcomp>)
   428945    0.067    0.000    0.067    0.000 {built-in method builtins.isinstance}
       44    0.054    0.001    0.059    0.001 multi_polynomial_ideal.py:465(_groebner_basis_libsingular)
   419660    0.053    0.000    0.053    0.000 matrix_space.py:1686(is_sparse)
     5185    0.041    0.000    0.057    0.000 combination.py:33(Combinations)
       12    0.031    0.003    0.033    0.003 multi_polynomial_ideal.py:1537(intersection)
        1    0.016    0.016  119.626  119.626 mvy.py:193(create_ideal)
       35    0.010    0.000    0.054    0.002 multi_polynomial_ideal.py:3586(__richcmp__)
    34941    0.006    0.000    0.006    0.000 {method 'index' of 'list' objects}
      237    0.006    0.000    0.008    0.000 multi_polynomial_sequence.py:193(PolynomialSequence)
     5185    0.006    0.000    0.006    0.000 combination.py:400(__iter__)
     5185    0.005    0.000    0.005    0.000 combination.py:292(__init__)
      142    0.003    0.000    0.008    0.000 sequence.py:78(Sequence)
       86    0.002    0.000    0.005    0.000 expression_conversions.py:1295(symbol)
    16411    0.002    0.000    0.002    0.000 {built-in method builtins.len}
       50    0.002    0.000    0.009    0.000 mvy.py:273(<genexpr>)
        4    0.002    0.000    0.003    0.001 {method 'coefficients' of 'sage.symbolic.expression.Expression' objects}
       35    0.002    0.000    0.009    0.000 mvy.py:236(<genexpr>)
      108    0.002    0.000    0.002    0.000 {sage.libs.singular.function.singular_function}
       44    0.001    0.000    0.062    0.001 multi_polynomial_ideal.py:3837(groebner_basis)
      195    0.001    0.000    0.002    0.000 infinity.py:1115(_element_constructor_)
      139    0.001    0.000    0.001    0.000 {method 'variables' of 'sage.symbolic.expression.Expression' objects}
       56    0.001    0.000    0.097    0.002 qqbar_decorators.py:37(wrapper)
       71    0.001    0.000    0.002    0.000 finite_field_constructor.py:472(create_key_and_extra_args)
    57/44    0.001    0.000    0.003    0.000 homset.py:84(Hom)
       83    0.001    0.000    0.001    0.000 {built-in method sage.structure.category_object.normalize_names}
       98    0.001    0.000    0.002    0.000 {method 'ideal' of 'sage.rings.polynomial.multi_polynomial_libsingular.MPolynomialRing_libsingular' objects}
       65    0.001    0.000    0.003    0.000 {method 'variable_names_recursive' of 'sage.rings.polynomial.multi_polynomial_ring_base.MPolynomialRing_base' objects}
       44    0.001    0.000    0.001    0.000 homset.py:583(__init__)
      136    0.001    0.000    0.011    0.000 expression_conversions.py:1233(__init__)
       13    0.001    0.000    0.004    0.000 polynomial_ring.py:235(__init__)
    52/26    0.001    0.000    0.912    0.035 multi_polynomial_ideal.py:276(__call__)
      263    0.001    0.000    0.001    0.000 sequence.py:401(__init__)
      136    0.001    0.000    0.018    0.000 expression_conversions.py:1409(polynomial)
       15    0.001    0.000    0.023    0.002 multi_polynomial_ideal.py:591(_groebner_strategy)
     2482    0.001    0.000    0.001    0.000 {method 'append' of 'list' objects}
       83    0.001    0.000    0.007    0.000 polynomial_ring_constructor.py:52(PolynomialRing)
       13    0.001    0.000    0.002    0.000 polynomial_ring.py:658(_coerce_map_from_base_ring)
    82/56    0.001    0.000    0.968    0.017 standard_options.py:135(wrapper)
      104    0.001    0.000    0.001    0.000 {built-in method builtins.repr}
      237    0.001    0.000    0.001    0.000 multi_polynomial_sequence.py:360(__init__)
       71    0.001    0.000    0.001    0.000 polynomial_ring.py:312(_element_constructor_)
      108    0.001    0.000    0.098    0.001 function_factory.py:22(__getattr__)
        4    0.000    0.000    0.001    0.000 special.py:2138(companion_matrix)
       12    0.000    0.000    0.002    0.000 {method 'rows' of 'sage.matrix.matrix1.Matrix' objects}
       13    0.000    0.000    0.000    0.000 polynomial_ring.py:1175(gen)
       82    0.000    0.000    0.000    0.000 {method '__enter__' of 'sage.libs.singular.option.LibSingularOptionsContext' objects}
       82    0.000    0.000    0.001    0.000 standard_options.py:35(__enter__)
  153/148    0.000    0.000    0.006    0.000 expression_conversions.py:155(__call__)
        1    0.000    0.000    0.019    0.019 mvy.py:131(mu_matrix)
       71    0.000    0.000    0.005    0.000 polynomial_ring_constructor.py:677(_single_variate)
      169    0.000    0.000    0.000    0.000 {method 'reduce' of 'sage.rings.polynomial.multi_polynomial_libsingular.MPolynomial_libsingular' objects}
       84    0.000    0.000    0.000    0.000 polynomial_ring.py:1103(_mpoly_base_ring)
      113    0.000    0.000    0.000    0.000 ideal.py:236(__init__)
       10    0.000    0.000    0.000    0.000 {sage.calculus.var.var}
       77    0.000    0.000    0.003    0.000 multi_polynomial_ideal.py:3554(gens)
       64    0.000    0.000    0.000    0.000 dynamic_class.py:129(dynamic_class)
        2    0.000    0.000    0.000    0.000 {function socket.close at 0x104d36310}
        4    0.000    0.000    0.001    0.000 free_module.py:752(__init__)
      167    0.000    0.000    0.001    0.000 multi_polynomial_ideal.py:3796(<genexpr>)
        1    0.000    0.000    0.021    0.021 mvy.py:148(mu_matrices_over_gf)
       71    0.000    0.000    0.000    0.000 {method 'parse' of 'sage.misc.parser.Parser' objects}
        6    0.000    0.000    0.004    0.001 mvy.py:117(insert_row)
       10    0.000    0.000    0.008    0.001 {method 'change_ring' of 'sage.matrix.matrix0.Matrix' objects}
      353    0.000    0.000    0.000    0.000 multi_polynomial_sequence.py:283(<lambda>)
       71    0.000    0.000    0.000    0.000 all.py:4(arithmetic)
       24    0.000    0.000    0.001    0.000 free_module.py:271(FreeModule)
        1    0.000    0.000    0.010    0.010 special.py:1703(block_matrix)
       82    0.000    0.000    0.000    0.000 {method 'reset_default' of 'sage.libs.singular.option.LibSingularOptions' objects}
      153    0.000    0.000    0.000    0.000 {method 'pyobject' of 'sage.symbolic.expression.Expression' objects}
        4    0.000    0.000    0.005    0.001 mvy.py:120(upper_row_matrix)
       24    0.000    0.000    0.000    0.000 free_module.py:1063(_element_constructor_)
       23    0.000    0.000    0.000    0.000 mvy.py:238(<genexpr>)
       82    0.000    0.000    0.000    0.000 standard_options.py:10(__init__)
      381    0.000    0.000    0.000    0.000 weakref.py:328(__init__)
      158    0.000    0.000    0.001    0.000 {built-in method builtins.any}
      422    0.000    0.000    0.000    0.000 weakref.py:323(__new__)
       12    0.000    0.000    0.000    0.000 {method 'augment' of 'sage.matrix.matrix1.Matrix' objects}
        3    0.000    0.000    0.001    0.000 matrix_space.py:514(__init__)
      160    0.000    0.000    0.000    0.000 {method 'variables' of 'sage.rings.polynomial.multi_polynomial_libsingular.MPolynomial_libsingular' objects}
        4    0.000    0.000    0.000    0.000 other.py:131(_eval_floor_ceil)
      152    0.000    0.000    0.000    0.000 {method 'add' of 'set' objects}
       26    0.000    0.000    0.000    0.000 {method 'coerce_map_from' of 'sage.structure.parent.Parent' objects}
       78    0.000    0.000    0.000    0.000 {built-in method builtins.hasattr}
      124    0.000    0.000    0.000    0.000 qqbar_decorators.py:92(<genexpr>)
      113    0.000    0.000    0.001    0.000 multi_polynomial_ideal.py:3518(__init__)
      473    0.000    0.000    0.000    0.000 {built-in method sage.structure.element.canonical_coercion}
      424    0.000    0.000    0.000    0.000 {method 'lc' of 'sage.rings.polynomial.multi_polynomial_libsingular.MPolynomial_libsingular' objects}
      188    0.000    0.000    0.000    0.000 {method 'startswith' of 'str' objects}
       26    0.000    0.000    0.001    0.000 polynomial_ring.py:684(_coerce_map_from_)
       65    0.000    0.000    0.000    0.000 {method '_internal_coerce_map_from' of 'sage.structure.parent.Parent' objects}
      422    0.000    0.000    0.000    0.000 {built-in method __new__ of type object at 0x1048fda30}
      130    0.000    0.000    0.000    0.000 <frozen importlib._bootstrap>:389(parent)
       13    0.000    0.000    0.004    0.000 polynomial_ring.py:1668(__init__)
       82    0.000    0.000    0.000    0.000 {method '__exit__' of 'sage.libs.singular.option.LibSingularOptionsContext' objects}
      195    0.000    0.000    0.000    0.000 infinity.py:1280(__init__)
       29    0.000    0.000    0.000    0.000 sets_cat.py:974(_element_constructor_from_element_class)
      653    0.000    0.000    0.000    0.000 ideal.py:544(ring)
       23    0.000    0.000    0.000    0.000 fields.py:62(__contains__)
       71    0.000    0.000    0.000    0.000 proof.py:212(__init__)
       55    0.000    0.000    0.000    0.000 {built-in method builtins.sorted}
       27    0.000    0.000    0.001    0.000 rings.py:383(_Hom_)
       13    0.000    0.000    0.001    0.000 {method '_Hom_' of 'sage.rings.finite_rings.finite_field_base.FiniteField' objects}
      276    0.000    0.000    0.000    0.000 finite_field_prime_modn.py:183(characteristic)
    90/47    0.000    0.000    0.000    0.000 category.py:3053(is_subcategory)
      863    0.000    0.000    0.000    0.000 {method 'base_ring' of 'sage.structure.category_object.CategoryObject' objects}
      195    0.000    0.000    0.000    0.000 infinity.py:1658(_richcmp_)
       27    0.000    0.000    0.001    0.000 homset.py:40(RingHomset)
      537    0.000    0.000    0.000    0.000 {sage.rings.polynomial.multi_polynomial_ring_base.is_MPolynomialRing}
       13    0.000    0.000    0.004    0.000 polynomial_ring.py:3122(__init__)
       11    0.000    0.000    0.001    0.000 multi_polynomial_sequence.py:568(variables)
       12    0.000    0.000    0.001    0.000 {method 'remove_var' of 'sage.rings.polynomial.multi_polynomial_ring_base.MPolynomialRing_base' objects}
       84    0.000    0.000    0.000    0.000 {sage.rings.ring.is_Ring}
        1    0.000    0.000  119.626  119.626 {built-in method builtins.exec}
       80    0.000    0.000    0.000    0.000 {method 'format' of 'str' objects}
       74    0.000    0.000    0.001    0.000 {built-in method builtins.all}
       26    0.000    0.000    0.050    0.002 monoids.py:234(is_one)
       22    0.000    0.000    0.000    0.000 <frozen importlib._bootstrap>:1017(_handle_fromlist)
       82    0.000    0.000    0.000    0.000 standard_options.py:72(__exit__)
       28    0.000    0.000    0.000    0.000 {built-in method builtins.getattr}
       16    0.000    0.000    0.000    0.000 qqbar.py:3414(__init__)
      237    0.000    0.000    0.000    0.000 {built-in method builtins.sum}
       52    0.000    0.000    0.000    0.000 expression_conversions.py:1319(pyobject)
       83    0.000    0.000    0.000    0.000 {method 'get' of 'sage.misc.weak_dict.WeakValueDictionary' objects}
        4    0.000    0.000    0.001    0.000 free_module.py:224(create_object)
       17    0.000    0.000    0.000    0.000 category_with_axiom.py:1968(__classcall__)
       13    0.000    0.000    0.003    0.000 unital_algebras.py:71(__init_extra__)
       83    0.000    0.000    0.000    0.000 polynomial_ring_constructor.py:667(_get_from_cache)
       26    0.000    0.000    0.912    0.035 multi_polynomial_ideal.py:781(primary_decomposition)
       84    0.000    0.000    0.000    0.000 {method 'is_prime' of 'sage.rings.integer.Integer' objects}
        6    0.000    0.000    0.001    0.000 mvy.py:124(<listcomp>)
      169    0.000    0.000    0.000    0.000 quotient_ring.py:321(is_QuotientRing)
        7    0.000    0.000    0.000    0.000 modules.py:115(__classcall_private__)
       14    0.000    0.000    0.000    0.000 mvy.py:233(<listcomp>)
       65    0.000    0.000    0.000    0.000 finite_field_prime_modn.py:96(_coerce_map_from_)
       60    0.000    0.000    0.000    0.000 multi_polynomial_ideal.py:3797(<genexpr>)
      130    0.000    0.000    0.000    0.000 {method 'rpartition' of 'str' objects}
        1    0.000    0.000    0.000    0.000 {method '_coerce_map_via' of 'sage.structure.parent.Parent' objects}
       13    0.000    0.000    0.000    0.000 {method 'register_coercion' of 'sage.structure.parent.Parent' objects}
       65    0.000    0.000    0.000    0.000 copy.py:66(copy)
       68    0.000    0.000    0.000    0.000 ideal.py:439(base_ring)
        4    0.000    0.000    0.000    0.000 free_module.py:7322(element_class)
       10    0.000    0.000    0.000    0.000 {method 'row' of 'sage.matrix.matrix1.Matrix' objects}
     201    0.000    0.000    0.000    0.000 {built-in method sage.structure.richcmp.rich_to_bool}
       12    0.000    0.000    0.000    0.000 polynomial_ring_constructor.py:755(_multi_variate)
       12    0.000    0.000    0.000    0.000 term_order.py:570(__init__)
       26    0.000    0.000    0.000    0.000 polynomial_ring.py:3176(_implementation_names_impl)
       16    0.000    0.000    0.000    0.000 qqbar.py:6136(_interval_fast)
        7    0.000    0.000    0.000    0.000 mvy.py:275(<genexpr>)
       26    0.000    0.000    0.001    0.000 multi_polynomial_ideal.py:775(<listcomp>)
       13    0.000    0.000    0.000    0.000 polynomial_singular_interface.py:355(can_convert_to_singular)
       12    0.000    0.000    0.001    0.000 {method '_algebraic_' of 'sage.symbolic.expression.Expression' objects}
       77    0.000    0.000    0.000    0.000 category.py:648(_subcategory_hook_)
        1    0.000    0.000    0.000    0.000 special.py:1492(_determine_block_matrix_grid)
      3/2    0.000    0.000    0.000    0.000 expression_conversions.py:1372(arithmetic)
       12    0.000    0.000    0.000    0.000 expression_conversions.py:1001(__init__)
     16/8    0.000    0.000    0.001    0.000 qqbar.py:1478(_element_constructor_)
       26    0.000    0.000    0.000    0.000 polynomial_ring_constructor.py:672(_save_in_cache)
      263    0.000    0.000    0.000    0.000 {method 'parent' of 'sage.structure.element.Element' objects}
       16    0.000    0.000    0.000    0.000 mvy.py:270(<listcomp>)
      237    0.000    0.000    0.000    0.000 {built-in method builtins.iter}
       54    0.000    0.000    0.000    0.000 category.py:1781(is_subcategory)
       24    0.000    0.000    0.000    0.000 free_module.py:201(create_key)
        7    0.000    0.000    0.000    0.000 category.py:2511(category)
       13    0.000    0.000    0.000    0.000 rings.py:334(is_zero)
       12    0.000    0.000    0.001    0.000 expression_conversions.py:1186(algebraic)
       68    0.000    0.000    0.000    0.000 qqbar.py:1942(is_AlgebraicField_common)
      103    0.000    0.000    0.000    0.000 {built-in method builtins.issubclass}
       13    0.000    0.000    0.000    0.000 magmas.py:817(__init_extra__)
      179    0.000    0.000    0.000    0.000 {method 'variable_name' of 'sage.structure.category_object.CategoryObject' objects}
       13    0.000    0.000    0.000    0.000 {method '_populate_coercion_lists_' of 'sage.structure.parent.Parent' objects}
       27    0.000    0.000    0.001    0.000 homset.py:1232(__init__)
       98    0.000    0.000    0.000    0.000 ideal.py:196(is_Ideal)
       89    0.000    0.000    0.000    0.000 {method 'operator' of 'sage.symbolic.expression.Expression' objects}
       28    0.000    0.000    0.000    0.000 category.py:692(__contains__)
        4    0.000    0.000    0.001    0.000 mvy.py:238(<listcomp>)
        7    0.000    0.000    0.000    0.000 category.py:419(__classcall__)
       96    0.000    0.000    0.000    0.000 category.py:750(<genexpr>)
        1    0.000    0.000    0.000    0.000 {built-in method _warnings.warn}
       98    0.000    0.000    0.000    0.000 macaulay2.py:1831(is_Macaulay2Element)
       16    0.000    0.000    0.000    0.000 qqbar.py:6068(__init__)
      146    0.000    0.000    0.000    0.000 {built-in method sage.structure.element.parent}
      264    0.000    0.000    0.000    0.000 {method 'lower' of 'str' objects}
      237    0.000    0.000    0.000    0.000 {built-in method builtins.next}
       27    0.000    0.000    0.001    0.000 homset.py:71(__init__)
        7    0.000    0.000    0.000    0.000 {built-in method sage.rings.ring._is_Field}
        8    0.000    0.000    0.000    0.000 qqbar.py:5093(__init__)
       39    0.000    0.000    0.000    0.000 integer_mod_ring.py:242(is_IntegerModRing)
       39    0.000    0.000    0.000    0.000 category.py:3067(<genexpr>)
       29    0.000    0.000    0.000    0.000 {method 'is_in_cache' of 'sage.misc.cachefunc.CachedFunction' objects}
       98    0.000    0.000    0.000    0.000 singular.py:2317(is_SingularElement)
       68    0.000    0.000    0.000    0.000 multi_polynomial_sequence.py:171(is_PolynomialSequence)
     12/8    0.000    0.000    0.000    0.000 qqbar.py:1044(_element_constructor_)
      113    0.000    0.000    0.000    0.000 {method 'ideal_monoid' of 'sage.rings.ring.CommutativeRing' objects}
      153    0.000    0.000    0.000    0.000 {method 'get' of 'dict' objects}
       58    0.000    0.000    0.000    0.000 category.py:3051(<genexpr>)
       20    0.000    0.000    0.000    0.000 additive_magmas.py:207(__init_extra__)
        8    0.000    0.000    0.000    0.000 {method 'floor' of 'sage.rings.real_mpfr.RealNumber' objects}
       15    0.000    0.000    0.000    0.000 term_order.py:2062(is_global)
      115    0.000    0.000    0.000    0.000 {method 'items' of 'dict' objects}
       52    0.000    0.000    0.000    0.000 method_decorator.py:67(__get__)
       71    0.000    0.000    0.000    0.000 proof.py:230(__enter__)
       88    0.000    0.000    0.000    0.000 homset.py:748(homset_category)
        3    0.000    0.000    0.000    0.000 {method 'stack' of 'sage.matrix.matrix1.Matrix' objects}
       71    0.000    0.000    0.000    0.000 proof.py:21(arithmetic)
       20    0.000    0.000    0.000    0.000 {built-in method sage.rings.real_mpfi.RealIntervalField}
       55    0.000    0.000    0.000    0.000 polynomial_ring.py:186(is_PolynomialRing)
       13    0.000    0.000    0.000    0.000 {method '_make_weak_references' of 'sage.categories.map.Map' objects}
        1    0.000    0.000    0.000    0.000 {built-in method builtins.print}
       12    0.000    0.000    0.000    0.000 term_order.py:1896(__eq__)
       12    0.000    0.000    0.000    0.000 expression_conversions.py:1017(pyobject)
       20    0.000    0.000    0.000    0.000 re.py:325(_subx)
       96    0.000    0.000    0.000    0.000 {method 'is_field' of 'sage.rings.finite_rings.finite_field_base.FiniteField' objects}
       26    0.000    0.000    0.000    0.000 category_types.py:365(_subcategory_hook_)
       15    0.000    0.000    0.000    0.000 category.py:3030(_subcategory_hook_)
       95    0.000    0.000    0.000    0.000 polynomial_ring_constructor.py:567(<genexpr>)
        4    0.000    0.000    0.000    0.000 assumptions.py:718(assumptions)
        1    0.000    0.000    0.000    0.000 mvy.py:165(mu_submatrices_over_gf)
       70    0.000    0.000    0.000    0.000 verbose.py:251(get_verbose)
       25    0.000    0.000    0.000    0.000 number_field.py:1186(is_CyclotomicField)
       13    0.000    0.000    0.004    0.000 polynomial_ring.py:2965(__init__)
       18    0.000    0.000    0.000    0.000 mvy.py:212(<listcomp>)
        3    0.000    0.000    0.000    0.000 category.py:710(__classcontains__)
       12    0.000    0.000    0.000    0.000 term_order.py:872(__copy)
     12    0.000    0.000    0.000    0.000 expression_conversions.py:1017(pyobject)
       20    0.000    0.000    0.000    0.000 re.py:325(_subx)
       96    0.000    0.000    0.000    0.000 {method 'is_field' of 'sage.rings.finite_rings.finite_field_base.FiniteField' objects}
       26    0.000    0.000    0.000    0.000 category_types.py:365(_subcategory_hook_)
       15    0.000    0.000    0.000    0.000 category.py:3030(_subcategory_hook_)
       95    0.000    0.000    0.000    0.000 polynomial_ring_constructor.py:567(<genexpr>)
        4    0.000    0.000    0.000    0.000 assumptions.py:718(assumptions)
        1    0.000    0.000    0.000    0.000 mvy.py:165(mu_submatrices_over_gf)
       70    0.000    0.000    0.000    0.000 verbose.py:251(get_verbose)
       25    0.000    0.000    0.000    0.000 number_field.py:1186(is_CyclotomicField)
       13    0.000    0.000    0.004    0.000 polynomial_ring.py:2965(__init__)
       18    0.000    0.000    0.000    0.000 mvy.py:212(<listcomp>)
        3    0.000    0.000    0.000    0.000 category.py:710(__classcontains__)
       12    0.000    0.000    0.000    0.000 term_order.py:872(__copy)
       71    0.000    0.000    0.000    0.000 proof.py:243(__exit__)
        8    0.000    0.000    0.000    0.000 qqbar.py:5170(_richcmp_)
        1    0.000    0.000    0.000    0.000 matrix_space.py:1028(_coerce_map_from_)
       13    0.000    0.000    0.000    0.000 polynomial_ring.py:3055(modulus)
        3    0.000    0.000    0.001    0.000 {sage.misc.classcall_metaclass.typecall}
        2    0.000    0.000    0.000    0.000 mvy.py:275(<listcomp>)
       83    0.000    0.000    0.000    0.000 {method 'variable_names' of 'sage.structure.category_object.CategoryObject' objects}
       77    0.000    0.000    0.000    0.000 ideal.py:602(gens)
       44    0.000    0.000    0.000    0.000 homset.py:1173(domain)
       73    0.000    0.000    0.000    0.000 {method 'category' of 'sage.rings.ring.Ring' objects}
       13    0.000    0.000    0.000    0.000 polynomial_ring.py:474(_implementation_names)
        1    0.000    0.000    0.001    0.001 base_events.py:652(__del__)
       38    0.000    0.000    0.000    0.000 {sage.rings.finite_rings.finite_field_base.is_FiniteField}
        3    0.000    0.000    0.001    0.000 unique_representation.py:993(__classcall__)
       13    0.000    0.000    0.000    0.000 polynomial_ring.py:1226(is_exact)
       15    0.000    0.000    0.000    0.000 ideal.py:259(<listcomp>)
       24    0.000    0.000    0.000    0.000 term_order.py:2118(is_block_order)
        3    0.000    0.000    0.000    0.000 {method 'operands' of 'sage.symbolic.expression.Expression' objects}
        4    0.000    0.000    0.000    0.000 free_module.py:4720(_coerce_map_from_)
       72    0.000    0.000    0.000    0.000 {method 'pop' of 'dict' objects}
       12    0.000    0.000    0.000    0.000 term_order.py:862(__hash__)
        1    0.000    0.000    0.000    0.000 selector_events.py:98(_close_self_pipe)
       44    0.000    0.000    0.000    0.000 homset.py:1188(codomain)
        4    0.000    0.000    0.000    0.000 other.py:568(__call__)
       26    0.000    0.000    0.000    0.000 {method 'endswith' of 'str' objects}
        6    0.000    0.000    0.000    0.000 mvy.py:248(<listcomp>)
        8    0.000    0.000    0.000    0.000 qqbar.py:4526(__init__)
        2    0.000    0.000    0.000    0.000 {built-in method _functools.reduce}
        9    0.000    0.000    0.000    0.000 mvy.py:207(<listcomp>)
       50    0.000    0.000    0.000    0.000 {sage.structure.element.is_Matrix}
       26    0.000    0.000    0.000    0.000 multi_polynomial_ideal.py:846(<listcomp>)
       45    0.000    0.000    0.000    0.000 {method 'nrows' of 'sage.matrix.matrix0.Matrix' objects}
       12    0.000    0.000    0.000    0.000 {method 'has_coerce_map_from' of 'sage.structure.parent.Parent' objects}
       15    0.000    0.000    0.000    0.000 finite_field_prime_modn.py:246(gen)
        8    0.000    0.000    0.000    0.000 qqbar.py:5111(_ensure_real)
        4    0.000    0.000    0.000    0.000 {method 'absolute_diameter' of 'sage.rings.real_mpfi.RealIntervalFieldElement' objects}
        4    0.000    0.000    0.001    0.000 free_module.py:4660(__init__)
        1    0.000    0.000    0.000    0.000 unix_events.py:57(close)
        1    0.000    0.000    0.000    0.000 selectors.py:532(unregister)
        6    0.000    0.000    0.000    0.000 mvy.py:286(<listcomp>)
       11    0.000    0.000    0.000    0.000 matrix_misc.py:26(row_iterator)
        1    0.000    0.000    0.000    0.000 selectors.py:575(close)
        1    0.000    0.000    0.000    0.000 base_events.py:414(__repr__)
        6    0.000    0.000    0.000    0.000 mvy.py:251(<listcomp>)
       15    0.000    0.000    0.000    0.000 term_order.py:1608(name)
        1    0.000    0.000    0.000    0.000 {method 'control' of 'select.kqueue' objects}
        1    0.000    0.000    0.000    0.000 selector_events.py:270(_remove_reader)
        4    0.000    0.000    0.001    0.000 free_module.py:5321(__init__)
        8    0.000    0.000    0.000    0.000 {built-in method sage.structure.richcmp.richcmp}
       13    0.000    0.000    0.000    0.000 finite_field_prime_modn.py:234(order)
       24    0.000    0.000    0.000    0.000 free_module.py:1962(degree)
       56    0.000    0.000    0.000    0.000 {method 'ncols' of 'sage.matrix.matrix0.Matrix' objects}
        3    0.000    0.000    0.001    0.000 free_module.py:5491(__init__)
        1    0.000    0.000    0.000    0.000 {method 'subdivide' of 'sage.matrix.matrix2.Matrix' objects}
       13    0.000    0.000    0.000    0.000 {method '_is_coercion_cached' of 'sage.structure.parent.Parent' objects}
       12    0.000    0.000    0.000    0.000 {method 'copy' of 'dict' objects}
        4    0.000    0.000    0.000    0.000 sequence.py:835(__getattr__)
        2    0.000    0.000    0.000    0.000 expression_conversions.py:1406(<listcomp>)
        2    0.000    0.000    0.000    0.000 {built-in method posix.close}
        3    0.000    0.000    0.000    0.000 {method 'categories' of 'sage.structure.category_object.CategoryObject' objects}
        3    0.000    0.000    0.000    0.000 sets_cat.py:945(_element_constructor_)
        1    0.000    0.000    0.000    0.000 selector_events.py:87(close)
        1    0.000    0.000    0.000    0.000 inputhook.py:145(close)
        1    0.000    0.000    0.000    0.000 base_events.py:626(close)
        6    0.000    0.000    0.000    0.000 expression_conversions.py:1396(<genexpr>)
        1    0.000    0.000    0.000    0.000 matrix_space.py:918(_get_action_)
26    0.000    0.000    0.000    0.000 polynomial_ring.py:1307(ngens)
       14    0.000    0.000    0.000    0.000 mvy.py:234(<listcomp>)
        2    0.000    0.000    0.000    0.000 socket.py:492(_real_close)
       16    0.000    0.000    0.000    0.000 mvy.py:271(<listcomp>)
        4    0.000    0.000    0.000    0.000 free_module.py:1129(__richcmp__)
        4    0.000    0.000    0.000    0.000 {method 'lower' of 'sage.rings.real_mpfi.RealIntervalFieldElement' objects}
       13    0.000    0.000    0.000    0.000 {method 'one' of 'sage.rings.ring.Ring' objects}
       39    0.000    0.000    0.000    0.000 {method 'copy' of 'list' objects}
        1    0.000    0.000    0.000    0.000 sequence.py:682(__str__)
       11    0.000    0.000    0.000    0.000 {method 'is_sparse' of 'sage.matrix.matrix0.Matrix' objects}
        5    0.000    0.000    0.000    0.000 special.py:1951(<genexpr>)
       12    0.000    0.000    0.000    0.000 term_order.py:2130(is_weighted_degree_order)
        4    0.000    0.000    0.000    0.000 {method 'upper' of 'sage.rings.real_mpfi.RealIntervalFieldElement' objects}
       14    0.000    0.000    0.000    0.000 {method 'zero' of 'sage.rings.ring.Ring' objects}
       26    0.000    0.000    0.000    0.000 copy.py:107(_copy_immutable)
        1    0.000    0.000    0.000    0.000 multi_polynomial_sequence.py:586(nvariables)
        3    0.000    0.000    0.000    0.000 mvy.py:208(<listcomp>)
        4    0.000    0.000    0.000    0.000 {function FreeModule_ambient._coerce_map_from_ at 0x26df84940}
        8    0.000    0.000    0.000    0.000 {sage.rings.complex_interval.is_ComplexIntervalFieldElement}
        1    0.000    0.000    0.000    0.000 selectors.py:180(get_key)
        1    0.000    0.000    0.000    0.000 selectors.py:268(close)
        2    0.000    0.000    0.000    0.000 socket.py:496(close)
       12    0.000    0.000    0.000    0.000 {built-in method builtins.hash}
        1    0.000    0.000    0.000    0.000 {method 'close' of 'select.kqueue' objects}
        1    0.000    0.000    0.000    0.000 multi_polynomial_sequence.py:824(_repr_)
        6    0.000    0.000    0.000    0.000 mvy.py:249(<listcomp>)
        8    0.000    0.000    0.000    0.000 {method 'is_commutative' of 'sage.rings.ring.CommutativeRing' objects}
        3    0.000    0.000    0.000    0.000 category.py:938(all_super_categories)
        1    0.000    0.000    0.000    0.000 events.py:65(cancel)
        6    0.000    0.000    0.000    0.000 mvy.py:287(<listcomp>)
        6    0.000    0.000    0.000    0.000 mvy.py:252(<listcomp>)
        6    0.000    0.000    0.000    0.000 mvy.py:213(<listcomp>)
       10    0.000    0.000    0.000    0.000 {method 'base_ring' of 'sage.matrix.matrix0.Matrix' objects}
        1    0.000    0.000    0.000    0.000 selectors.py:69(__getitem__)
        4    0.000    0.000    0.000    0.000 base_events.py:648(is_closed)
       13    0.000    0.000    0.000    0.000 {method 'is_exact' of 'sage.rings.ring.Ring' objects}
        2    0.000    0.000    0.000    0.000 selectors.py:21(_fileobj_to_fd)
        5    0.000    0.000    0.000    0.000 sets_cat.py:1800(is_finite)
        4    0.000    0.000    0.000    0.000 {sage.rings.integer_ring.is_IntegerRing}
        2    0.000    0.000    0.000    0.000 selectors.py:215(_fileobj_lookup)
        4    0.000    0.000    0.000    0.000 base_events.py:658(is_running)
        2    0.000    0.000    0.000    0.000 {sage.misc.misc_c.running_total}
        1    0.000    0.000    0.000    0.000 inputhook.py:156(get_map)
        3    0.000    0.000    0.000    0.000 {method 'is_field' of 'sage.rings.integer_ring.IntegerRing_class' objects}
        1    0.000    0.000    0.000    0.000 inputhook.py:85(unregister)
        3    0.000    0.000    0.000    0.000 mvy.py:209(<listcomp>)
        4    0.000    0.000    0.000    0.000 {method 'is_infinity' of 'sage.rings.real_mpfr.RealNumber' objects}
        1    0.000    0.000    0.000    0.000 selectors.py:247(unregister)
        1    0.000    0.000    0.000    0.000 {method 'is_integral_domain' of 'sage.rings.polynomial.multi_polynomial_ring_base.MPolynomialRing_base' objects}
        1    0.000    0.000    0.000    0.000 {method 'is_field' of 'sage.rings.polynomial.multi_polynomial_ring_base.MPolynomialRing_base' objects}
        1    0.000    0.000    0.000    0.000 <string>:1(<module>)
        1    0.000    0.000    0.000    0.000 {method 'clear' of 'collections.deque' objects}
        2    0.000    0.000    0.000    0.000 base_events.py:1877(get_debug)
        1    0.000    0.000    0.000    0.000 rational_field.py:1554(is_RationalField)
        3    0.000    0.000    0.000    0.000 mvy.py:210(<listcomp>)
        1    0.000    0.000    0.000    0.000 {method 'pop' of 'list' objects}
        2    0.000    0.000    0.000    0.000 {method 'is_finite' of 'sage.symbolic.ring.SymbolicRing' objects}
        1    0.000    0.000    0.000    0.000 {method 'fileno' of '_socket.socket' objects}
        1    0.000    0.000    0.000    0.000 selectors.py:272(get_map)
        1    0.000    0.000    0.000    0.000 callable.py:70(is_CallableSymbolicExpressionRing)
        1    0.000    0.000    0.000    0.000 {method 'clear' of 'dict' objects}
        1    0.000    0.000    0.000    0.000 {method 'category' of 'sage.structure.parent.Parent' objects}
        1    0.000    0.000    0.000    0.000 {sage.symbolic.ring.is_SymbolicExpressionRing}
        1    0.000    0.000    0.000    0.000 {built-in method sys.is_finalizing}
        1    0.000    0.000    0.000    0.000 {sage.rings.real_double.is_RealDoubleField}
        1    0.000    0.000    0.000    0.000 {method 'disable' of '_lsprof.Profiler' objects}
        1    0.000    0.000    0.000    0.000 {sage.rings.complex_double.is_ComplexDoubleField}
        1    0.000    0.000    0.000    0.000 {method 'clear' of 'list' objects}
        1    0.000    0.000    0.000    0.000 {method 'base' of 'sage.structure.category_object.CategoryObject' objects}

