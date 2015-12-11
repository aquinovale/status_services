<?php

function conectar($user, $password) 
{
	$conn = new PDO('pgsql:dbname=heartbeatapp;host=localhost;', $user, $password) or die("Can't connect to database".pg_last_error());
	$conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_WARNING);
	return $conn;
}


function listar($userDB, $passwordDB ) 
{
	$consulta = "SELECT * FROM vw_heartbeat;";
	$conn = conectar($userDB, $passwordDB);
	$query = $conn->query($consulta);
	if(isset($fetch)){
		return $query->fetch();
	}	
	return $query->fetchAll();
}

?>
