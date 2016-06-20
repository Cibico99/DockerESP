<?php

$nodeIP = $_GET["nodeIP"];

$res = file_put_contents('nodeIPs.txt',$nodeIP."\n",FILE_APPEND | LOCK_EX);

#if($res === FALSE){
#	echo "error!";
#}else{
#	echo "File written : " .  $_GET["nodeIP"];
#}




?>
