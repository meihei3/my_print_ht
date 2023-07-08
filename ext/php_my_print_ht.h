/* my_print_ht extension for PHP */

#ifndef PHP_MY_PRINT_HT_H
# define PHP_MY_PRINT_HT_H

extern zend_module_entry my_print_ht_module_entry;
# define phpext_my_print_ht_ptr &my_print_ht_module_entry

# define PHP_MY_PRINT_HT_VERSION "0.1.0"

# if defined(ZTS) && defined(COMPILE_DL_MY_PRINT_HT)
ZEND_TSRMLS_CACHE_EXTERN()
# endif

#endif	/* PHP_MY_PRINT_HT_H */
