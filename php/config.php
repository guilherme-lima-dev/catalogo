<?php
/*header("Access-Control-Allow-Origin: *");
header('Content-Type: text/html; charset=utf-8');
$host = "mysql:host=mysql995.umbler.com;dbname=eba";
$usuario = "oi";
$senha = "ola";*/


header("Access-Control-Allow-Origin: *");
header('Content-Type: text/html; charset=utf-8');
$host = "mysql:host=localhost;dbname=db_catalago";
$usuario = "root";
$senha = "";


$conexao = new PDO($host, $usuario, $senha);

?>