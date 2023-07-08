--TEST--
test1() Basic test
--EXTENSIONS--
my_print_ht
--FILE--
<?php
$ret = test1();

var_dump($ret);
?>
--EXPECT--
The extension my_print_ht is loaded and working!
NULL
