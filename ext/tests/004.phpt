--TEST--
array_info() Basic test
--EXTENSIONS--
my_print_ht
--FILE--
<?php
array_info([]);
array_info([0, 1, 2, 3]);
?>
--EXPECT--
ht->nTableMask: 0xfffffffe
ht->nNumUsed: 0
ht->nTableSize: 8
ht->nNumOfElements: 0
ht->nNextFreeElement: 0
ht->nInternalPointer: 0
ht->nTableMask: 0xfffffffe
ht->nNumUsed: 4
ht->nTableSize: 8
ht->nNumOfElements: 4
ht->nNextFreeElement: 4
ht->nInternalPointer: 0
