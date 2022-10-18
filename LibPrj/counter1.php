<?php
$file_name = "counter.txt";
$read_handle = fopen( $file_name, "r" );
if( $read_handle ){
    $counter = fgets( $read_handle, 4096 );
    echo $counter;
    $counter += 1;                       
    }
fclose($read_handle);
$write_handle = fopen( $file_name, "w" );
if( $write_handle ){
    fputs ($write_handle, "$counter");               
    }
fclose($write_handle);

?>