<?php include 'includes/header.php';
//esta forma es mas segura
//mejora el performance
// Conectar a la BD con Mysqli.
$db = new mysqli('localhost', 'root', '', 'bienes_raices');

// Creamos el query
$query = "SELECT titulo, imagen from propiedades";

// Lo preparamos
$stmt = $db->prepare($query);

// Lo ejecutamos
$stmt->execute();

// creamos la variable
$stmt->bind_result($titulo, $imagen);

// imprimir el resultado
while($stmt->fetch()):
    var_dump($titulo);
endwhile;

include 'includes/footer.php';