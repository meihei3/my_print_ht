/* my_print_ht extension for PHP */

#ifdef HAVE_CONFIG_H
# include "config.h"
#endif

#include "php.h"
#include "ext/standard/info.h"
#include "php_my_print_ht.h"
#include "my_print_ht_arginfo.h"

/* For compatibility with older PHP versions */
#ifndef ZEND_PARSE_PARAMETERS_NONE
#define ZEND_PARSE_PARAMETERS_NONE() \
	ZEND_PARSE_PARAMETERS_START(0, 0) \
	ZEND_PARSE_PARAMETERS_END()
#endif

/* {{{ void test1() */
PHP_FUNCTION(test1)
{
	ZEND_PARSE_PARAMETERS_NONE();

	php_printf("The extension %s is loaded and working!\r\n", "my_print_ht");
}
/* }}} */

/* {{{ string test2( [ string $var ] ) */
PHP_FUNCTION(test2)
{
	char *var = "World";
	size_t var_len = sizeof("World") - 1;
	zend_string *retval;

	ZEND_PARSE_PARAMETERS_START(0, 1)
		Z_PARAM_OPTIONAL
		Z_PARAM_STRING(var, var_len)
	ZEND_PARSE_PARAMETERS_END();

	retval = strpprintf(0, "Hello %s", var);

	RETURN_STR(retval);
}
/* }}}*/

/* {{{ void array_info( [ array $a ] ) */
PHP_FUNCTION(array_info)
{
	zval *arr;
	// $a という引数を取り、配列であることを期待する
	ZEND_PARSE_PARAMETERS_START(1, 1)
		Z_PARAM_ARRAY(arr)
	ZEND_PARSE_PARAMETERS_END();

	php_printf("ht->nTableMask: %#x\r\n", Z_ARRVAL_P(arr)->nTableMask);
	php_printf("ht->nNumUsed: %d\r\n", Z_ARRVAL_P(arr)->nNumUsed);
	php_printf("ht->nTableSize: %d\r\n", Z_ARRVAL_P(arr)->nTableSize);
	php_printf("ht->nNumOfElements: %d\r\n", Z_ARRVAL_P(arr)->nNumOfElements);
	php_printf("ht->nNextFreeElement: %d\r\n", Z_ARRVAL_P(arr)->nNextFreeElement);
	php_printf("ht->nInternalPointer: %d\r\n", Z_ARRVAL_P(arr)->nInternalPointer);
}
/* }}}*/

/* {{{ PHP_RINIT_FUNCTION */
PHP_RINIT_FUNCTION(my_print_ht)
{
#if defined(ZTS) && defined(COMPILE_DL_MY_PRINT_HT)
	ZEND_TSRMLS_CACHE_UPDATE();
#endif

	return SUCCESS;
}
/* }}} */

/* {{{ PHP_MINFO_FUNCTION */
PHP_MINFO_FUNCTION(my_print_ht)
{
	php_info_print_table_start();
	php_info_print_table_header(2, "my_print_ht support", "enabled");
	php_info_print_table_end();
}
/* }}} */

/* {{{ my_print_ht_module_entry */
zend_module_entry my_print_ht_module_entry = {
	STANDARD_MODULE_HEADER,
	"my_print_ht",					/* Extension name */
	ext_functions,					/* zend_function_entry */
	NULL,							/* PHP_MINIT - Module initialization */
	NULL,							/* PHP_MSHUTDOWN - Module shutdown */
	PHP_RINIT(my_print_ht),			/* PHP_RINIT - Request initialization */
	NULL,							/* PHP_RSHUTDOWN - Request shutdown */
	PHP_MINFO(my_print_ht),			/* PHP_MINFO - Module info */
	PHP_MY_PRINT_HT_VERSION,		/* Version */
	STANDARD_MODULE_PROPERTIES
};
/* }}} */

#ifdef COMPILE_DL_MY_PRINT_HT
# ifdef ZTS
ZEND_TSRMLS_CACHE_DEFINE()
# endif
ZEND_GET_MODULE(my_print_ht)
#endif
