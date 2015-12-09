<?php

	$json = array("re" => true, "status" => 0, "msg" => "without connection", "host" => "viniciusvale");

	/* Output header */
	header('Content-type: application/json');
	echo json_encode($json);
