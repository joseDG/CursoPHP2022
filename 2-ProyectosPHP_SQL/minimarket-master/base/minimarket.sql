--
-- PostgreSQL database dump
--

-- Dumped from database version 10.7
-- Dumped by pg_dump version 10.7

-- Started on 2020-08-04 12:10:35

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 1 (class 3079 OID 12924)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 3202 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 196 (class 1259 OID 59690)
-- Name: bodegas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bodegas (
    id integer NOT NULL,
    nombre_bodega text,
    ubicacion_bodega text,
    telefono_bodega text,
    principal text,
    observaciones text,
    estado text,
    fecha_creacion timestamp with time zone
);


ALTER TABLE public.bodegas OWNER TO postgres;

--
-- TOC entry 197 (class 1259 OID 59696)
-- Name: cargos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cargos (
    id integer NOT NULL,
    nombre_cargo text,
    principal text,
    observaciones text,
    estado text,
    fecha_creacion timestamp with time zone
);


ALTER TABLE public.cargos OWNER TO postgres;

--
-- TOC entry 198 (class 1259 OID 59702)
-- Name: categorias; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categorias (
    id integer NOT NULL,
    nombre_categoria text,
    principal text,
    observaciones text,
    estado text,
    fecha_creacion timestamp with time zone
);


ALTER TABLE public.categorias OWNER TO postgres;

--
-- TOC entry 199 (class 1259 OID 59708)
-- Name: clientes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.clientes (
    id integer NOT NULL,
    tipo_documento text,
    identificacion text,
    nombres_completos text,
    telefono1 text,
    telefono2 text,
    ciudad text,
    direccion text,
    correo text,
    cupo_credito text,
    observaciones text,
    estado text,
    fecha_creacion timestamp with time zone
);


ALTER TABLE public.clientes OWNER TO postgres;

--
-- TOC entry 200 (class 1259 OID 59714)
-- Name: cuentas_cobrar; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cuentas_cobrar (
    id integer NOT NULL,
    id_factura_venta integer,
    id_cliente integer,
    fecha_credito text,
    adelanto text,
    meses text,
    monto_credito text,
    saldo text,
    estado text,
    fecha_creacion timestamp with time zone
);


ALTER TABLE public.cuentas_cobrar OWNER TO postgres;

--
-- TOC entry 201 (class 1259 OID 59720)
-- Name: detalle_cuentas_cobrar; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.detalle_cuentas_cobrar (
    id integer NOT NULL,
    id_cuentas_cobrar integer,
    fecha_pago text,
    cuotas text,
    saldo text,
    estado text,
    fecha_creacion timestamp with time zone
);


ALTER TABLE public.detalle_cuentas_cobrar OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 59726)
-- Name: detalle_devolucion_compra; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.detalle_devolucion_compra (
    id integer NOT NULL,
    id_devolucion_compra integer,
    id_producto integer,
    cantidad text,
    precio text,
    descuento text,
    total text,
    estado text,
    fecha_creacion timestamp with time zone
);


ALTER TABLE public.detalle_devolucion_compra OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 59732)
-- Name: detalle_egreso; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.detalle_egreso (
    id integer NOT NULL,
    id_egreso integer,
    id_producto integer,
    cantidad text,
    precio text,
    descuento text,
    total text,
    estado text,
    fecha_creacion timestamp with time zone
);


ALTER TABLE public.detalle_egreso OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 59738)
-- Name: detalle_factura_compra; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.detalle_factura_compra (
    id integer NOT NULL,
    id_factura_compra integer,
    id_producto integer,
    cantidad text,
    precio text,
    descuento text,
    total text,
    estado text,
    fecha_creacion timestamp with time zone
);


ALTER TABLE public.detalle_factura_compra OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 59744)
-- Name: detalle_factura_venta; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.detalle_factura_venta (
    id integer NOT NULL,
    id_factura_venta integer,
    id_producto integer,
    cantidad text,
    precio text,
    descuento text,
    total text,
    pendientes text,
    estado text,
    fecha_creacion timestamp with time zone
);


ALTER TABLE public.detalle_factura_venta OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 59750)
-- Name: detalle_ingreso; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.detalle_ingreso (
    id integer NOT NULL,
    id_ingreso integer,
    id_producto integer,
    cantidad text,
    precio text,
    descuento text,
    total text,
    estado text,
    fecha_creacion timestamp with time zone
);


ALTER TABLE public.detalle_ingreso OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 59756)
-- Name: detalle_inventario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.detalle_inventario (
    id integer NOT NULL,
    id_inventario integer,
    id_producto integer,
    precio_costo text,
    precio_venta text,
    disponibles text,
    existencia text,
    diferencia text,
    estado text,
    fecha_creacion timestamp with time zone
);


ALTER TABLE public.detalle_inventario OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 59762)
-- Name: detalle_nota_venta; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.detalle_nota_venta (
    id integer NOT NULL,
    id_nota_venta integer,
    id_producto integer,
    cantidad text,
    precio text,
    descuento text,
    total text,
    pendientes text,
    estado text,
    fecha_creacion timestamp with time zone
);


ALTER TABLE public.detalle_nota_venta OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 59768)
-- Name: detalle_proforma; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.detalle_proforma (
    id integer NOT NULL,
    id_proforma integer,
    id_producto integer,
    cantidad text,
    precio text,
    descuento text,
    total text,
    estado text,
    fecha_creacion timestamp with time zone
);


ALTER TABLE public.detalle_proforma OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 59774)
-- Name: detalle_transaccion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.detalle_transaccion (
    id integer NOT NULL,
    id_transaccion integer,
    id_plan_cuentas integer,
    debito text,
    credito text,
    estado text,
    fecha_creacion timestamp with time zone
);


ALTER TABLE public.detalle_transaccion OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 59780)
-- Name: devolucion_compra; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.devolucion_compra (
    id integer NOT NULL,
    id_empresa integer,
    id_proveedor integer,
    id_usuario integer,
    id_factura_compra integer,
    comprobante text,
    fecha_actual text,
    hora_actual text,
    subtotal text,
    tarifa0 text,
    tarifa text,
    iva_devolucion text,
    descuento_devolucion text,
    total_devolucion text,
    observaciones text,
    estado text,
    fecha_creacion timestamp with time zone
);


ALTER TABLE public.devolucion_compra OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 59786)
-- Name: egreso; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.egreso (
    id integer NOT NULL,
    id_empresa integer,
    id_usuario integer,
    fecha_actual text,
    hora_actual text,
    origen text,
    destino text,
    subtotal text,
    tarifa0 text,
    tarifa text,
    iva_egreso text,
    descuento_egreso text,
    total_egreso text,
    observaciones text,
    estado text,
    fecha_creacion timestamp with time zone
);


ALTER TABLE public.egreso OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 59792)
-- Name: empresa; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.empresa (
    id integer NOT NULL,
    ruc_empresa text,
    propietario text,
    nombre_empresa text,
    slogan text,
    telefono1 text,
    telefono2 text,
    ciudad text,
    direccion text,
    correo text,
    fax text,
    sitio_web text,
    imagen text,
    observaciones text,
    estado text,
    fecha_creacion timestamp with time zone
);


ALTER TABLE public.empresa OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 59798)
-- Name: factura_compra; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.factura_compra (
    id integer NOT NULL,
    id_empresa integer,
    id_proveedor integer,
    id_usuario integer,
    comprobante text,
    fecha_actual text,
    hora_actual text,
    fecha_registro text,
    fecha_emision text,
    fecha_caducidad text,
    tipo_comprobante integer,
    serie text,
    autorizacion text,
    fecha_cancelacion text,
    forma_pago text,
    subtotal text,
    tarifa0 text,
    tarifa text,
    iva_compra text,
    descuento_compra text,
    total_compra text,
    pago_ats text,
    temporal text,
    observaciones text,
    retiene_fuente text,
    retiene_iva text,
    retiene_ice text,
    estado text,
    fecha_creacion timestamp with time zone
);


ALTER TABLE public.factura_compra OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 59804)
-- Name: factura_venta; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.factura_venta (
    id integer NOT NULL,
    id_empresa integer,
    id_cliente integer,
    id_usuario integer,
    comprobante text,
    serie text,
    fecha_actual text,
    hora_actual text,
    fecha_cancelacion text,
    tipo_comprobante text,
    tipo_precio text,
    forma_pago text,
    autorizacion text,
    fecha_autorizacion text,
    fecha_caducidad text,
    subtotal text,
    tarifa0 text,
    tarifa text,
    iva_venta text,
    descuento_venta text,
    total_venta text,
    efectivo text,
    cambio text,
    fecha_anulacion text,
    temporal text,
    estado text,
    fecha_creacion timestamp with time zone
);


ALTER TABLE public.factura_venta OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 59810)
-- Name: facturero; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.facturero (
    id integer NOT NULL,
    fecha_inicio text,
    fecha_caducidad text,
    inicio_facturero text,
    finaliza_facturero text,
    autorizacion text,
    num_items text,
    estado text,
    fecha_creacion timestamp with time zone
);


ALTER TABLE public.facturero OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 59816)
-- Name: formas_pago; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.formas_pago (
    id integer NOT NULL,
    codigo text,
    nombre_forma text,
    principal text,
    observaciones text,
    estado text,
    fecha_creacion timestamp with time zone
);


ALTER TABLE public.formas_pago OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 59822)
-- Name: ingreso; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ingreso (
    id integer NOT NULL,
    id_empresa integer,
    id_usuario integer,
    fecha_actual text,
    hora_actual text,
    origen text,
    destino text,
    subtotal text,
    tarifa0 text,
    tarifa text,
    iva_ingreso text,
    descuento_ingreso text,
    total_ingreso text,
    observaciones text,
    estado text,
    fecha_creacion timestamp with time zone
);


ALTER TABLE public.ingreso OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 59828)
-- Name: inventario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.inventario (
    id integer NOT NULL,
    id_empresa integer,
    id_usuario integer,
    comprobante text,
    fecha_actual text,
    hora_actual text,
    estado text,
    fecha_creacion timestamp with time zone
);


ALTER TABLE public.inventario OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 59834)
-- Name: kardex; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kardex (
    id integer NOT NULL,
    id_producto integer,
    fecha_kardex text,
    detalle text,
    cantidad text,
    valor_unitario text,
    total text,
    saldo text,
    origen text,
    destino text,
    estado text,
    fecha_creacion timestamp with time zone
);


ALTER TABLE public.kardex OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 59840)
-- Name: kardex_valorizado; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kardex_valorizado (
    id integer NOT NULL,
    id_producto integer,
    fecha_kardex text,
    detalle_kardex text,
    cantidad_entrada text,
    precio_unitario_entrada text,
    precio_total_entrada text,
    cantidad_salida text,
    precio_unitario_salida text,
    precio_total_salida text,
    cantidad_total text,
    precio_unitario_total text,
    precio_total text,
    estado text,
    fecha_creacion timestamp with time zone
);


ALTER TABLE public.kardex_valorizado OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 59846)
-- Name: libro_diario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.libro_diario (
    id integer NOT NULL,
    fecha text,
    detalle text,
    debe text,
    haber text,
    descripcion text,
    estado text,
    fecha_creacion timestamp with time zone
);


ALTER TABLE public.libro_diario OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 59852)
-- Name: marcas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.marcas (
    id integer NOT NULL,
    nombre_marca text,
    principal text,
    observaciones text,
    estado text,
    fecha_creacion timestamp with time zone
);


ALTER TABLE public.marcas OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 59858)
-- Name: movimientos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.movimientos (
    id integer NOT NULL,
    id_producto integer,
    fecha_movimiento text,
    saldo_inicial text,
    entradas text,
    salidas text,
    saldo text,
    estado text,
    fecha_creacion timestamp with time zone
);


ALTER TABLE public.movimientos OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 59864)
-- Name: nota_venta; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.nota_venta (
    id integer NOT NULL,
    id_empresa integer,
    id_cliente integer,
    id_usuario integer,
    comprobante text,
    fecha_actual text,
    hora_actual text,
    tipo_comprobante text,
    tipo_precio text,
    forma_pago text,
    subtotal text,
    tarifa0 text,
    tarifa text,
    iva_nota text,
    descuento_nota text,
    total_nota text,
    estado text,
    fecha_creacion timestamp with time zone
);


ALTER TABLE public.nota_venta OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 59870)
-- Name: parametros; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.parametros (
    id integer NOT NULL,
    descripcion text,
    valor text,
    cuenta_debito text,
    cuenta_credito text,
    estado text,
    fecha_creacion timestamp with time zone
);


ALTER TABLE public.parametros OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 59876)
-- Name: plan_cuentas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.plan_cuentas (
    id integer NOT NULL,
    codigo text,
    nombre_plan text,
    cuenta text,
    estado text,
    fecha_creacion timestamp with time zone
);


ALTER TABLE public.plan_cuentas OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 59882)
-- Name: porcentaje_iva; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.porcentaje_iva (
    id integer NOT NULL,
    nombre_porcentaje text,
    porcentaje text,
    principal text,
    observaciones text,
    estado text,
    fecha_creacion timestamp with time zone
);


ALTER TABLE public.porcentaje_iva OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 59888)
-- Name: privilegios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.privilegios (
    id integer NOT NULL,
    id_usuario integer,
    data text,
    estado text,
    fecha_creacion timestamp with time zone
);


ALTER TABLE public.privilegios OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 59894)
-- Name: productos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.productos (
    id integer NOT NULL,
    codigo_barras text,
    codigo text,
    descripcion text,
    precio_costo text,
    utlididad_minorista text,
    utilidad_mayorista text,
    precio_minorista text,
    precio_mayorista text,
    id_tipo_producto text,
    id_categoria text,
    id_marca text,
    id_unidad_medida text,
    id_bodega text,
    id_porcentaje integer,
    incluye_iva text,
    stock text,
    stock_minimo text,
    stock_maximo text,
    descuento text,
    expiracion text,
    facturar_existencia text,
    id_proveedor text,
    ubicacion text,
    series text,
    imagen text,
    observaciones text,
    estado text,
    fecha_creacion timestamp with time zone
);


ALTER TABLE public.productos OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 59900)
-- Name: proforma; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.proforma (
    id integer NOT NULL,
    id_empresa integer,
    id_cliente integer,
    id_usuario integer,
    fecha_actual text,
    hora_actual text,
    tipo_precio text,
    subtotal text,
    tarifa0 text,
    tarifa text,
    iva_proforma text,
    descuento_proforma text,
    total_proforma text,
    observaciones text,
    estado text,
    fecha_creacion timestamp with time zone
);


ALTER TABLE public.proforma OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 59906)
-- Name: proveedores; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.proveedores (
    id integer NOT NULL,
    tipo_documento text,
    identificacion text,
    empresa text,
    representante_legal text,
    visitador text,
    telefono1 text,
    telefono2 text,
    ciudad text,
    direccion text,
    correo text,
    sitio_web text,
    cupo_credito text,
    formas_pago text,
    proveedor_principal text,
    observaciones text,
    estado text,
    fecha_creacion timestamp with time zone
);


ALTER TABLE public.proveedores OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 59912)
-- Name: retencion_fuente; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.retencion_fuente (
    id integer NOT NULL,
    nombre_fuente text,
    valor text,
    codigo_formulario text,
    cuenta_debito text,
    cuenta_credito text,
    estado text,
    fecha_creacion timestamp with time zone
);


ALTER TABLE public.retencion_fuente OWNER TO postgres;

--
-- TOC entry 234 (class 1259 OID 59918)
-- Name: retencion_fuente_compra; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.retencion_fuente_compra (
    id integer NOT NULL,
    id_factura_compra integer,
    id_retencion_fuente integer,
    fecha_actual text,
    hora_actual text,
    valor_factura text,
    iva_compra text,
    valor_retencion text,
    autorizacion text,
    serie text,
    estado text,
    fecha_creacion timestamp with time zone
);


ALTER TABLE public.retencion_fuente_compra OWNER TO postgres;

--
-- TOC entry 235 (class 1259 OID 59924)
-- Name: retencion_fuente_venta; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.retencion_fuente_venta (
    id integer NOT NULL,
    id_factura_venta integer,
    id_retencion_fuente integer,
    fecha_actual text,
    hora_actual text,
    valor_factura text,
    iva_venta text,
    valor_retencion text,
    autorizacion text,
    serie text,
    estado text,
    fecha_creacion timestamp with time zone
);


ALTER TABLE public.retencion_fuente_venta OWNER TO postgres;

--
-- TOC entry 236 (class 1259 OID 59930)
-- Name: retencion_iva; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.retencion_iva (
    id integer NOT NULL,
    nombre_iva text,
    valor text,
    codigo_formulario text,
    cuenta_debito text,
    cuenta_credito text,
    estado text,
    fecha_creacion timestamp with time zone
);


ALTER TABLE public.retencion_iva OWNER TO postgres;

--
-- TOC entry 237 (class 1259 OID 59936)
-- Name: retencion_iva_compra; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.retencion_iva_compra (
    id integer NOT NULL,
    id_factura_compra integer,
    id_retencion_iva integer,
    fecha_actual text,
    hora_actual text,
    valor_factura text,
    iva_factura text,
    valor_retencion text,
    autorizacion text,
    serie text,
    estado text,
    fecha_creacion timestamp with time zone
);


ALTER TABLE public.retencion_iva_compra OWNER TO postgres;

--
-- TOC entry 238 (class 1259 OID 59942)
-- Name: retencion_iva_venta; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.retencion_iva_venta (
    id integer NOT NULL,
    id_factura_venta integer,
    id_retencion_iva integer,
    fecha_actual text,
    hora_actual text,
    valor_factura text,
    iva_venta text,
    valor_retencion text,
    autorizacion text,
    serie text,
    estado text,
    fecha_creacion timestamp with time zone
);


ALTER TABLE public.retencion_iva_venta OWNER TO postgres;

--
-- TOC entry 239 (class 1259 OID 59948)
-- Name: talonario_retencion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.talonario_retencion (
    id integer NOT NULL,
    fecha_inicio text,
    fecha_caducidad text,
    inicio_talonario text,
    finaliza_talonario text,
    autorizacion text,
    estado text,
    fecha_creacion timestamp with time zone
);


ALTER TABLE public.talonario_retencion OWNER TO postgres;

--
-- TOC entry 240 (class 1259 OID 59954)
-- Name: tipo_comprobante; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tipo_comprobante (
    id integer NOT NULL,
    codigo text,
    nombre_tipo_comprobante text,
    principal text,
    observaciones text,
    estado text,
    fecha_creacion timestamp with time zone
);


ALTER TABLE public.tipo_comprobante OWNER TO postgres;

--
-- TOC entry 241 (class 1259 OID 59960)
-- Name: tipo_producto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tipo_producto (
    id integer NOT NULL,
    nombre_tipo text,
    principal text,
    observaciones text,
    estado text,
    fecha_creacion timestamp with time zone
);


ALTER TABLE public.tipo_producto OWNER TO postgres;

--
-- TOC entry 242 (class 1259 OID 59966)
-- Name: tipo_transaccion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tipo_transaccion (
    id integer NOT NULL,
    abreviatura text,
    nombre_transaccion text,
    principal text,
    observaciones text,
    estado text,
    fecha_creacion timestamp with time zone
);


ALTER TABLE public.tipo_transaccion OWNER TO postgres;

--
-- TOC entry 243 (class 1259 OID 59972)
-- Name: transaccion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.transaccion (
    id integer NOT NULL,
    id_usuario text,
    comprobante text,
    fecha_actual text,
    hora_actual text,
    concepto text,
    total_debe text,
    total_haber text,
    saldo text,
    id_tipo_transaccion integer,
    num_transaccion text,
    estado text,
    fecha_creacion timestamp with time zone
);


ALTER TABLE public.transaccion OWNER TO postgres;

--
-- TOC entry 244 (class 1259 OID 59978)
-- Name: unidades_medida; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.unidades_medida (
    id integer NOT NULL,
    nombre_unidad text,
    abreviatura text,
    cantidad text,
    principal text,
    observaciones text,
    estado text,
    fecha_creacion timestamp with time zone
);


ALTER TABLE public.unidades_medida OWNER TO postgres;

--
-- TOC entry 245 (class 1259 OID 59984)
-- Name: usuarios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usuarios (
    id integer NOT NULL,
    identificacion text,
    nombres_completos text,
    telefono1 text,
    telefono2 text,
    ciudad text,
    direccion text,
    correo text,
    usuario text,
    clave text,
    id_cargo integer,
    imagen text,
    observaciones text,
    estado text,
    fecha_creacion timestamp with time zone
);


ALTER TABLE public.usuarios OWNER TO postgres;

--
-- TOC entry 3145 (class 0 OID 59690)
-- Dependencies: 196
-- Data for Name: bodegas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.bodegas (id, nombre_bodega, ubicacion_bodega, telefono_bodega, principal, observaciones, estado, fecha_creacion) FROM stdin;
1	PRINCIPAL	Localssss		Si		1	2017-03-31 16:05:17-05
2	SECUNDARIO	Local 2		No		1	2017-03-31 16:05:27-05
3	Matriz	Sede		No		2	2017-02-14 09:45:07-05
\.


--
-- TOC entry 3146 (class 0 OID 59696)
-- Dependencies: 197
-- Data for Name: cargos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cargos (id, nombre_cargo, principal, observaciones, estado, fecha_creacion) FROM stdin;
1	ADMINISTRADOR	Si		1	2017-02-14 09:08:14-05
2	ASISTENTE	No		1	2017-02-14 09:08:31-05
3	VENDEDORES	No		1	2020-06-13 19:22:20-05
4	CONTADORA	No		1	2020-06-13 19:22:26-05
\.


--
-- TOC entry 3147 (class 0 OID 59702)
-- Dependencies: 198
-- Data for Name: categorias; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.categorias (id, nombre_categoria, principal, observaciones, estado, fecha_creacion) FROM stdin;
1	HP	No	Ninguna	1	2016-05-12 17:13:02-05
2	Acces	No	Ninguna	1	2016-05-12 17:13:14-05
3	MAC	No	Ninguna	1	2016-05-17 09:45:35-05
4	DELL	No	Ninguna	1	2017-04-10 13:05:58-05
\.


--
-- TOC entry 3148 (class 0 OID 59708)
-- Dependencies: 199
-- Data for Name: clientes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.clientes (id, tipo_documento, identificacion, nombres_completos, telefono1, telefono2, ciudad, direccion, correo, cupo_credito, observaciones, estado, fecha_creacion) FROM stdin;
3	RUC	1002969390001	CEVALLOS SARAUZ LORENA MARGARITA		(099) 999-9999	COTACACHI	Plaza		0.000		1	2017-02-14 09:50:29-05
1	CEDULA	1004358584	OSCAR TROYA		(098) 947-5676	OTAVALO	Miguel Egas y Morales	oskrs11@hotmail.com	1.000	Ninguna	1	2017-02-09 16:38:47-05
4	CEDULA	1001470051	ORQUERA FREILE JAIME RAUL		(099) 999-9999		IBARRA		0.00		1	2017-04-04 16:36:01-05
5	RUC	1004358584001	LUIS FRANCO		(099) 999-9999		ATUNTAQUI		0.00		1	2017-04-04 16:37:23-05
2	RUC	1723195598001	ZHUANG YUZHU		(099) 999-9999	QUITO	Calderon		0.00		1	2017-04-05 14:57:15-05
\.


--
-- TOC entry 3149 (class 0 OID 59714)
-- Dependencies: 200
-- Data for Name: cuentas_cobrar; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cuentas_cobrar (id, id_factura_venta, id_cliente, fecha_credito, adelanto, meses, monto_credito, saldo, estado, fecha_creacion) FROM stdin;
\.


--
-- TOC entry 3150 (class 0 OID 59720)
-- Dependencies: 201
-- Data for Name: detalle_cuentas_cobrar; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.detalle_cuentas_cobrar (id, id_cuentas_cobrar, fecha_pago, cuotas, saldo, estado, fecha_creacion) FROM stdin;
\.


--
-- TOC entry 3151 (class 0 OID 59726)
-- Dependencies: 202
-- Data for Name: detalle_devolucion_compra; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.detalle_devolucion_compra (id, id_devolucion_compra, id_producto, cantidad, precio, descuento, total, estado, fecha_creacion) FROM stdin;
\.


--
-- TOC entry 3152 (class 0 OID 59732)
-- Dependencies: 203
-- Data for Name: detalle_egreso; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.detalle_egreso (id, id_egreso, id_producto, cantidad, precio, descuento, total, estado, fecha_creacion) FROM stdin;
1	1	2	10	1.000	0	10.000	1	2017-03-31 15:59:31-05
2	2	2	50	1.000	0	50.000	1	2017-04-06 14:55:25-05
3	3	2	10	1.000	0	10.000	1	2017-04-11 11:39:16-05
\.


--
-- TOC entry 3153 (class 0 OID 59738)
-- Dependencies: 204
-- Data for Name: detalle_factura_compra; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.detalle_factura_compra (id, id_factura_compra, id_producto, cantidad, precio, descuento, total, estado, fecha_creacion) FROM stdin;
\.


--
-- TOC entry 3154 (class 0 OID 59744)
-- Dependencies: 205
-- Data for Name: detalle_factura_venta; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.detalle_factura_venta (id, id_factura_venta, id_producto, cantidad, precio, descuento, total, pendientes, estado, fecha_creacion) FROM stdin;
\.


--
-- TOC entry 3155 (class 0 OID 59750)
-- Dependencies: 206
-- Data for Name: detalle_ingreso; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.detalle_ingreso (id, id_ingreso, id_producto, cantidad, precio, descuento, total, estado, fecha_creacion) FROM stdin;
1	1	2	10	1.000	0	10.000	1	2017-03-31 15:47:49-05
2	2	2	1	1.000	0	1.000	1	2017-04-06 15:02:46-05
3	3	3	20	1.000	0	20.000	1	2017-04-11 11:39:52-05
\.


--
-- TOC entry 3156 (class 0 OID 59756)
-- Dependencies: 207
-- Data for Name: detalle_inventario; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.detalle_inventario (id, id_inventario, id_producto, precio_costo, precio_venta, disponibles, existencia, diferencia, estado, fecha_creacion) FROM stdin;
1	1	2	1.000	1.500	3	3	0	1	2017-02-14 17:02:14-05
2	2	2	1.000	1.500	2	2	-1	1	2017-02-14 17:03:03-05
3	2	3	1.000	1.500	6	6	0	1	2017-02-14 17:03:03-05
4	3	2	1.000	1.500	4	4	1	1	2017-02-14 17:07:53-05
5	4	2	1.000	1.500	10	10	6	1	2017-02-14 17:18:21-05
6	4	6	43.000	54.000	8	8	8	1	2017-02-14 17:18:21-05
7	5	2	1.000	1.500	2	2	-8	1	2017-02-15 09:07:01-05
8	6	2	1.000	1.500	1	1	-1	1	2017-02-15 09:09:08-05
9	7	2	1.000	1.500	1	1	0	1	2017-02-15 09:12:35-05
10	8	2	1.000	1.500	1	1	0	1	2017-02-15 12:46:03-05
11	9	10	500.000	800.000	100	100	-100	1	2017-02-24 16:00:30-05
12	10	10	500.000	800.000	300	300	200	1	2017-02-24 16:00:54-05
13	11	16	5.000	7.000	10	10	10	1	2017-03-03 11:39:48-05
14	12	16	5.000	7.000	10	10	10	1	2017-03-03 11:55:44-05
15	13	16	5.000	7.000	20	20	10	1	2017-03-03 11:58:43-05
16	14	2	1.000	1.500	50	50	27	1	2017-04-07 12:59:18-05
\.


--
-- TOC entry 3157 (class 0 OID 59762)
-- Dependencies: 208
-- Data for Name: detalle_nota_venta; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.detalle_nota_venta (id, id_nota_venta, id_producto, cantidad, precio, descuento, total, pendientes, estado, fecha_creacion) FROM stdin;
\.


--
-- TOC entry 3158 (class 0 OID 59768)
-- Dependencies: 209
-- Data for Name: detalle_proforma; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.detalle_proforma (id, id_proforma, id_producto, cantidad, precio, descuento, total, estado, fecha_creacion) FROM stdin;
\.


--
-- TOC entry 3159 (class 0 OID 59774)
-- Dependencies: 210
-- Data for Name: detalle_transaccion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.detalle_transaccion (id, id_transaccion, id_plan_cuentas, debito, credito, estado, fecha_creacion) FROM stdin;
\.


--
-- TOC entry 3160 (class 0 OID 59780)
-- Dependencies: 211
-- Data for Name: devolucion_compra; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.devolucion_compra (id, id_empresa, id_proveedor, id_usuario, id_factura_compra, comprobante, fecha_actual, hora_actual, subtotal, tarifa0, tarifa, iva_devolucion, descuento_devolucion, total_devolucion, observaciones, estado, fecha_creacion) FROM stdin;
\.


--
-- TOC entry 3161 (class 0 OID 59786)
-- Dependencies: 212
-- Data for Name: egreso; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.egreso (id, id_empresa, id_usuario, fecha_actual, hora_actual, origen, destino, subtotal, tarifa0, tarifa, iva_egreso, descuento_egreso, total_egreso, observaciones, estado, fecha_creacion) FROM stdin;
1	1	1	2017-03-31	3:59:31 PM	etwert	wertwertwe	8.772	0.000	8.772	1.228	0.000	10.00	gdfgdfgdfgd	1	2017-03-31 15:59:31-05
2	1	1	2017-04-06	2:55:24 PM	QQQQQ	DDDDDD	43.860	0.000	43.860	6.140	0.000	50.00		1	2017-04-06 14:55:25-05
3	1	1	2017-04-11	11:39:16 AM	adasd	asdasd	8.772	0.000	8.772	1.228	0.000	10.00	dasdasdasd	1	2017-04-11 11:39:16-05
\.


--
-- TOC entry 3162 (class 0 OID 59792)
-- Dependencies: 213
-- Data for Name: empresa; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.empresa (id, ruc_empresa, propietario, nombre_empresa, slogan, telefono1, telefono2, ciudad, direccion, correo, fax, sitio_web, imagen, observaciones, estado, fecha_creacion) FROM stdin;
1	1002880480001	PUGA PLACENCIA JORGE ARMANDO	CRIVEL			(098) 319-2959	QUITO	Caldas Oe1-222 y Vargas	ventas@megapisosgypsum.com		www.megapisosgypsum.com	1.png	Ninguno	1	2020-01-29 08:49:02-05
\.


--
-- TOC entry 3163 (class 0 OID 59798)
-- Dependencies: 214
-- Data for Name: factura_compra; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.factura_compra (id, id_empresa, id_proveedor, id_usuario, comprobante, fecha_actual, hora_actual, fecha_registro, fecha_emision, fecha_caducidad, tipo_comprobante, serie, autorizacion, fecha_cancelacion, forma_pago, subtotal, tarifa0, tarifa, iva_compra, descuento_compra, total_compra, pago_ats, temporal, observaciones, retiene_fuente, retiene_iva, retiene_ice, estado, fecha_creacion) FROM stdin;
\.


--
-- TOC entry 3164 (class 0 OID 59804)
-- Dependencies: 215
-- Data for Name: factura_venta; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.factura_venta (id, id_empresa, id_cliente, id_usuario, comprobante, serie, fecha_actual, hora_actual, fecha_cancelacion, tipo_comprobante, tipo_precio, forma_pago, autorizacion, fecha_autorizacion, fecha_caducidad, subtotal, tarifa0, tarifa, iva_venta, descuento_venta, total_venta, efectivo, cambio, fecha_anulacion, temporal, estado, fecha_creacion) FROM stdin;
\.


--
-- TOC entry 3165 (class 0 OID 59810)
-- Dependencies: 216
-- Data for Name: facturero; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.facturero (id, fecha_inicio, fecha_caducidad, inicio_facturero, finaliza_facturero, autorizacion, num_items, estado, fecha_creacion) FROM stdin;
1	2017-02-21	2018-02-21	201	301	12345678	10	1	2017-04-10 11:08:22-05
2	2020-02-04	2020-02-19	1235	4566	123456	10	2	2020-02-28 13:45:14-05
\.


--
-- TOC entry 3166 (class 0 OID 59816)
-- Dependencies: 217
-- Data for Name: formas_pago; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.formas_pago (id, codigo, nombre_forma, principal, observaciones, estado, fecha_creacion) FROM stdin;
2	02	CHEQUE PROPIO	No		1	2017-02-21 15:42:33-05
3	03	CHEQUE CERTIFICADO	No		1	2017-02-21 15:45:03-05
4	04	CHEQUE DE GERENCIA	No		1	2017-02-21 15:45:24-05
5	05	CHEQUE DEL EXTERIOR	No		1	2017-02-21 15:45:36-05
6	06	DÉBITO DE CUENTA	No		1	2017-02-21 15:45:48-05
7	07	TRANSFERENCIA PROPIO BANCO	No		1	2017-02-21 15:46:01-05
1	01	SIN UTILIZACION DEL SISTEMA FINANCIERO	Si		1	2017-02-21 15:46:09-05
8	08	TRANSFERENCIA OTRO BANCO NACIONAL	No		1	2017-02-21 15:46:22-05
9	09	TRANSFERENCIA  BANCO EXTERIOR	No		1	2017-02-21 15:46:39-05
10	10	TARJETA DE CRÉDITO NACIONAL	No		1	2017-02-21 15:47:15-05
11	11	TARJETA DE CRÉDITO INTERNACIONAL	No		1	2017-02-21 15:47:35-05
12	12	GIRO	No		1	2017-02-21 15:47:46-05
13	13	DEPOSITO EN CUENTA (CORRIENTE/AHORROS)	No		1	2017-02-21 15:47:59-05
14	14	ENDOSO DE INVERSIÓN	No		1	2017-02-21 15:48:13-05
15	15	COMPENSACIÓN DE DEUDAS	No		1	2017-02-21 15:48:24-05
16	16	TARJETA DE DÉBITO	No		1	2017-02-21 15:48:36-05
17	17	DINERO ELECTRÓNICO	No		1	2017-02-21 15:48:46-05
18	18	TARJETA PREPAGO	No		1	2017-02-21 15:49:02-05
19	19	TARJETA DE CRÉDITO	No		1	2017-02-21 15:49:13-05
20	20	OTROS CON UTILIZACION DEL SISTEMA FINANCIERO	No		1	2017-02-21 15:49:25-05
21	21	ENDOSO DE TÍTULOS	No		1	2017-02-21 15:49:35-05
\.


--
-- TOC entry 3167 (class 0 OID 59822)
-- Dependencies: 218
-- Data for Name: ingreso; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ingreso (id, id_empresa, id_usuario, fecha_actual, hora_actual, origen, destino, subtotal, tarifa0, tarifa, iva_ingreso, descuento_ingreso, total_ingreso, observaciones, estado, fecha_creacion) FROM stdin;
1	1	1	2017-03-31	3:47:49 PM	tertrwre	ewrtwert	8.772	0.000	8.772	1.228	0.000	10.00	SDFGSDFG	1	2017-03-31 15:47:49-05
2	1	1	2017-04-06	3:02:46 PM	GHHDFGH	FGHDFGHDFGH	0.877	0.000	0.877	0.123	0.000	1.00		1	2017-04-06 15:02:46-05
3	1	1	2017-04-11	11:39:52 AM	asdasdasd	asdasdasdasd	17.544	0.000	17.544	2.456	0.000	20.00		1	2017-04-11 11:39:52-05
\.


--
-- TOC entry 3168 (class 0 OID 59828)
-- Dependencies: 219
-- Data for Name: inventario; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.inventario (id, id_empresa, id_usuario, comprobante, fecha_actual, hora_actual, estado, fecha_creacion) FROM stdin;
1	\N	\N	\N	\N	\N	\N	\N
2	\N	\N	\N	\N	\N	\N	\N
3	\N	\N	\N	\N	\N	\N	\N
4	\N	\N	\N	\N	\N	\N	\N
5	\N	\N	\N	\N	\N	\N	\N
6	\N	\N	\N	\N	\N	\N	\N
7	\N	\N	\N	\N	\N	\N	\N
8	1	1	8	2017-02-15	12:46:02 AM	1	2017-02-15 12:46:03-05
9	1	1	9	2017-02-24	4:00:29 PM	1	2017-02-24 16:00:30-05
10	1	1	10	2017-02-24	4:00:54 PM	1	2017-02-24 16:00:54-05
11	1	1	11	2017-03-03	11:39:48 AM	1	2017-03-03 11:39:48-05
12	1	1	12	2017-03-03	11:55:43 AM	1	2017-03-03 11:55:44-05
13	1	1	13	2017-03-03	11:58:43 AM	1	2017-03-03 11:58:43-05
14	1	1	14	2017-04-07	12:59:18 AM	1	2017-04-07 12:59:18-05
\.


--
-- TOC entry 3169 (class 0 OID 59834)
-- Dependencies: 220
-- Data for Name: kardex; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kardex (id, id_producto, fecha_kardex, detalle, cantidad, valor_unitario, total, saldo, origen, destino, estado, fecha_creacion) FROM stdin;
1	1	17-05-2016	C.P	6	1.000	6.000	6			5	2016-05-17 10:09:11-05
2	2	17-05-2016	C.P	15	1.000	15.000	15			5	2016-05-17 10:15:59-05
3	3	02-06-2016	C.P	0	654.000	0.000	0			5	2016-06-02 09:13:31-05
4	4	02-06-2016	C.P	0	543.000	0.000	0			5	2016-06-02 12:39:30-05
6	10	14-02-2017	C.P	100	100.000	10000.000	100			5	2017-02-14 10:15:53-05
5	9	14-02-2017	C.P	0	500.000	0.000	0			5	2017-02-14 10:11:29-05
7	2	15-02-2017	INV.	1			1			6	2017-02-15 09:09:08-05
8	2	15-02-2017	INV.	1			1			6	2017-02-15 09:12:35-05
9	2	15-02-2017	INV.	1			1			6	2017-02-15 12:45:23-05
10	2	15-02-2017	INV.	1			1			6	2017-02-15 12:46:03-05
11	11	15-02-2017	C.P	0	1038.590	0.000	0			5	2017-02-15 16:47:31-05
12	12	15-02-2017	C.P	0	369.000	0.000	0			5	2017-02-15 16:48:28-05
13	13	15-02-2017	C.P	0	672.000	0.000	0			5	2017-02-15 16:49:11-05
14	10	24-02-2017	INV.	100			100			6	2017-02-24 16:00:30-05
15	10	24-02-2017	INV.	300			300			6	2017-02-24 16:00:54-05
16	14	03-03-2017	C.P	0	10.000	0.000	0			5	2017-03-03 10:05:11-05
17	15	03-03-2017	C.P	20	8.000	160.000	20			5	2017-03-03 10:06:10-05
18	16	03-03-2017	C.P	0	5.000	0.000	0			5	2017-03-03 11:28:53-05
21	16	03-03-2017	INV.	20	5.000	100.000	20			6	2017-03-03 11:58:43-05
22	16	03-03-2017	F.C:.	3	5.000	15.000	23			1	2017-03-03 12:09:31-05
23	16	03-03-2017	F.C:123456895	5	5.000	25.000	58			1	2017-03-03 12:13:42-05
25	16	03-03-2017	F.V:0000225	10	7.000	70.000	40			2	2017-03-03 12:21:55-05
26	15	03-03-2017	INGRESOS	10	8.000	80.000	50			3	2017-03-03 12:32:35-05
27	15	03-03-2017	EGRESOS	5	8.000	40.000	45	AAA	OOOO	4	2017-03-03 12:39:15-05
28	14	03-03-2017	EGRESOS	20	10.000	200.000	700			4	2017-03-03 12:40:55-05
29	14	03-03-2017	F.V:0000226	100	12.000	1200.000	600			2	2017-03-03 12:42:11-05
19	16	03-03-2017	INV.	10			10			6	2017-03-03 11:39:48-05
20	16	03-03-2017	INV.	10	5.000	50.000	10			6	2017-03-03 11:55:44-05
24	16	03-03-2017	F.V:0000224	8	7.000	56.000	50			1	2017-03-03 12:17:40-05
30	2	30-03-2017	F.V:0000201	9	1.500	13.500	1			2	2017-03-30 12:39:44-05
31	2	31-03-2017	F.V:0000202	1	1.500	1.500	0			2	2017-03-31 09:13:40-05
32	9	31-03-2017	F.V:0000202	10	150.000	1500.000	140			2	2017-03-31 09:15:05-05
33	10	31-03-2017	F.V:0000201	10	800.000	8000.000	190			2	2017-03-31 10:33:44-05
34	2	31-03-2017	F.C:0006548	50	1.000	50.000	50			1	2017-03-31 13:01:53-05
35	10	31-03-2017	F.C:8955	60	500.000	30000.000	250			1	2017-03-31 13:07:47-05
36	10	31-03-2017	F.C:8956	10	500.000	5000.000	260			1	2017-03-31 15:09:28-05
37	2	31-03-2017	INGRESOS	10	1.000	10.000	60	tertrwre	ewrtwert	3	2017-03-31 15:47:49-05
38	2	31-03-2017	EGRESOS	10	1.000	10.000	50	etwert	wertwertwe	4	2017-03-31 15:59:31-05
39	2	03-04-2017	F.V:0000201	1	1.500	1.500	49			2	2017-04-03 10:09:24-05
40	2	04-04-2017	F.V:0000202	3	1.500	4.500	46			2	2017-04-04 09:19:33-05
41	2	04-04-2017	F.V:0000203	6	1.500	9.000	40			2	2017-04-04 10:43:25-05
42	10	04-04-2017	F.V:0000203	10	800.000	8000.000	250			2	2017-04-04 10:43:25-05
43	10	04-04-2017	F.V:0000204	10	800.000	8000.000	250			2	2017-04-04 14:57:11-05
44	2	04-04-2017	F.V:0000205	6	1.500	9.000	40			2	2017-04-04 15:30:40-05
45	2	04-04-2017	F.V:0000205	5	1.500	7.500	35			2	2017-04-04 15:33:59-05
46	2	04-04-2017	F.V:0000206	3	1.500	4.500	32			2	2017-04-04 15:36:18-05
47	2	04-04-2017	F.V:0000207	2	1.500	3.000	30			2	2017-04-04 15:40:30-05
48	2	04-04-2017	F.V:0000201	1	1.500	1.500	29			2	2017-04-04 16:34:29-05
49	2	04-04-2017	F.V:0000202	1	1.500	1.500	28			2	2017-04-04 16:36:01-05
50	10	04-04-2017	F.V:0000203	1	800.000	800.000	249			2	2017-04-04 16:36:35-05
51	10	04-04-2017	F.V:0000204	1	800.000	800.000	248			2	2017-04-04 16:37:23-05
52	2	06-04-2017	F.V:0000205	2	1.500	3.000	26			2	2017-04-06 12:03:01-05
53	2	2017-04-06	F.V:0000206	3	1.500	4.500	23			2	2017-04-06 14:53:26-05
54	2	2017-04-06	EGRESOS	50	1.000	50.000	-27	QQQQQ	DDDDDD	4	2017-04-06 14:55:25-05
55	10	2017-04-06	F.C:123456	2	500.000	1000.000	250			1	2017-04-06 14:59:11-05
56	2	2017-04-06	INGRESOS	1	1.000	1.000	-26	GHHDFGH	FGHDFGHDFGH	3	2017-04-06 15:02:46-05
57	10	2017-04-07	F.V:0000207	10	800.000	8000.000	240			2	2017-04-07 09:46:20-05
58	8	2017-04-07	F.V:0000208	3	60.000	180.000	197			2	2017-04-07 11:51:58-05
59	16	2017-04-07	F.V:0000209	20	7.000	140.000	20			2	2017-04-07 11:53:15-05
60	16	2017-04-07	F.V:0000210	1	7.000	7.000	19			2	2017-04-07 11:54:10-05
61	2	2017-04-07	INVENTARIO.	50	1.000	50.000	50			6	2017-04-07 12:59:18-05
62	15	2017-04-07	F.V:0000211	3	10.000	30.000	42			2	2017-04-07 14:44:41-05
63	2	2017-04-07	F.V:0000201	3	1.500	4.500	47			2	2017-04-07 15:09:46-05
64	10	2017-04-10	F.V:0000202	1	800.000	800.000	239			2	2017-04-10 17:18:20-05
65	2	2017-04-11	EGRESOS	10	1.000	10.000	37	adasd	asdasd	4	2017-04-11 11:39:16-05
66	3	2017-04-11	INGRESOS	20	1.000	20.000	20	asdasdasd	asdasdasdasd	3	2017-04-11 11:39:52-05
67	14	2020-02-03	F.V:0000203	1	12.000	12.000	599			2	2020-02-03 09:30:55-05
68	16	2020-02-03	F.V:0000203	2	7.000	14.000	17			2	2020-02-03 09:30:55-05
69	8	2020-02-03	F.V:0000203	2	60.000	120.000	195			2	2020-02-03 09:30:55-05
70	2	2020-02-03	F.V:0000203	2	1.500	3.000	35			2	2020-02-03 09:30:55-05
71	2	2020-02-16	F.V:0000204	1	1.500	1.500	34			2	2020-02-16 11:01:12-05
72	3	2020-02-16	F.V:0000204	1	1.500	1.500	19			2	2020-02-16 11:01:12-05
73	6	2020-02-16	F.V:0000204	1	54.000	54.000	69			2	2020-02-16 11:01:12-05
74	6	2020-02-16	F.V:0000205	2	54.000	108.000	67			2	2020-02-16 11:26:02-05
75	2	2020-02-16	F.V:0000205	3	1.500	4.500	31			2	2020-02-16 11:26:02-05
76	16	2020-02-16	F.V:0000205	3	7.000	21.000	14			2	2020-02-16 11:26:02-05
77	7	2020-02-16	F.V:0000205	1	35.000	35.000	110			2	2020-02-16 11:26:02-05
78	3	2020-02-16	F.V:0000205	1	1.500	1.500	18			2	2020-02-16 11:26:02-05
79	15	2020-02-16	F.V:0000205	1	10.000	10.000	41			2	2020-02-16 11:26:02-05
80	14	2020-02-16	F.V:0000205	5	12.000	60.000	594			2	2020-02-16 11:26:02-05
81	14	2020-02-16	F.V:0000206	1	12.000	12.000	593			2	2020-02-16 11:35:21-05
82	16	2020-02-16	F.V:0000206	3	7.000	21.000	11			2	2020-02-16 11:35:21-05
83	2	2020-02-16	F.V:0000206	1	1.500	1.500	30			2	2020-02-16 11:35:21-05
84	16	2020-02-16	F.V:0000207	1	7.000	7.000	10			2	2020-02-16 13:20:58-05
85	10	2020-02-16	F.V:0000207	2	800.000	1600.000	237			2	2020-02-16 13:20:58-05
86	10	2020-03-10	F.C:1123332	2	500.000	1000.000	239			1	2020-03-10 13:48:36-05
87	8	2020-06-05	F.V:0000201	2	60.000	120.000	193			2	2020-06-05 14:06:33-05
88	14	2020-06-05	F.V:0000201	3	12.000	36.000	590			2	2020-06-05 14:06:33-05
89	16	2020-06-05	F.V:0000201	1	7.000	7.000	9			2	2020-06-05 14:06:33-05
90	2	2020-06-05	F.V:0000201	1	1.500	1.500	29			2	2020-06-05 14:09:31-05
91	14	2020-06-05	F.V:0000201	2	12.000	24.000	591			2	2020-06-05 14:09:31-05
92	16	2020-06-05	F.V:0000201	1	7.000	7.000	9			2	2020-06-05 14:09:31-05
\.


--
-- TOC entry 3170 (class 0 OID 59840)
-- Dependencies: 221
-- Data for Name: kardex_valorizado; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kardex_valorizado (id, id_producto, fecha_kardex, detalle_kardex, cantidad_entrada, precio_unitario_entrada, precio_total_entrada, cantidad_salida, precio_unitario_salida, precio_total_salida, cantidad_total, precio_unitario_total, precio_total, estado, fecha_creacion) FROM stdin;
1	1	17-05-2016	SALDO INICIAL							15	1.0000	15.00	1	2016-05-17 10:15:59-05
2	2	02-06-2016	SALDO INICIAL							0	654.0000	0.00	1	2016-06-02 09:13:31-05
3	3	02-06-2016	SALDO INICIAL							0	543.0000	0.00	1	2016-06-02 12:39:30-05
5	10	14-02-2017	SALDO INICIAL							100	100.0000	10000.00	1	2017-02-14 10:15:53-05
4	9	14-02-2017	SALDO INICIAL							0	500.0000	0.00	1	2017-02-14 10:11:29-05
6	2	15-02-2017	SALDO INICIAL							1	1.0000	1.00	1	2017-02-15 09:12:35-05
7	2	15-02-2017	SALDO INICIAL							1	1.0000	1.00	1	2017-02-15 12:45:23-05
8	2	15-02-2017	SALDO INICIAL							1	1.0000	1.00	1	2017-02-15 12:46:03-05
9	11	15-02-2017	SALDO INICIAL							0	1038.5900	0.00	1	2017-02-15 16:47:31-05
10	12	15-02-2017	SALDO INICIAL							0	369.0000	0.00	1	2017-02-15 16:48:28-05
11	13	15-02-2017	SALDO INICIAL							0	672.0000	0.00	1	2017-02-15 16:49:11-05
12	10	24-02-2017	SALDO INICIAL							100	500.0000	50000.00	1	2017-02-24 16:00:30-05
13	10	24-02-2017	SALDO INICIAL							300	500.0000	150000.00	1	2017-02-24 16:00:54-05
14	14	03-03-2017	SALDO INICIAL							0	10.0000	0.00	1	2017-03-03 10:05:11-05
15	15	03-03-2017	SALDO INICIAL							20	8.0000	160.00	1	2017-03-03 10:06:10-05
16	16	03-03-2017	SALDO INICIAL							0	5.0000	0.00	1	2017-03-03 11:28:53-05
\.


--
-- TOC entry 3171 (class 0 OID 59846)
-- Dependencies: 222
-- Data for Name: libro_diario; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.libro_diario (id, fecha, detalle, debe, haber, descripcion, estado, fecha_creacion) FROM stdin;
\.


--
-- TOC entry 3172 (class 0 OID 59852)
-- Dependencies: 223
-- Data for Name: marcas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.marcas (id, nombre_marca, principal, observaciones, estado, fecha_creacion) FROM stdin;
1	INDURAMA	No		1	2016-05-12 17:18:16-05
2	HP	No	Ninguna	1	2016-05-12 17:18:29-05
3	DELUX	No		1	2017-02-14 09:35:25-05
\.


--
-- TOC entry 3173 (class 0 OID 59858)
-- Dependencies: 224
-- Data for Name: movimientos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.movimientos (id, id_producto, fecha_movimiento, saldo_inicial, entradas, salidas, saldo, estado, fecha_creacion) FROM stdin;
2	15	03-03-2017	20	40	19	41	1	2017-03-03 10:06:10-05
1	14	03-03-2017	0	400	132	591	1	2017-03-03 10:05:11-05
3	16	03-03-2017	20	38	50	9	1	2017-03-03 11:28:53-05
\.


--
-- TOC entry 3174 (class 0 OID 59864)
-- Dependencies: 225
-- Data for Name: nota_venta; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.nota_venta (id, id_empresa, id_cliente, id_usuario, comprobante, fecha_actual, hora_actual, tipo_comprobante, tipo_precio, forma_pago, subtotal, tarifa0, tarifa, iva_nota, descuento_nota, total_nota, estado, fecha_creacion) FROM stdin;
\.


--
-- TOC entry 3175 (class 0 OID 59870)
-- Dependencies: 226
-- Data for Name: parametros; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.parametros (id, descripcion, valor, cuenta_debito, cuenta_credito, estado, fecha_creacion) FROM stdin;
\.


--
-- TOC entry 3176 (class 0 OID 59876)
-- Dependencies: 227
-- Data for Name: plan_cuentas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.plan_cuentas (id, codigo, nombre_plan, cuenta, estado, fecha_creacion) FROM stdin;
4	1.1.1.1.	CAJA	G	Activo	\N
7	1.1.1.2.	BANCOS	G	Activo	\N
54	1.2.1.1.13.	Herramientas, repuestos y accesorios	M	Activo	\N
27	1.1.4.1.	CREDITO TRIBUTARIO	G	Activo	\N
13	1.1.2.2.01.	Clientes DxC	M	Activo	\N
17	1.1.2.3.02.	Anticipo Proveedores/Varios	M	Activo	\N
16	1.1.2.3.01.	Anticipo Empleados	M	Activo	\N
19	1.1.2.4.01.	Prestamos Empleados	M	Activo	\N
2	1.1.	ACTIVO CORRIENTE	G	Activo	\N
3	1.1.1.	ACTIVO DISPONIBLE	G	Activo	\N
1	1.	ACTIVOS	G	Activo	\N
9	1.1.2.	ACTIVOS EXIGIBLES	G	Activo	\N
67	2.1.1.01.	Proveedores CxP	M	Activo	\N
18	1.1.2.4.	PRESTAMOS	M	Activo	\N
20	1.1.2.4.02.	Carmen Ortiz	M	Activo	\N
23	1.1.3.1.01.	Inventario Materia Prima	M	Activo	\N
22	1.1.3.1.	INVENTARIOS	G	Activo	\N
24	1.1.3.1.02.	Inventario Productos en Proceso	M	Activo	\N
30	1.1.4.1.03.	1% Retención Fuente Crédito Tributario	M	Activo	\N
28	1.1.4.1.01.	Iva en Compras	M	Activo	\N
31	1.1.4.1.04.	2% Retención Fuente Crédito Tributario	M	Activo	\N
33	1.1.4.1.06.	10% Retención Fuente Crédito Tributario	M	Activo	\N
11	1.1.2.1.01.	Clientes CxC	M	Activo	\N
35	1.1.4.1.08.	70% Retención IVA en Ventas	M	Activo	\N
37	1.1.4.1.10.	IVA Crédito Tributario	M	Activo	\N
38	1.1.4.1.11.	Anticipo Impuesto a la Renta	M	Activo	\N
42	1.2.1.1.01.	Edificio	M	Activo	\N
39	1.2.	ACTIVO NO CORRIENTE	G	Activo	\N
40	1.2.1.	ACTIVO FIJO	G	Activo	\N
41	1.2.1.1.	FIJO TANGIBLE DEPRECIABLE	G	Activo	\N
43	1.2.1.1.02.	(-) Depreciación Acumulada Edificio	M	Activo	\N
46	1.2.1.1.05.	Equipos de Oficina	M	Activo	\N
47	1.2.1.1.06.	(-) Depreciaión Acumulada Equipos de Oficina	M	Activo	\N
48	1.2.1.1.07.	Maquinaria y Equipo	M	Activo	\N
50	1.2.1.1.09.	Vehículos	M	Activo	\N
49	1.2.1.1.08.	(-) Depreciación Acumulada Maquinaria y Equipo	M	Activo	\N
52	1.2.1.1.11.	Equipo de Computación	M	Activo	\N
59	1.3.1.1.01.	Arriendos pagados por anticipado	M	Activo	\N
56	1.2.1.2.	FIJO TANGIBLE NO DEPRECIABLE	G	Activo	\N
58	1.3.	OTROS ACTIVOS	G	Activo	\N
62	1.3.1.1.04.	Publicidad pagada por anticipado	M	Activo	\N
63	1.3.1.1.05.	Otros	M	Activo	\N
6	1.1.1.1.02.	Caja Chica	M	Activo	\N
64	2.	PASIVOS	G	Activo	\N
69	2.1.2.01.	Iva en Ventas	M	Activo	\N
70	2.1.2.02.	Retención IVA 30%	M	Activo	\N
71	2.1.2.03.	Retención IVA 70%	M	Activo	\N
72	2.1.2.04.	Retención IVA 100%	M	Activo	\N
73	2.1.2.05.	Retención Fuente 0% Otras compras y servicios no sujetas a retención	M	Activo	\N
74	2.1.2.06.	Retención Fuente 1% Compras	M	Activo	\N
75	2.1.2.07.	Retención Fuente 1% Transporte	M	Activo	\N
76	2.1.2.08.	Retención Fuente 2% Servicios	M	Activo	\N
77	2.1.2.09.	Retención Fuente 8% Arriendos	M	Activo	\N
78	2.1.2.10.	Retención Fuente 10% Honorarios	M	Activo	\N
79	2.1.2.11.	Impuesto al valor Agregado por Pagar	M	Activo	\N
80	2.1.2.12.	Impuesto a la Renta por Pagar	M	Activo	\N
83	2.1.3.01.	Aporte Patronal por Secap Iece	M	Activo	\N
84	2.1.3.02.	Aporte Personal por Pagar	M	Activo	\N
86	2.1.3.04.	Préstamos Quirografarios por Pagar	M	Activo	\N
87	2.1.3.05.	Préstamnos Hipotecarios por Pagar	M	Activo	\N
89	2.1.4.01.	Banco de Guayaquil	M	Activo	\N
88	2.1.4.	OBLIGACIONES PERSONAL POR PAGAR	G	Activo	\N
91	2.1.5.01.	Sueldos por Pagar	M	Activo	\N
95	2.1.5.05.	Horas Suplementarias por Pagar	M	Activo	\N
96	2.1.5.06.	Horas Extras por Pagar	M	Activo	\N
100	2.2.1.01.	Banco Guayaquil	M	Activo	\N
98	2.2.	PASIVO NO CORRIENTE	G	Activo	\N
99	2.2.1.	PRESTAMO LARGO PLAZO	G	Activo	\N
106	3.1.1.01.	Capital	M	Activo	\N
103	3.	PATRIMONIO	G	Activo	\N
104	3.1.	CAPITAL	G	Activo	\N
108	3.1.2.01.	Capital Suscrito	M	Activo	\N
107	3.1.2.	CAPITAL SUSCRITO	G	Activo	\N
110	3.1.3.01.	Reserva Legal	M	Activo	\N
114	3.2.1.02.	Resultadp Ejercicio Anterior	M	Activo	\N
111	3.2.	RESULTADOS	G	Activo	\N
116	4.1.	INGRESOS OPERACIONALES	G	Activo	\N
117	4.1.1.	VENTAS	G	Activo	\N
118	4.1.1.01.	Venta Mercaderías	M	Activo	\N
119	4.1.1.02.	Venta de Servicios	M	Activo	\N
122	4.2.1.01.	Descuento personal	M	Activo	\N
127	5.1.1.01.	Costo de Ventas Mercaderías	M	Activo	\N
66	2.1.1.	CUENTAS POR PAGAR	G	Activo	\N
124	5.	COSTOS	G	Activo	\N
126	5.1.1.	COSTOS DE VENTAS	G	Activo	\N
121	4.2.1.	OTROS INGRESOS	G	Activo	\N
128	5.1.1.02.	Costo de Venta Servicios	M	Activo	\N
129	5.1.1.03.	Sueldos y Salarios	M	Activo	\N
132	5.1.1.06.	Décimo Cuarto Sueldo	M	Activo	\N
133	5.1.1.07.	Vacaciones	M	Activo	\N
134	5.1.1.08.	Fondos de Reserva	M	Activo	\N
136	5.1.1.10.	Horas Extras	M	Activo	\N
138	5.1.1.12.	Otros ingresos a empleados	M	Activo	\N
143	6.1.1.1.01.	Gastos Sueldos y Salarios	M	Activo	\N
140	6.1.	GASTOS ADMINISTRATIVOS FINANCIEROS Y VENTAS	G	Activo	\N
25	1.1.3.1.03.	Inventario Productos Terminados	M	Activo	\N
145	6.1.1.1.03.	Gasto Décimo Tercer Sueldo	M	Activo	\N
125	5.1.	COSTOS DE VENTA Y PRODUCCIÓN	G	Activo	\N
203	6.1.3.1.02.\t\t\r\n	Comisiones en Ventas\t\t\t\t\r\n	M	Activo\r\n	\N
65	2.1.	PASIVOS CORRIENTES	G	Activo	\N
68	2.1.2.	IMPUESTOS POR PAGAR	G	Activo	\N
92	2.1.5.02.	Décimo Tercer Sueldo por Pagar	M	Activo	\N
85	2.1.3.03.	Fondos de Reserva por Pagar	M	Activo	\N
82	2.1.3.	OBLIGACIONES IESS POR PAGAR	G	Activo	\N
90	2.1.5.	OBLIGACIONES PERSONAL POR PAGAR	G	Activo	\N
93	2.1.5.03.	Décimo Cuarto Sueldo por Pagar	M	Activo	\N
94	2.1.5.04.	Vacaciones por Pagar	M	Activo	\N
97	2.1.5.07.	15% Participación de Trabajadores por Pagar	M	Activo	\N
102	2.2.2.01.	Hipotecas por Pagar	M	Activo	\N
101	2.2.2.	HIPOTECAS	G	Activo	\N
113	3.2.1.01.	Resultado Ejercicio Presente	M	Activo	\N
105	3.1.1.	CAPITAL SOCIAL	G	Activo	\N
5	1.1.1.1.01.	Caja General	M	Activo	\N
10	1.1.2.1.	CUENTAS POR COBRAR	G	Activo	\N
12	1.1.2.2.	DOCUMENTOS POR COBRAR	G	Activo	\N
29	1.1.4.1.02.	0% Retención Fuente Crédito Tributario	M	Activo	\N
15	1.1.2.3.	ANTICIPOS	G	Activo	\N
21	1.1.3.	ACTIVOS REALIZABLES	G	Activo	\N
26	1.1.4.	IMPUESTOS Y RETENCIONES	G	Activo	\N
36	1.1.4.1.09.	100% Retención IVA en Ventas	M	Activo	\N
34	1.1.4.1.07.	30% Retención IVA en Ventas	M	Activo	\N
44	1.2.1.1.03.	Muebles Y Enseres	M	Activo	\N
45	1.2.1.1.04.	(-) Depreciación Acumulada Muebles y Enseres	M	Activo	\N
51	1.2.1.1.10.	(-) Depreciación Acumulada Vehículos	M	Activo	\N
53	1.2.1.1.12.	(-) Depreciación Acumulada Equipo de Computación	M	Activo	\N
55	1.2.1.1.14.	(-) Depreciación Acumulada Herramientas, repuestos y accesorios	M	Activo	\N
60	1.3.1.1.02.	Garantía de arriendos	M	Activo	\N
109	3.1.3.	RESERVAS	G	Activo	\N
61	1.3.1.1.03.	Seguros pagados por anticipado	M	Activo	\N
81	2.1.2.13.	Retención en Relación de Dependencia	M	Activo	\N
112	3.2.1.	UTILIDAD O PÉRDIDA DEL EJERCICIO	G	Activo	\N
123	4.2.1.02.	Otros Ingresos	M	Activo	\N
115	4.	INGRESOS	G	Activo	\N
120	4.2.	INGRESOS NO OPERACIONALES	G	Activo	\N
130	5.1.1.04.	Aporte Patronal Secap Iece	M	Activo	\N
131	5.1.1.05.	Décimo Tercer Sueldo	M	Activo	\N
135	5.1.1.09.	Horas Suplementarias	M	Activo	\N
137	5.1.1.11.	Bonificación por Rendimiento	M	Activo	\N
144	6.1.1.1.02.	Gastos Aporte Patronal Secap Iece	M	Activo	\N
139	6.	GASTOS	G	Activo	\N
141	6.1.1.	GASTOS ADMINISTRATIVOS	G	Activo	\N
142	6.1.1.1.	PERSONAL ADMINISTRATIVO	G	Activo	\N
148	6.1.1.1.07.\t\t\r\n	Gasto Horas Suplementarias\t\t\t\t\r\n	M	Activo\r\n	\N
149	6.1.1.1.08.\t\t\r\n	Gasto Horas Extras\t\t\t\t\r\n	M	Activo\r\n	\N
147	6.1.1.1.06.\t\t\r\n	Gasto Fondos de Reserva\t\t\t\t\r\n	M	Activo	\N
152	6.1.1.1.11.\t\t\r\n	Gasto Bonificación por Desahucio\t\t\t\t\r\n	M	Activo\r\n	\N
169	6.1.1.3.02.\t\t\r\n	Energía Eléctrica\t\t\t\t\r\n	M	Activo\r\n	\N
151	6.1.1.1.10.\t\t\r\n	Gasto Honorarios Profesionales\t\t\t\t\r\n	M	Activo\r\n	\N
153	6.1.1.1.12.\t\t\r\n	Gasto Bonifificación por Despido Intempestivo\t\t\t\t\r\n	M	Activo\r\n	\N
155	6.1.1.1.14.\t\t\r\n	Gasto Vacaciones\t\t\t\t\r\n	M	Activo\r\n	\N
154	6.1.1.1.13.\t\t\r\n	Otros ingresos a empleados\t\t\t\t\r\n	M	Activo\r\n	\N
156	6.1.1.2.\t\t\r\n	MATERIALES Y SERVICIOS\t\t\t\t\r\n	G	Activo\r\n	\N
158	6.1.1.2.02.\t\t\r\n	Gasto Combustibles y Lubricantes\t\t\t\t\r\n	M	Activo\r\n	\N
159	6.1.1.2.03.\t\t\r\n	Gasto Utiles de Aseo\t\t\t\t\r\n	M	Activo\r\n	\N
166	6.1.1.2.10.\t\t\r\n	Impuestos y Contribuciones\t\t\t\t\r\n	M	Activo\r\n	\N
157	6.1.1.2.01.\t\t\r\n	Gasto Suministros y Materiales\t\t\t\t\r\n	M	Activo\r\n	\N
161	6.1.1.2.05.\t\t\r\n	Gasto Servicios Ocasionales\t\t\t\t\r\n	M	Activo\r\n	\N
164	6.1.1.2.08.\t\t\r\n	Gasto Festejos y Agazajos Institucionales\t\t\t\t\r\n	M	Activo\r\n	\N
160	6.1.1.2.04.\t\t\r\n	Gastos de Oficina\t\t\t\t\r\n	M	Activo\r\n	\N
163	6.1.1.2.07.\t\t\r\n	Gasto Seguridad y Guardianía\t\t\t\t\r\n	M	Activo\r\n	\N
165	6.1.1.2.09.\t\t\r\n	Gastos de Gestión\t\t\t\t\r\n	M	Activo\r\n	\N
167	6.1.1.3.\t\t\r\n	SERVICIOS BÁSICOS\t\t\t\t\r\n	G	Activo\r\n	\N
168	6.1.1.3.01.\t\t\r\n	Agua Potable\t\t\t\t\r\n	M	Activo\r\n	\N
170	6.1.1.3.03.\t\t\r\n	Internet y Teléfono\t\t\t\t\r\n	M	Activo\r\n	\N
171	6.1.1.3.04.\t\t\r\n	Internet\t\t\t\t\r\n	M	Activo\r\n	\N
172	6.1.1.3.05.\t\t\r\n	Telefonía Celular\t\t\t\t\r\n	M	Activo\r\n	\N
173	6.1.1.4.\t\t\r\n	DEPRECIACIONES Y AMORTIZACIONES\t\t\t\t\r\n	G	Activo\r\n	\N
175	6.1.1.4.02.\t\t\r\n	Depreciación Activos Fijos Muebles y Enseres\t\t\t\t\r\n	M	Activo\r\n	\N
177	6.1.1.4.04.\t\t\r\n	Depreciación Activos Fijos Maquinaria y Equipo\t\t\t\t\r\n	M	Activo\r\n	\N
179	6.1.1.4.06.\t\t\r\n	Depreciación Activos Fijos Equipo de Computación\t\t\t\t\r\n	M	Activo\r\n	\N
183	6.1.1.5.02.\t\t\r\n	Mantenimiento de Edificios\t\t\t\t\r\n	M	Activo\r\n	\N
178	6.1.1.4.05.\t\t\r\n	Depreciación Activos Fijos Vehículos\t\t\t\t\r\n	M	Activo\r\n	\N
180	6.1.1.4.07.\t\t\r\n	Depreciación Activos Fijos Herramientas, Repuestos y Accesorios\t\t\t\t\r\n	M	Activo\r\n	\N
182	6.1.1.5.01.\t\t\r\n	Mantenimiento de Vehículos\t\t\t\t\r\n	M	Activo\r\n	\N
181	6.1.1.5.\t\t\r\n	MANTENIMIENTO DE ACTIVOS\t\t\t\t\r\n	G	Activo\r\n	\N
185	6.1.1.5.04.\t\t\r\n	Mantenimiento de Maquinaria y Equipos\t\t\t\t\r\n	M	Activo\r\n	\N
184	6.1.1.5.03.\t\t\r\n	Mantenimiento de Equipo de Computacion\t\t\t\t\r\n	M	Activo\r\n	\N
186	6.1.1.6.\t\t\r\n	GASTOS NO DEDUCIBLES\t\t\t\t\r\n	G	Activo\r\n	\N
188	6.1.1.6.02.\t\t\r\n	Otros Gastos no Deducibles\t\t\t\t\r\n	M	Activo\r\n	\N
187	6.1.1.6.01.\t\t\r\n	Pagos Ocasionales\t\t\t\t\r\n	M	Activo\r\n	\N
193	6.1.1.7.04.\t\t\r\n	Otros Gastos\t\t\t\t\r\n	M	Activo\r\n	\N
196	6.1.2.\t\t\r\n	GASTOS FINANCIEROS\t\t\t\t\r\n	G	Activo\r\n	\N
198	6.1.2.2.01.\t\t\r\n	Gasto Servicios Bancarios\t\t\t\t\r\n	M	Activo\r\n	\N
32	1.1.4.1.05.	8% Retención Fuente Crédito Tributario	M	Activo	\N
146	6.1.1.1.04.	Gasto Décimo Cuarto Sueldo\t\t\t\t\r\n	M	Activo	\N
57	1.2.1.2.01.	Terrenos	M	Activo	\N
14	1.1.2.2.02.	(-) Provision Cuentas Incobrables	M	Activo	\N
150	6.1.1.1.09.\t\t\r\n	Gastos Bonificación por Rendimiento\t\t\t\t\r\n	M	Activo\r\n	\N
162	6.1.1.2.06.\t\t\r\n	Gasto Servicio de Encomiendas\t\t\t\t\r\n	M	Activo\r\n	\N
174	6.1.1.4.01.\t\t\r\n	Depreciación Activos Fijos Edificio\t\t\t\t\r\n	M	Activo\r\n	\N
176	6.1.1.4.03.\t\t\r\n	Depreciación Activos Fijos Equipos de Oficina\t\t\t\t\r\n	M	Activo\r\n	\N
189	6.1.1.7.\t\t\r\n	OTROS GASTOS DE ADMINISTRACIÓN\t\t\t\t\r\n	M	Activo\r\n	\N
191	6.1.1.7.02.\t\t\r\n	Gasto Alimentación\t\t\t\t\r\n	M	Activo\r\n	\N
190	6.1.1.7.01.\t\t\r\n	Gastos Retenciones Asumidas\t\t\t\t\r\n	M	Activo\r\n	\N
192	6.1.1.7.03.\t\t\r\n	Gasto Repuestos y Accesorios\t\t\t\t\r\n	M	Activo\r\n	\N
194	6.1.1.7.05.\t\t\r\n	Gasto Seguros\t\t\t\t\r\n	M	Activo\r\n	\N
195	6.1.1.7.06.\t\t\r\n	Pérdidas en ventas de Activos Fijos\t\t\t\t\r\n	M	Activo\r\n	\N
197	6.1.2.1.\t\t\r\n	SERVICIOS BANCARIOS\t\t\t\t\r\n	G	Activo\r\n	\N
200	6.1.3.\t\t\r\n	GASTOS DE VENTA\t\t\t\t\r\n	G	Activo\r\n	\N
199	6.1.2.2.02.\t\t\r\n	Gasto Intereses y Multas\t\t\t\t\r\n	M	Activo\r\n	\N
201	6.1.3.1.\t\t\r\n	MATERIALES Y SERVICIOS\t\t\t\t\r\n	G	Activo\r\n	\N
202	6.1.3.1.01.\t\t\r\n	Publicidad y Promoción\t\t\t\t\r\n	M	Activo\r\n	\N
204	6.1.3.1.03.\t\t\r\n	Movilización y Fletes\t\t\t\t\r\n	M	Activo\r\n	\N
8	1.1.1.2.01.	Banco Pichincha	M	Activo	\N
205	2.1.2.14.	Retencion 1% publicidad	M	Activo	\N
\.


--
-- TOC entry 3177 (class 0 OID 59882)
-- Dependencies: 228
-- Data for Name: porcentaje_iva; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.porcentaje_iva (id, nombre_porcentaje, porcentaje, principal, observaciones, estado, fecha_creacion) FROM stdin;
1	cero %	0	No	Ninguna	1	2016-05-12 16:52:04-05
2	catorce %	12	Si	Ninguna	1	2020-06-05 14:08:18-05
\.


--
-- TOC entry 3178 (class 0 OID 59888)
-- Dependencies: 229
-- Data for Name: privilegios; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.privilegios (id, id_usuario, data, estado, fecha_creacion) FROM stdin;
1	1	["require","dias","facturero","talonario","usuarios","fotos_usuario","cargos","privilegios","empresa","logo_empresa","tipo_transaccion","tipo_comprobante","formas_pago","porcentaje","retencion_fuente","retencion_iva","tipo_productos","categorias","marcas","medida","bodegas","clientes","proveedores","directores","productos","fotos_articulo","importar","inventario","movimientos","kardex","proformas","factura_compra","devolucion_compra","factura_venta","nota_credito","ingresos","egresos","cuenta","cuentas_cobrar","cuentas_pagar","reporte_directores","reporte_productos","reporte_compras","reporte_ventas","reporte_proformas"]	1	2017-02-14 09:20:37-05
2	2	["require","usuarios","fotos_usuario","cargos","privilegios","empresa","logo_empresa","facturero","tipo_transaccion","tipo_comprobante","formas_pago","porcentaje","retencion_fuente","retencion_iva","porcentaje","tipo_productos","categorias","marcas","medida","bodegas","clientes","proveedores","productos","fotos_articulo","importar","inventario","movimientos","proformas","factura_compra","devolucion_compra","factura_venta","nota_credito","ingresos","egresos","kardex","reporte_productos","reporte_compras","reporte_ventas"]	1	2020-06-13 19:15:20-05
3	3	["require","usuarios","fotos_usuario","cargos","privilegios","empresa","logo_empresa","porcentaje","porcentaje","tipo_productos","categorias","marcas","medida","bodegas","clientes","proveedores","productos","fotos_articulo","inventario","movimientos","proformas","factura_compra","devolucion_compra","factura_venta","nota_credito","ingresos","egresos","cuenta"]	1	2020-06-13 19:23:05-05
\.


--
-- TOC entry 3179 (class 0 OID 59894)
-- Dependencies: 230
-- Data for Name: productos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.productos (id, codigo_barras, codigo, descripcion, precio_costo, utlididad_minorista, utilidad_mayorista, precio_minorista, precio_mayorista, id_tipo_producto, id_categoria, id_marca, id_unidad_medida, id_bodega, id_porcentaje, incluye_iva, stock, stock_minimo, stock_maximo, descuento, expiracion, facturar_existencia, id_proveedor, ubicacion, series, imagen, observaciones, estado, fecha_creacion) FROM stdin;
\.


--
-- TOC entry 3180 (class 0 OID 59900)
-- Dependencies: 231
-- Data for Name: proforma; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.proforma (id, id_empresa, id_cliente, id_usuario, fecha_actual, hora_actual, tipo_precio, subtotal, tarifa0, tarifa, iva_proforma, descuento_proforma, total_proforma, observaciones, estado, fecha_creacion) FROM stdin;
\.


--
-- TOC entry 3181 (class 0 OID 59906)
-- Dependencies: 232
-- Data for Name: proveedores; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.proveedores (id, tipo_documento, identificacion, empresa, representante_legal, visitador, telefono1, telefono2, ciudad, direccion, correo, sitio_web, cupo_credito, formas_pago, proveedor_principal, observaciones, estado, fecha_creacion) FROM stdin;
2	RUC	1002969390001	CEVALLOS SARAUZ LORENA MARGARITA	CEVALLOS SARAUZ LORENA MARGARITA	CEVALLOS SARAUZ LORENA MARGARITA		(099) 999-9999	COTACACHI	Plaza			0.000	CONTADO	SI		1	2017-02-14 09:51:02-05
3	RUC	1002769535001	RIVADENEIRA CEVALLOS SANDRA MAGDALENA	RIVADENEIRA CEVALLOS SANDRA MAGDALENA	RIVADENEIRA CEVALLOS SANDRA MAGDALENA		(099) 999-9999	TULCAN	La Paz			0.000	CONTADO	SI		1	2017-02-14 09:51:58-05
4	RUC	1002134292001	YEPEZ ALMEIDA JORGE ESTEBAN	YEPEZ ALMEIDA JORGE ESTEBAN	YO		(099) 999-9999	SDFGSDFG	SDFGSDFG			0.000	CONTADO	SI		1	2017-03-01 16:16:01-05
1	RUC	1002581393001	MONTIEL ALVAREZ PABLO ANDRES	MONTIEL ALVAREZ PABLO ANDRES	OSCAR TROYA	(062) 922-670	(098) 947-5676	OTAVALO	Miguel Egas y Morales	oskrs11@hotmail.com	www.montiel.com	10.000	CONTADO	SI		1	2017-04-05 15:01:18-05
\.


--
-- TOC entry 3182 (class 0 OID 59912)
-- Dependencies: 233
-- Data for Name: retencion_fuente; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.retencion_fuente (id, nombre_fuente, valor, codigo_formulario, cuenta_debito, cuenta_credito, estado, fecha_creacion) FROM stdin;
2	SERVICIO DE TRANSPORTE PRIVADO DE PASAJEROS Y/O TRANSPORTE PúBLICO O PRIVADO DE CARGA	1	310	30	75	1	2017-02-22 11:36:22-05
1	COMPRA DE BIENES	1	312	30	75	1	2017-02-22 11:36:11-05
3	SERVICIOS DONDE PREDOMINA LA MANO DE OBRA	2	307	31	76	1	2017-02-22 11:31:57-05
4	OTRAS COMPRAS DE BIENES Y SERVICIOS NO SUJETAS A RETENCIÓN	0	332	29	74	1	2017-02-22 11:32:45-05
5	HONORARIOS PROFESIONALES RELACIONADOS CON EL TíTULO PROFESIONAL	10	303	33	78	1	2017-02-22 11:33:21-05
6	SERVICIO DONDE PREDOMINA EL INTELECTO NO RELACIONADO CON EL TíTULO PROFESIONAL	8	304	32	77	1	2017-02-22 11:33:47-05
7	ARRENDAMIENTO DE BIENES INMUEBLES	10	320	32	77	1	2017-02-22 11:37:17-05
8	OTRAS ALPLICABLES EL 2%	2	304	76	76	1	2017-02-22 11:35:08-05
9	SERVICIOS PRESTADOS POR MEDIOS DE COMUNICACION Y AGENCIAS DE PUBLICIDAD	1	309	205	205	1	2017-02-22 11:35:32-05
\.


--
-- TOC entry 3183 (class 0 OID 59918)
-- Dependencies: 234
-- Data for Name: retencion_fuente_compra; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.retencion_fuente_compra (id, id_factura_compra, id_retencion_fuente, fecha_actual, hora_actual, valor_factura, iva_compra, valor_retencion, autorizacion, serie, estado, fecha_creacion) FROM stdin;
\.


--
-- TOC entry 3184 (class 0 OID 59924)
-- Dependencies: 235
-- Data for Name: retencion_fuente_venta; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.retencion_fuente_venta (id, id_factura_venta, id_retencion_fuente, fecha_actual, hora_actual, valor_factura, iva_venta, valor_retencion, autorizacion, serie, estado, fecha_creacion) FROM stdin;
\.


--
-- TOC entry 3185 (class 0 OID 59930)
-- Dependencies: 236
-- Data for Name: retencion_iva; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.retencion_iva (id, nombre_iva, valor, codigo_formulario, cuenta_debito, cuenta_credito, estado, fecha_creacion) FROM stdin;
6	ARRIENDO DE INMUEBLES	100	-	35	72	1	2017-02-22 11:48:32-05
1	BIENES	30	725	34	70	1	2017-02-22 11:46:46-05
3	CONTRATOS DE CONSTRUCCIÓN	30	-	34	70	1	2017-02-22 11:47:13-05
4	LIQUIDACIóN DE COMPRA O SERVICIO	100	-	35	72	1	2017-02-22 11:47:43-05
5	HONORARIO PROFESIONALES/DIETAS	100	-	35	72	1	2017-02-22 11:48:04-05
2	SERVICIOS	70	729	35	71	1	2017-02-21 11:36:28-05
7	erqwer	0	-	30	29	1	2017-04-10 13:05:02-05
\.


--
-- TOC entry 3186 (class 0 OID 59936)
-- Dependencies: 237
-- Data for Name: retencion_iva_compra; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.retencion_iva_compra (id, id_factura_compra, id_retencion_iva, fecha_actual, hora_actual, valor_factura, iva_factura, valor_retencion, autorizacion, serie, estado, fecha_creacion) FROM stdin;
\.


--
-- TOC entry 3187 (class 0 OID 59942)
-- Dependencies: 238
-- Data for Name: retencion_iva_venta; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.retencion_iva_venta (id, id_factura_venta, id_retencion_iva, fecha_actual, hora_actual, valor_factura, iva_venta, valor_retencion, autorizacion, serie, estado, fecha_creacion) FROM stdin;
\.


--
-- TOC entry 3188 (class 0 OID 59948)
-- Dependencies: 239
-- Data for Name: talonario_retencion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.talonario_retencion (id, fecha_inicio, fecha_caducidad, inicio_talonario, finaliza_talonario, autorizacion, estado, fecha_creacion) FROM stdin;
1	2017-02-21	2018-02-21	1	101	87654321	1	2017-02-21 11:15:49-05
\.


--
-- TOC entry 3189 (class 0 OID 59954)
-- Dependencies: 240
-- Data for Name: tipo_comprobante; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tipo_comprobante (id, codigo, nombre_tipo_comprobante, principal, observaciones, estado, fecha_creacion) FROM stdin;
1	01	Factura 	Si		1	2017-02-21 15:34:15-05
2	02	Nota o boleta de venta 	No		1	2017-02-21 15:34:31-05
3	03	Liquidación de compra de Bienes o Prestación de servicios 	No		1	2017-02-21 15:35:55-05
4	04	Nota de crédito	No		1	2017-02-21 15:36:22-05
5	05	Nota de débito	No		1	2017-02-21 15:36:35-05
6	09	Tiquetes o vales emitidos por máquinas registradoras	No		1	2017-02-21 15:37:06-05
7	11	Pasajes expedidos por empresas de aviación	No		1	2017-02-21 15:37:28-05
8	12	Documentos emitidos por instituciones financieras	No		1	2017-02-21 15:37:53-05
9	15	Comprobante de venta emitido en el Exterior	No		1	2017-02-21 15:38:10-05
10	19	Comprobantes de Pago de Cuotas o Aportes	No		1	2017-02-21 15:38:26-05
11	20	Documentos por Servicios Administrativos emitidos por Inst. del Estado	No		1	2017-02-21 15:38:41-05
12	21	Carta de Porte Aéreo	No		1	2017-02-21 15:38:57-05
13	41	Comprobante de venta emitido por reembolso	No		1	2017-02-21 15:39:11-05
14	42	Documento agente de retención Presuntiva	No		1	2017-02-21 15:39:30-05
15	43	Liquidación para Explotación y Exploracion de Hidrocarburos	No		1	2017-02-21 15:39:44-05
16	45	Liquidación por reclamos de aseguradoras	No		1	2017-02-21 15:39:57-05
17	47	Nota de Crédito por Reembolso Emitida por Intermediario	No		1	2017-02-21 15:40:10-05
18	48	Nota de Débito por Reembolso Emitida por Intermediario	No		1	2017-02-21 15:40:35-05
19	294	Liquidación de compra de Bienes Muebles Usados	No		1	2017-02-21 15:40:50-05
20	344	Liquidación de compra de vehículos usados 	No		1	2017-02-21 15:41:00-05
\.


--
-- TOC entry 3190 (class 0 OID 59960)
-- Dependencies: 241
-- Data for Name: tipo_producto; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tipo_producto (id, nombre_tipo, principal, observaciones, estado, fecha_creacion) FROM stdin;
1	PRODUCTO	Si	Ninguno\n	1	2017-03-31 09:20:31-05
3	MATERIA PRIMA	No		2	2017-03-31 09:20:54-05
2	SERVICIO	No	Ninguno	2	2017-03-31 09:20:41-05
\.


--
-- TOC entry 3191 (class 0 OID 59966)
-- Dependencies: 242
-- Data for Name: tipo_transaccion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tipo_transaccion (id, abreviatura, nombre_transaccion, principal, observaciones, estado, fecha_creacion) FROM stdin;
2	ING	INGRESO	No		1	2017-02-15 11:42:47-05
3	EGR	EGRESO	No		1	2017-02-15 11:42:58-05
5	ND	NOTA DEBITO	No		1	2017-02-15 11:44:52-05
4	NC	NOTA CREDITO	No		1	2017-02-15 11:44:57-05
1	DIA	DIARIOs	No		1	2017-04-10 11:57:07-05
6	NV	NOTA VENTAS	No		1	2017-04-10 10:13:42-05
\.


--
-- TOC entry 3192 (class 0 OID 59972)
-- Dependencies: 243
-- Data for Name: transaccion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.transaccion (id, id_usuario, comprobante, fecha_actual, hora_actual, concepto, total_debe, total_haber, saldo, id_tipo_transaccion, num_transaccion, estado, fecha_creacion) FROM stdin;
\.


--
-- TOC entry 3193 (class 0 OID 59978)
-- Dependencies: 244
-- Data for Name: unidades_medida; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.unidades_medida (id, nombre_unidad, abreviatura, cantidad, principal, observaciones, estado, fecha_creacion) FROM stdin;
1	Unidad	UN	1	Si	Ninguna	1	2017-02-09 16:46:21-05
2	Caja	CA	1	No	Ninguna	1	2017-02-14 09:40:32-05
3	Docena	DC	12	No		1	2017-04-10 12:29:20-05
\.


--
-- TOC entry 3194 (class 0 OID 59984)
-- Dependencies: 245
-- Data for Name: usuarios; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.usuarios (id, identificacion, nombres_completos, telefono1, telefono2, ciudad, direccion, correo, usuario, clave, id_cargo, imagen, observaciones, estado, fecha_creacion) FROM stdin;
1	1004358584	Administrador		(098) 947-5676	OTAVALO	Miguel Egas y Morales	oskrs11@hotmail.com	Admin	827ccb0eea8a706c4c34a16891f84e7b	1	1.png		1	2017-04-05 15:18:46-05
2	1004337182	ASISTENTE VENTAS	(593) 979-837	(593) 979-8373	OTAVALO	OTAVALO, EUGENIO ESPEJO		vendedor	827ccb0eea8a706c4c34a16891f84e7b	2	defaul.jpg		1	2020-06-13 19:15:20-05
3	9999999999	CONTADORA	(097) 983-738	(095) 656-5654	OTAVALO	OTAVALO, EUGENIO ESPEJO		Contador	827ccb0eea8a706c4c34a16891f84e7b	4	defaul.jpg		1	2020-06-13 19:23:05-05
\.


--
-- TOC entry 2915 (class 2606 OID 59991)
-- Name: bodegas bodegas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bodegas
    ADD CONSTRAINT bodegas_pkey PRIMARY KEY (id);


--
-- TOC entry 2917 (class 2606 OID 59993)
-- Name: cargos cargo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cargos
    ADD CONSTRAINT cargo_pkey PRIMARY KEY (id);


--
-- TOC entry 2919 (class 2606 OID 59995)
-- Name: categorias categorias_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categorias
    ADD CONSTRAINT categorias_pkey PRIMARY KEY (id);


--
-- TOC entry 2921 (class 2606 OID 59997)
-- Name: clientes clientes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_pkey PRIMARY KEY (id);


--
-- TOC entry 2923 (class 2606 OID 59999)
-- Name: cuentas_cobrar cuentas_cobrar_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cuentas_cobrar
    ADD CONSTRAINT cuentas_cobrar_pkey PRIMARY KEY (id);


--
-- TOC entry 2925 (class 2606 OID 60001)
-- Name: detalle_cuentas_cobrar detalle_cuentas_cobrar_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.detalle_cuentas_cobrar
    ADD CONSTRAINT detalle_cuentas_cobrar_pkey PRIMARY KEY (id);


--
-- TOC entry 2927 (class 2606 OID 60003)
-- Name: detalle_devolucion_compra detalle_devolucion_compra_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.detalle_devolucion_compra
    ADD CONSTRAINT detalle_devolucion_compra_pkey PRIMARY KEY (id);


--
-- TOC entry 2929 (class 2606 OID 60005)
-- Name: detalle_egreso detalle_egreso_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.detalle_egreso
    ADD CONSTRAINT detalle_egreso_pkey PRIMARY KEY (id);


--
-- TOC entry 2931 (class 2606 OID 60007)
-- Name: detalle_factura_compra detalle_factura_compra_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.detalle_factura_compra
    ADD CONSTRAINT detalle_factura_compra_pkey PRIMARY KEY (id);


--
-- TOC entry 2933 (class 2606 OID 60009)
-- Name: detalle_factura_venta detalle_factura_venta_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.detalle_factura_venta
    ADD CONSTRAINT detalle_factura_venta_pkey PRIMARY KEY (id);


--
-- TOC entry 2935 (class 2606 OID 60011)
-- Name: detalle_ingreso detalle_ingresos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.detalle_ingreso
    ADD CONSTRAINT detalle_ingresos_pkey PRIMARY KEY (id);


--
-- TOC entry 2937 (class 2606 OID 60013)
-- Name: detalle_inventario detalle_inventario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.detalle_inventario
    ADD CONSTRAINT detalle_inventario_pkey PRIMARY KEY (id);


--
-- TOC entry 2939 (class 2606 OID 60015)
-- Name: detalle_nota_venta detalle_nota_venta_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.detalle_nota_venta
    ADD CONSTRAINT detalle_nota_venta_pkey PRIMARY KEY (id);


--
-- TOC entry 2941 (class 2606 OID 60017)
-- Name: detalle_proforma detalle_proforma_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.detalle_proforma
    ADD CONSTRAINT detalle_proforma_pkey PRIMARY KEY (id);


--
-- TOC entry 2943 (class 2606 OID 60019)
-- Name: detalle_transaccion detalle_transaccion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.detalle_transaccion
    ADD CONSTRAINT detalle_transaccion_pkey PRIMARY KEY (id);


--
-- TOC entry 2945 (class 2606 OID 60021)
-- Name: devolucion_compra devolucion_compra_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.devolucion_compra
    ADD CONSTRAINT devolucion_compra_pkey PRIMARY KEY (id);


--
-- TOC entry 2947 (class 2606 OID 60023)
-- Name: egreso egresos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.egreso
    ADD CONSTRAINT egresos_pkey PRIMARY KEY (id);


--
-- TOC entry 2949 (class 2606 OID 60025)
-- Name: empresa empresa_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.empresa
    ADD CONSTRAINT empresa_pkey PRIMARY KEY (id);


--
-- TOC entry 2951 (class 2606 OID 60027)
-- Name: factura_compra factura_compra_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factura_compra
    ADD CONSTRAINT factura_compra_pkey PRIMARY KEY (id);


--
-- TOC entry 2953 (class 2606 OID 60029)
-- Name: factura_venta factura_venta_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factura_venta
    ADD CONSTRAINT factura_venta_pkey PRIMARY KEY (id);


--
-- TOC entry 2955 (class 2606 OID 60031)
-- Name: facturero facturero_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.facturero
    ADD CONSTRAINT facturero_pkey PRIMARY KEY (id);


--
-- TOC entry 2957 (class 2606 OID 60033)
-- Name: formas_pago formas_pago_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.formas_pago
    ADD CONSTRAINT formas_pago_pkey PRIMARY KEY (id);


--
-- TOC entry 2959 (class 2606 OID 60035)
-- Name: ingreso ingresos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ingreso
    ADD CONSTRAINT ingresos_pkey PRIMARY KEY (id);


--
-- TOC entry 2961 (class 2606 OID 60037)
-- Name: inventario inventario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventario
    ADD CONSTRAINT inventario_pkey PRIMARY KEY (id);


--
-- TOC entry 2963 (class 2606 OID 60039)
-- Name: kardex kardex_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kardex
    ADD CONSTRAINT kardex_pkey PRIMARY KEY (id);


--
-- TOC entry 2965 (class 2606 OID 60041)
-- Name: kardex_valorizado kardex_valorizado_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kardex_valorizado
    ADD CONSTRAINT kardex_valorizado_pkey PRIMARY KEY (id);


--
-- TOC entry 2967 (class 2606 OID 60043)
-- Name: libro_diario libro_diario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.libro_diario
    ADD CONSTRAINT libro_diario_pkey PRIMARY KEY (id);


--
-- TOC entry 2969 (class 2606 OID 60045)
-- Name: marcas marcas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.marcas
    ADD CONSTRAINT marcas_pkey PRIMARY KEY (id);


--
-- TOC entry 2971 (class 2606 OID 60047)
-- Name: movimientos movimientos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movimientos
    ADD CONSTRAINT movimientos_pkey PRIMARY KEY (id);


--
-- TOC entry 2973 (class 2606 OID 60049)
-- Name: nota_venta nota_venta_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nota_venta
    ADD CONSTRAINT nota_venta_pkey PRIMARY KEY (id);


--
-- TOC entry 2975 (class 2606 OID 60051)
-- Name: parametros parametros_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.parametros
    ADD CONSTRAINT parametros_pkey PRIMARY KEY (id);


--
-- TOC entry 2977 (class 2606 OID 60053)
-- Name: plan_cuentas plan_cuentas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plan_cuentas
    ADD CONSTRAINT plan_cuentas_pkey PRIMARY KEY (id);


--
-- TOC entry 2979 (class 2606 OID 60055)
-- Name: porcentaje_iva porcentaje_iva_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.porcentaje_iva
    ADD CONSTRAINT porcentaje_iva_pkey PRIMARY KEY (id);


--
-- TOC entry 2981 (class 2606 OID 60057)
-- Name: privilegios privilegios_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.privilegios
    ADD CONSTRAINT privilegios_pkey PRIMARY KEY (id);


--
-- TOC entry 2983 (class 2606 OID 60059)
-- Name: productos productos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productos
    ADD CONSTRAINT productos_pkey PRIMARY KEY (id);


--
-- TOC entry 2985 (class 2606 OID 60061)
-- Name: proforma proforma_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.proforma
    ADD CONSTRAINT proforma_pkey PRIMARY KEY (id);


--
-- TOC entry 2987 (class 2606 OID 60063)
-- Name: proveedores proveedores_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.proveedores
    ADD CONSTRAINT proveedores_pkey PRIMARY KEY (id);


--
-- TOC entry 2991 (class 2606 OID 60065)
-- Name: retencion_fuente_compra retencion_fuente_compra_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.retencion_fuente_compra
    ADD CONSTRAINT retencion_fuente_compra_pkey PRIMARY KEY (id);


--
-- TOC entry 2989 (class 2606 OID 60067)
-- Name: retencion_fuente retencion_fuente_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.retencion_fuente
    ADD CONSTRAINT retencion_fuente_pkey PRIMARY KEY (id);


--
-- TOC entry 2993 (class 2606 OID 60069)
-- Name: retencion_fuente_venta retencion_fuente_venta_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.retencion_fuente_venta
    ADD CONSTRAINT retencion_fuente_venta_pkey PRIMARY KEY (id);


--
-- TOC entry 2997 (class 2606 OID 60071)
-- Name: retencion_iva_compra retencion_iva_compra_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.retencion_iva_compra
    ADD CONSTRAINT retencion_iva_compra_pkey PRIMARY KEY (id);


--
-- TOC entry 2995 (class 2606 OID 60073)
-- Name: retencion_iva retencion_iva_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.retencion_iva
    ADD CONSTRAINT retencion_iva_pkey PRIMARY KEY (id);


--
-- TOC entry 2999 (class 2606 OID 60075)
-- Name: retencion_iva_venta retencion_iva_venta_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.retencion_iva_venta
    ADD CONSTRAINT retencion_iva_venta_pkey PRIMARY KEY (id);


--
-- TOC entry 3001 (class 2606 OID 60077)
-- Name: talonario_retencion talonario_retencion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.talonario_retencion
    ADD CONSTRAINT talonario_retencion_pkey PRIMARY KEY (id);


--
-- TOC entry 3003 (class 2606 OID 60079)
-- Name: tipo_comprobante tipo_comprobante_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipo_comprobante
    ADD CONSTRAINT tipo_comprobante_pkey PRIMARY KEY (id);


--
-- TOC entry 3005 (class 2606 OID 60081)
-- Name: tipo_producto tipo_producto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipo_producto
    ADD CONSTRAINT tipo_producto_pkey PRIMARY KEY (id);


--
-- TOC entry 3007 (class 2606 OID 60083)
-- Name: tipo_transaccion tipo_transaccion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipo_transaccion
    ADD CONSTRAINT tipo_transaccion_pkey PRIMARY KEY (id);


--
-- TOC entry 3009 (class 2606 OID 60085)
-- Name: transaccion transaccion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transaccion
    ADD CONSTRAINT transaccion_pkey PRIMARY KEY (id);


--
-- TOC entry 3011 (class 2606 OID 60087)
-- Name: unidades_medida unidades_medida_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.unidades_medida
    ADD CONSTRAINT unidades_medida_pkey PRIMARY KEY (id);


--
-- TOC entry 3013 (class 2606 OID 60089)
-- Name: usuarios usuarios_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (id);


--
-- TOC entry 3014 (class 2606 OID 60090)
-- Name: detalle_cuentas_cobrar fk_cuentas_cobrar; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.detalle_cuentas_cobrar
    ADD CONSTRAINT fk_cuentas_cobrar FOREIGN KEY (id_cuentas_cobrar) REFERENCES public.cuentas_cobrar(id);


--
-- TOC entry 3015 (class 2606 OID 60095)
-- Name: detalle_devolucion_compra fk_devolucion_compra; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.detalle_devolucion_compra
    ADD CONSTRAINT fk_devolucion_compra FOREIGN KEY (id_devolucion_compra) REFERENCES public.devolucion_compra(id);


--
-- TOC entry 3016 (class 2606 OID 60100)
-- Name: detalle_egreso fk_egreso; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.detalle_egreso
    ADD CONSTRAINT fk_egreso FOREIGN KEY (id_egreso) REFERENCES public.egreso(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3017 (class 2606 OID 60105)
-- Name: detalle_factura_compra fk_factura_compra; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.detalle_factura_compra
    ADD CONSTRAINT fk_factura_compra FOREIGN KEY (id_factura_compra) REFERENCES public.factura_compra(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3018 (class 2606 OID 60110)
-- Name: detalle_factura_venta fk_factura_venta; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.detalle_factura_venta
    ADD CONSTRAINT fk_factura_venta FOREIGN KEY (id_factura_venta) REFERENCES public.factura_venta(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3019 (class 2606 OID 60115)
-- Name: detalle_ingreso fk_ingreso; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.detalle_ingreso
    ADD CONSTRAINT fk_ingreso FOREIGN KEY (id_ingreso) REFERENCES public.ingreso(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3020 (class 2606 OID 60120)
-- Name: detalle_inventario fk_inventario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.detalle_inventario
    ADD CONSTRAINT fk_inventario FOREIGN KEY (id_inventario) REFERENCES public.inventario(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3021 (class 2606 OID 60125)
-- Name: detalle_nota_venta fk_nota_venta; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.detalle_nota_venta
    ADD CONSTRAINT fk_nota_venta FOREIGN KEY (id_nota_venta) REFERENCES public.nota_venta(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3022 (class 2606 OID 60130)
-- Name: detalle_proforma fk_proforma; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.detalle_proforma
    ADD CONSTRAINT fk_proforma FOREIGN KEY (id_proforma) REFERENCES public.proforma(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3023 (class 2606 OID 60135)
-- Name: detalle_transaccion fk_transaccion; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.detalle_transaccion
    ADD CONSTRAINT fk_transaccion FOREIGN KEY (id_transaccion) REFERENCES public.transaccion(id) ON UPDATE CASCADE ON DELETE CASCADE;


-- Completed on 2020-08-04 12:10:35

--
-- PostgreSQL database dump complete
--

