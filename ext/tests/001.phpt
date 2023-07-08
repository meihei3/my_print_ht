--TEST--
Check if my_print_ht is loaded
--EXTENSIONS--
my_print_ht
--FILE--
<?php
echo 'The extension "my_print_ht" is available';
?>
--EXPECT--
The extension "my_print_ht" is available
