<?php include 'includes/header.php';

//Definir una clase
class Producto {
    //Public  - se puede modificar en cualquier lugar (clase y objeto)
    //Protected - se puede acceder unicamente en la clase y MODIFICAR utilizando GET - SET
    //Private - solo mienbros de la misma clase pueden acceder a el 

    protected $nombre;
    public $precio;
    public $disponible;

    /*
    se utiliza en php 8
    public function __construct(public string $nombre, public int $precio, public bool $disponible)
    {
        
    }
    */

    public function __construct(string $nombre, int $precio, bool $disponible)
    {
        $this->nombre = $nombre;
        $this->precio = $precio;
        $this->disponible = $disponible;
    }

    //metodo de clase
    public function mostrarProducto() : void {
        echo "El Producto es: " . $this->nombre . "y su preciio es " . $this->precio;
    }

    //Utilizacion del GET SET
    public function getNombre() : string{
        return $this->nombre;
    }

    //SET
    public function setNombre(string $nombre){
        $this->nombre = $nombre;
    }

}

$producto = new Producto("Jose",200,true);
$producto->mostrarProducto();

echo $producto->getNombre();


//permite acceder
//var_dump($producto->nombre);

//permite asignar el valor
//$producto->nombre = 'Tablet';

/*echo"<pre>";
var_dump($producto);
echo"</pre>";
include 'includes/footer.php';*/