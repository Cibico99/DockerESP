<?php

date_default_timezone_set('America/New_York');

$rest_json = file_get_contents("php://input");
$_POST = json_decode($rest_json, true);



$nodeMAC= $_POST["MAC"];
$nodeIP = $_POST["IP"];

$res = file_put_contents('nodeIPs.txt',$nodeMAC." : ".$nodeIP." : Time: ".date('m/d/Y H:i:s',time())."\n",FILE_APPEND | LOCK_EX);

if($res === FALSE){
	echo "error!";
}else{
	echo "MAC-IP Logged : " .  $nodeMAC . " - " . $nodeIP;
}




?>
