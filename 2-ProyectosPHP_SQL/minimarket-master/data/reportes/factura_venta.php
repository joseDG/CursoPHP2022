<?php
include_once '../../fpdf/rotation.php';
include_once '../../fpdf/fpdf.php';
include_once '../../admin/class.php';
include_once '../../admin/convertir.php';
include_once '../../admin/funciones_generales.php';
date_default_timezone_set('America/Guayaquil');
setlocale(LC_TIME, "spanish");
session_start();
$fecha  = date('Y-m-d H:i:s', time());
$class  = new constante();
$letras = new EnLetras();
// CONFIGURACIÓN PREVIA
//require('fpdf181/fpdf.php');
define('USD', chr(128));
$pdf = new FPDF('P', 'mm', array(80, 150));
$pdf->AddPage();

// CABECERA
$pdf->SetFont('Helvetica', '', 12);
$pdf->Cell(60, 4, 'www.crivelsistemas.com', 0, 1, 'C');
$pdf->SetFont('Helvetica', '', 8);
$pdf->Cell(60, 4, 'RUC.: 1004337182001', 0, 1, 'C');
$pdf->Cell(60, 4, 'C/ Sistemas y Seguridad Electronica, 1', 0, 1, 'C');
$pdf->Cell(60, 4, 'C.P.: 28028 Madrid (Ecuador)', 0, 1, 'C');
$pdf->Cell(60, 4, '0989711989', 0, 1, 'C');
$pdf->Cell(60, 4, 'soporte@crivelsistemas.com', 0, 1, 'C');

$resultado = $class->consulta("SELECT C.nombres_completos, C.identificacion, C.direccion, C.telefono2, C.ciudad, F.fecha_actual, F.forma_pago, F.tarifa0, F.tarifa, F.iva_venta, F.descuento_venta, F.total_venta, F.estado from factura_venta F, clientes C WHERE F.id_cliente = C.id AND F.id = '$_GET[id]'");
while ($row = $class->fetch_array($resultado)) {
// DATOS FACTURA
    $pdf->Ln(5);
    $pdf->Cell(60, 4, 'Factura Simpl.: F2019-000001', 0, 1, '');
    $pdf->Cell(60, 4, 'Fecha: ' . strtoupper($row[5]), 0, 1, '');
    $pdf->Cell(60, 4, 'Ced/RUC: ' . strtoupper($row[1]), 0, 1, '');
    $pdf->Cell(60, 4, 'Cliente: ' . strtoupper($row[0]), 0, 1, '');

}

// COLUMNAS
$pdf->SetFont('Helvetica', 'B', 7);
$pdf->Cell(30, 10, 'Articulo', 0);
$pdf->Cell(5, 10, 'Ud', 0, 0, 'R');
$pdf->Cell(10, 10, 'Precio', 0, 0, 'R');
$pdf->Cell(15, 10, 'Total', 0, 0, 'R');
$pdf->Ln(8);
$pdf->Cell(60, 0, '', 'T');
$pdf->Ln(0);

// PRODUCTOS
$pdf->SetFont('Helvetica', '', 7);
$resultado   = $class->consulta("SELECT D.cantidad, P.codigo, P.descripcion, D.precio, D.total FROM factura_venta F, detalle_factura_venta D, productos P WHERE F.id = D.id_factura_venta AND D.id_producto = P.id AND D.id_factura_venta = '$_GET[id]'");
$total_items = 0;
$posiciony   = 60;
while ($row = $class->fetch_array($resultado)) {
    $cantidad       = $row[0];
    $codigo         = $row[1];
    $descripcion    = $row[2];
    $valor_unitario = $row[3];
    $total_venta    = $row[4];
    $total_items    = $total_items + $cantidad;
    $pdf->MultiCell(30, 4, '' . strtoupper($row[2]), 0, 'L');
    $pdf->Cell(35, -5, '' . strtoupper($row[0]), 0, 0, 'R');
    $pdf->Cell(10, -5, '' . strtoupper($row[3]), 0, 0, 'R');
    $pdf->Cell(15, -5, '' . strtoupper($row[4]), 0, 0, 'R');
    $pdf->Ln(3);

    $posiciony = $posiciony + 5;
}

// SUMATORIO DE LOS PRODUCTOS Y EL IVA
$resultado = $class->consulta("SELECT C.nombres_completos, C.identificacion, C.direccion, C.telefono2, C.ciudad, F.fecha_actual, F.forma_pago, F.tarifa0, F.tarifa, F.iva_venta, F.descuento_venta, F.total_venta, F.estado from factura_venta F, clientes C WHERE F.id_cliente = C.id AND F.id = '$_GET[id]'");
while ($row = $class->fetch_array($resultado)) {
    $pdf->Ln(6);
    $pdf->Cell(60, 0, '', 'T');
    $pdf->Ln(2);
    $pdf->Cell(25, 10, 'TOTAL SIN I.V.A.', 0);
    $pdf->Cell(20, 10, '', 0);
    $pdf->Cell(15, 10, '' . strtoupper($row[8]), 0, 0, 'R');
    $pdf->Ln(3);
    $pdf->Cell(25, 10, 'I.V.A. 12%', 0);
    $pdf->Cell(20, 10, '', 0);
    $pdf->Cell(15, 10, '' . strtoupper($row[9]), 0, 0, 'R');
    $pdf->Ln(3);
    $pdf->Cell(25, 10, 'TOTAL', 0);
    $pdf->Cell(20, 10, '', 0);
    $pdf->Cell(15, 10, '' . strtoupper($row[11]), 0, 0, 'R');

}

// PIE DE PAGINA
$pdf->Ln(10);
$pdf->Cell(60, 0, 'EL PERIODO DE DEVOLUCIONES', 0, 1, 'C');
$pdf->Ln(3);
$pdf->Cell(60, 0, 'CADUCA EL DIA  01/11/2019', 0, 1, 'C');

$pdf->Output('ticket.pdf', 'i');
