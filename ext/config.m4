dnl config.m4 for extension my_print_ht

dnl Comments in this file start with the string 'dnl'.
dnl Remove where necessary.

dnl If your extension references something external, use 'with':

dnl PHP_ARG_WITH([my_print_ht],
dnl   [for my_print_ht support],
dnl   [AS_HELP_STRING([--with-my_print_ht],
dnl     [Include my_print_ht support])])

dnl Otherwise use 'enable':

PHP_ARG_ENABLE([my_print_ht],
  [whether to enable my_print_ht support],
  [AS_HELP_STRING([--enable-my_print_ht],
    [Enable my_print_ht support])],
  [no])

if test "$PHP_MY_PRINT_HT" != "no"; then
  dnl Write more examples of tests here...

  dnl Remove this code block if the library does not support pkg-config.
  dnl PKG_CHECK_MODULES([LIBFOO], [foo])
  dnl PHP_EVAL_INCLINE($LIBFOO_CFLAGS)
  dnl PHP_EVAL_LIBLINE($LIBFOO_LIBS, MY_PRINT_HT_SHARED_LIBADD)

  dnl If you need to check for a particular library version using PKG_CHECK_MODULES,
  dnl you can use comparison operators. For example:
  dnl PKG_CHECK_MODULES([LIBFOO], [foo >= 1.2.3])
  dnl PKG_CHECK_MODULES([LIBFOO], [foo < 3.4])
  dnl PKG_CHECK_MODULES([LIBFOO], [foo = 1.2.3])

  dnl Remove this code block if the library supports pkg-config.
  dnl --with-my_print_ht -> check with-path
  dnl SEARCH_PATH="/usr/local /usr"     # you might want to change this
  dnl SEARCH_FOR="/include/my_print_ht.h"  # you most likely want to change this
  dnl if test -r $PHP_MY_PRINT_HT/$SEARCH_FOR; then # path given as parameter
  dnl   my_print_ht_DIR=$PHP_MY_PRINT_HT
  dnl else # search default path list
  dnl   AC_MSG_CHECKING([for my_print_ht files in default path])
  dnl   for i in $SEARCH_PATH ; do
  dnl     if test -r $i/$SEARCH_FOR; then
  dnl       MY_PRINT_HT_DIR=$i
  dnl       AC_MSG_RESULT(found in $i)
  dnl     fi
  dnl   done
  dnl fi
  dnl
  dnl if test -z "$MY_PRINT_HT_DIR"; then
  dnl   AC_MSG_RESULT([not found])
  dnl   AC_MSG_ERROR([Please reinstall the my_print_ht distribution])
  dnl fi

  dnl Remove this code block if the library supports pkg-config.
  dnl --with-my_print_ht -> add include path
  dnl PHP_ADD_INCLUDE($MY_PRINT_HT_DIR/include)

  dnl Remove this code block if the library supports pkg-config.
  dnl --with-my_print_ht -> check for lib and symbol presence
  dnl LIBNAME=MY_PRINT_HT # you may want to change this
  dnl LIBSYMBOL=MY_PRINT_HT # you most likely want to change this

  dnl If you need to check for a particular library function (e.g. a conditional
  dnl or version-dependent feature) and you are using pkg-config:
  dnl PHP_CHECK_LIBRARY($LIBNAME, $LIBSYMBOL,
  dnl [
  dnl   AC_DEFINE(HAVE_MY_PRINT_HT_FEATURE, 1, [ ])
  dnl ],[
  dnl   AC_MSG_ERROR([FEATURE not supported by your my_print_ht library.])
  dnl ], [
  dnl   $LIBFOO_LIBS
  dnl ])

  dnl If you need to check for a particular library function (e.g. a conditional
  dnl or version-dependent feature) and you are not using pkg-config:
  dnl PHP_CHECK_LIBRARY($LIBNAME, $LIBSYMBOL,
  dnl [
  dnl   PHP_ADD_LIBRARY_WITH_PATH($LIBNAME, $MY_PRINT_HT_DIR/$PHP_LIBDIR, MY_PRINT_HT_SHARED_LIBADD)
  dnl   AC_DEFINE(HAVE_MY_PRINT_HT_FEATURE, 1, [ ])
  dnl ],[
  dnl   AC_MSG_ERROR([FEATURE not supported by your my_print_ht library.])
  dnl ],[
  dnl   -L$MY_PRINT_HT_DIR/$PHP_LIBDIR -lm
  dnl ])
  dnl
  dnl PHP_SUBST(MY_PRINT_HT_SHARED_LIBADD)

  dnl In case of no dependencies
  AC_DEFINE(HAVE_MY_PRINT_HT, 1, [ Have my_print_ht support ])

  PHP_NEW_EXTENSION(my_print_ht, my_print_ht.c, $ext_shared)
fi
