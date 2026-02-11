-- Secuencia de ejemplo
-- CREATE SEQUENCE SEC_EJEMPLO START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;
-- SELECT SEC_EJEMPLO.NEXTVAL FROM DUAL;
-- Una secuencia en Oracle SQL es un objeto de base de datos que genera números enteros únicos y secuenciales de forma
-- automática. Se utilizan principalmente para crear identificadores de clave primaria en tablas, ya que permiten asignar
-- valores consecutivos sin que la base de datos necesite depender de otras tablas o transacciones. Se accede a sus
-- valores mediante las pseudocolumnas NEXTVAL (para obtener el siguiente valor) y CURRVAL (para obtener el último valor
-- obtenido en la sesión).

-- Creación Secuencias para las llaves primarias (PK´s)
CREATE SEQUENCE SEC_ID_CLIENTE START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;
CREATE SEQUENCE SEC_ID_TELEFONO START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;
CREATE SEQUENCE SEC_ID_FACTURA START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;
CREATE SEQUENCE SEC_ID_PAGO START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;

CREATE SEQUENCE SEC_ID_CLIENTE_BIT START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;
CREATE SEQUENCE SEC_ID_TELEFONO_BIT START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;
CREATE SEQUENCE SEC_ID_FACTURA_BIT START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;
CREATE SEQUENCE SEC_ID_PAGO_BIT START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;
