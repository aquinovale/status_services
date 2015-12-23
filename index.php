<?php
	include 'banco.php';
                                       $supports = listar('ubuntu', ''); 
					header("content-type:application/json");
					echo json_encode($supports);

                ?>

