--TEST--
test2() Basic test
--EXTENSIONS--
my_print_ht
--FILE--
<?php
var_dump(test2());
var_dump(test2('PHP'));
?>
--EXPECT--
string(11) "Hello World"
string(9) "Hello PHP"
