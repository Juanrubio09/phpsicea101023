<?php 
header('Access-Control-Allow-Origin: *');
header("Access-Control-Allow-Headers: X-API-KEY, Origin, X-Requested-With, Content-Type, Accept, Access-Control-Request-Method");
header("Access-Control-Allow-Methods: GET, POST, OPTIONS, PUT, DELETE");
header("Allow: GET, POST, OPTIONS, PUT, DELETE");

include_once '../Models/conexion.php';

$username = $_GET['username'];
$password = md5($_GET['password']);

$sql = "SELECT * FROM tbusuario WHERE username = '$username' AND passwor = '$password'";
//print_r($sql);
$result = $conn->query($sql);

if ($result->num_rows > 0) {
  // output data of each row
  while($row = $result->fetch_assoc()) {
    echo json_encode($row);
  }
} else {
  echo json_encode(0);
}
$conn->close();

?>