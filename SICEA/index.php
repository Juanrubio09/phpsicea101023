<?php 
$sonido = 'Hola Mundo';
$valor = true;
$variable=10;

$array = ['Arroz', 'Azucar', 'Panela', ['cafe','crema', [1,2,3]] ];

echo $array[3][2][0]."</br>";

if($valor == true){
    // echo $sonido;
}

for($i =0; $i<6;$i++){
    echo $i."</br>";
}

switch ($variable) {
    case '1':
        echo "Valor uno";
        break;
    case '2':
        echo "Valor dos";
        break;
    
    default:
    echo "Valor nulo";
        break;
}

// while ($variable == 10) {
//     echo "Valor ". $variable;
// }
?>