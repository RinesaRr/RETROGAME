<?php
    try{
        $bdd = new PDO('mysql:host=localhost;dbname=retrogame;charset=utf8', 'root','');
    }catch(PDOExeption $e){
        die('Error'.$e->getMessage());
    }

?>