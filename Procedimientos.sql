-- Crear el procedimiento almacenado que genera la secuencia del folio de factura por año
CREATE OR REPLACE PROCEDURE SP_CREAR_SEQ_FOLIO_ANIO (
  p_anio IN NUMBER
)
IS
  PRAGMA AUTONOMOUS_TRANSACTION; -- ¡CRÍTICO! Permite DDL/COMMIT dentro.
  v_seq_name VARCHAR(30):= 'SEC_FOLIO_' || p_anio;
  v_count NUMBER := 0;
BEGIN
  -- Verificar si la secuencia existe (Se revisa en la transacción autónoma)
  SELECT COUNT(*) INTO v_count FROM ALL_SEQUENCES
  WHERE SEQUENCE_NAME = UPPER(v_seq_name) -- Usar UPPER para coincidir con la convención de nombres de Oracle
  AND SEQUENCE_OWNER = SYS_CONTEXT('USERENV', 'CURRENT_SCHEMA');

  -- Si no existe la secuencia se debe de crear
  IF v_count = 0 THEN
    EXECUTE IMMEDIATE 'CREATE SEQUENCE ' || v_seq_name || ' START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE';
    DBMS_OUTPUT.PUT_LINE('Secuencia ' || v_seq_name || ' creada.');
  END IF;

  -- Es obligatorio hacer COMMIT o ROLLBACK en un módulo autónomo
  COMMIT;

EXCEPTION
  WHEN OTHERS THEN
    ROLLBACK; -- Asegurar que la transacción autónoma se revierta en caso de error
    RAISE_APPLICATION_ERROR(-20001, 'Error al crear la secuencia ' || v_seq_name || ':' || SQLERRM);
END;

-- Función que nos devuelva el folio de la factura
CREATE OR REPLACE FUNCTION FN_OBTENER_FOLIO_FACTURA (
  p_fecha_factura IN DATE
)
RETURN NUMBER
IS
  v_anio NUMBER := EXTRACT(YEAR FROM p_fecha_factura);
  v_seq_name VARCHAR(30) := 'SEC_FOLIO_' || v_anio;
  v_folio NUMBER := 1;
BEGIN
  -- Validar que la secuencia exista o se cree
  SP_CREAR_SEQ_FOLIO_ANIO(v_anio);
  -- Obtener el valor de la secuencia
  EXECUTE IMMEDIATE 'SELECT ' || v_seq_name || '.NEXTVAL FROM DUAL' INTO v_folio;
  return v_folio;
END;

CREATE OR REPLACE PROCEDURE SP_INSERTAR_FACTURA(
  p_id_cliente IN NUMBER,
  p_monto_total IN NUMBER,
  p_fecha_factura IN DATE,
  p_id_factura OUT NUMBER
)
IS
  v_anio NUMBER := EXTRACT(YEAR FROM p_fecha_factura);
  v_folio NUMBER := 1;
  V_id_factura NUMBER := SEC_ID_FACTURA.NEXTVAL;
BEGIN
  v_folio := FN_OBTENER_FOLIO_FACTURA(p_fecha_factura);
  INSERT INTO FACTURAS (ID_FACTURA,ID_CLIENTE, MONTO_TOTAL, FOLIO, ANIO, FECHA_FACTURA)
  VALUES (v_id_factura, p_id_cliente, p_monto_total, v_folio, v_anio, p_fecha_factura)
  RETURNING ID_FACTURA INTO p_id_factura;
  COMMIT;
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      RAISE;
END;

CREATE OR REPLACE PROCEDURE SP_INSERTAR_PAGO(
  p_id_factura IN NUMBER,
  p_monto IN NUMBER,
  p_fecha_pago IN DATE,
  p_id_pago OUT NUMBER
)
IS
BEGIN
  INSERT INTO PAGOS (ID_FACTURA, MONTO, FECHA_PAGO)
  VALUES (p_id_factura, p_monto, p_fecha_pago) RETURNING ID_PAGO INTO p_id_pago;
  COMMIT;
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      RAISE;
END;






