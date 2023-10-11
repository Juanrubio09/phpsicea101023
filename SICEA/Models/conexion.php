<?php 
    // Create connection
    $conn = new mysqli('localhost', 'root', '', 'p24');
    // Check connection
    if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
    }    
?>