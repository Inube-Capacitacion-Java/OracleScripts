

          +----------------+                     +--------------------+
          |   TELEFONOS    |                     |  TELEFONOS_BIT     |
          |----------------|   1             N   |--------------------|
          | PK ID_TELEFONO |<------------------- | PK ID_TELEFONO_BIT |
          | FK ID_CLIENTE  |                     | FK ID_TELEFONO     |
          | TELEFONO       |                     | FK ID_CLIENTE      |
          +----------------+                     | TELEFONO           |
                | N                              | FECHA_CREACION     |
                |                                | FECHA_MODIFICACION |
                |                                | ACCION             |
                |                                | IP                 |
                |                                +--------------------+
                | 1
          +----------------+                     +--------------------+
          |    CLIENTES    |                     |   CLIENTES_BIT     |
          |----------------|                     |--------------------|
          | PK ID_CLIENTE  |<------------------- | PK ID_CLIENTE_BIT  |
          | NOMBRE         |                     | FK ID_CLIENTE      |
          | APATERNO       |                     | NOMBRE             |
          | AMATERNO       |                     | APATERNO           |
          | RFC            |                     | AMATERNO           |
          | FECHA_ALTA     |                     | RFC                |
          +----------------+                     | FECHA_ALTA         |
                |                                | FECHA_CREACION     |
                |                                | FECHA_MODIFICACION |
                |                                | ACCION             |
                |                                | IP                 |
                |                                +--------------------+
                |
                | 1
                |
                | N
          +----------------+                     +--------------------+
          |   FACTURAS     |                     |   FACTURAS_BIT     |
          |----------------|                     |--------------------|
          | PK ID_FACTURA  |<------------------- | PK ID_FACTURA_BIT  |
          | FK ID_CLIENTE  |                     | FK ID_FACTURA      |
          | MONTO_TOTAL    |                     | FK ID_CLIENTE      |
          | FOLIO          |                     | MONTO_TOTAL        |
          | ANIO           |                     | FOLIO              |
          | FECHA_FACTURA  |                     | ANIO               |
          +----------------+                     | FECHA_FACTURA      |
                |                                | FECHA_CREACION     |
                |                                | FECHA_MODIFICACION |
                |                                | ACCION             |
                |                                | IP                 |
                |                                +--------------------+
                |
                | 1
                |
                | N
          +----------------+                     +--------------------+
          |     PAGOS      |                     |      PAGOS_BIT     |
          |----------------|                     |--------------------|
          | PK ID_PAGO     |<------------------- | PK ID_PAGO_BIT     |
          | FK ID_FACTURA  |                     | FK ID_PAGO         |
          | MONTO          |                     | FK ID_FACTURA      |
          | FECHA_PAGO     |                     | MONTO              |
          +----------------+                     | FECHA_PAGO         |
                                                 | FECHA_CREACION     |
                                                 | FECHA_MODIFICACION |
                                                 | ACCION             |
                                                 | IP                 |
                                                 +--------------------+
