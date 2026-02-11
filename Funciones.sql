-- Función para obtener la IP de la solicitud
-- Para llamar a una función
-- SELECT FN_GET_IP() FROM DUAL;


CREATE OR REPLACE FUNCTION FN_GET_IP
RETURN VARCHAR2
IS
BEGIN
  -- Intento de obtener IP del host que hace conexión
  RETURN NVL(SYS_CONTEXT('USERENV', 'IP_ADDRESS'), SYS_CONTEXT('USERENV', 'HOST'));
  EXCEPTION
    WHEN OTHERS THEN
      RETURN 'LOCALHOST';
END FN_GET_IP;

/

-- Función que devuelve el monto faltante de pago de una factura
CREATE OR REPLACE FUNCTION FN_MONTO_PAGO_FALTANTE( p_id_factura IN NUMBER )
RETURN NUMBER
IS
  v_monto_total_factura NUMBER(10,2);
  v_monto_total_pagado NUMBER(10,2);
  v_monto_faltante NUMBER (10,2);
BEGIN
  SELECT MONTO_TOTAL INTO v_monto_total_factura FROM FACTURAS WHERE ID_FACTURA = p_id_factura;
  SELECT NVL(SUM(MONTO), 0) INTO v_monto_total_pagado FROM PAGOS WHERE ID_FACTURA = p_id_factura;
  v_monto_faltante := v_monto_total_factura - v_monto_total_pagado;
  RETURN v_monto_faltante;
END;



