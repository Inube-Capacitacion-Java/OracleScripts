                                      =====================================
                                               Historia de Usuario
                                      =====================================
Título:

Entrega de registros de clientes y normalización para base de datos en Oracle

Como: Analista de datos / Desarrollador de base de datos

Quiero: Recibir los registros de clientes, teléfonos, facturas y pagos, y normalizarlos

Para que: Se puedan crear las tablas correspondientes en Oracle de manera eficiente y evitando redundancia, garantizando integridad y
                          consistencia de los datos.

                                      =====================================
                                            Criterios de aceptación
                                      =====================================

1.- Se entregan los registros crudos de los clientes, teléfonos, facturas y pagos con la siguiente estructura:

    ID_CLIENTE | NOMBRE     | RFC     | TELEFONO   | ID_FACTURA | MONTO_TOTAL | ID_PAGO | MONTO_PAGO
    ------------------------------------------------------------------------------------------------
    101        | Ana López  | ALO90.. | 5512345678 | 2001       | 1500.00     | 3001    | 500.00
    101        | Ana López  | ALO90.. | 5512345678 | 2001       | 1500.00     | 3002    | 1000.00
    101        | Ana López  | ALO90.. | 5599887766 | 2002       | 800.00      | 3003    | 800.00
    102        | Luis Soto  | SOE78.. | 6611223344 | 2003       | 250.00      | 3004    | 250.00
    102        | Luis Soto  | SOE78.. | 6611223344 | 2004       | 120.00      | NULL    | NULL

2.- Normalización de los datos:

    Separar los datos en entidades independientes: CLIENTES, TELEFONOS, FACTURAS, PAGOS.

    Evitar información repetida (ej. nombre, RFC o teléfono del cliente).

    Asegurar que cada tabla cumpla 1NF, 2NF y 3NF.

3.- Diseño de tablas para Oracle:

    Cada tabla debe tener clave primaria (PK).

    Mantener relaciones 1-N mediante foreign keys (FK).

    Para auditoría futura, considerar tablas de bitácora (*_BIT) que registren los cambios con campos como FECHA_CREACION, FECHA_MODIFICACION, ACCION e IP.

4.- Documentación de la estructura final:

    Presentar diagramas ASCII de las tablas y relaciones para facilitar la comprensión y enseñanza a los alumnos.

    Explicar la normalización aplicada y las dependencias entre las tablas.

Notas adicionales

    Esta historia de usuario se puede dividir en tareas técnicas:

    Analizar registros crudos.

    Definir entidades y relaciones.

    Crear scripts SQL de creación de tablas en Oracle.

    Crear secuencias y triggers para autoincrementos de IDs.

    Crear diagramas visuales ASCII para documentación y enseñanza.