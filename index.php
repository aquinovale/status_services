<?php
	include 'banco.php';
                                       $supports = listar('ubuntu', '123456'); 
					header("content-type:application/json");
					echo json_encode($supports);

                ?>

