<?php 
function validate($data){

       $data = htmlspecialchars(stripslashes(trim($data)));

       return $data;

    }
?>