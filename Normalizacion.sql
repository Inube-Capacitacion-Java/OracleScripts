

ID_CLIENTE | NOMBRE     | RFC     | TELEFONO   | ID_FACTURA | MONTO_TOTAL | ID_PAGO | MONTO_PAGO
------------------------------------------------------------------------------------------------
101        | Ana López  | ALO90.. | 5512345678 | 2001       | 1500.00     | 3001    | 500.00
101        | Ana López  | ALO90.. | 5512345677 | 2001       | 1500.00     | 3002    | 1000.00
101        | Ana López  | ALO90.. | 5599887766 | 2002       | 800.00      | 3003    | 800.00
102        | Luis Soto  | SOE78.. | 6611223344 | 2003       | 250.00      | 3004    | 250.00
102        | Luis Soto  | SOE78.. | 6611223344 | 2004       | 120.00      | NULL    | NULL

Primera forma normal (1NF)
Regla: Cada celda debe contener un solo valor (no listas ni repeticiones) y cada fila debe ser única.
Observamos que tu tabla ya está en 1NF porque cada celda tiene un valor atómico.
Sin embargo, hay repetición de información: el nombre y RFC del cliente se repite, los teléfonos se repiten, los pagos se repiten.
Podemos separar por entidades: Clientes, Teléfonos, Facturas, Pagos.

Tablas 1NF :

CLIENTES                                TELEFONOS:

+------------+-----------+--------+     +------------+------------+
| ID_CLIENTE | NOMBRE    | RFC    |     | ID_CLIENTE | TELEFONO   |
+------------+-----------+--------+     +------------+------------+
| 101        | Ana López | ALO90..|     | 101        | 5512345678 |
| 102        | Luis Soto | SOE78..|     | 101        | 5599887766 |
+------------+-----------+--------+     | 102        | 6611223344 |
                                        +------------+------------+


FACTURAS                                    PAGOS

+------------+------------+------------+    +---------+------------+------------+
| ID_FACTURA | ID_CLIENTE | MONTO_TOTAL|    | ID_PAGO | ID_FACTURA | MONTO_PAGO |
+------------+------------+------------+    +---------+------------+------------+
| 2001       | 101        | 1500.00    |    | 3001    | 2001       | 500.00     |
| 2002       | 101        | 800.00     |    | 3002    | 2001       | 1000.00    |
| 2003       | 102        | 250.00     |    | 3003    | 2002       | 800.00     |
| 2004       | 102        | 120.00     |    | 3004    | 2003       | 250.00     |
+------------+------------+------------+    +---------+------------+------------+

Segunda forma normal (2NF)

Regla: Todos los atributos no clave deben depender completamente de la clave primaria.

Observa que en la tabla original, MONTO_TOTAL depende de la factura, no del cliente, y MONTO_PAGO depende del pago, no de la factura.

En las tablas separadas ya no hay dependencia parcial:

FACTURAS: MONTO_TOTAL depende de ID_FACTURA ✅

PAGOS: MONTO_PAGO depende de ID_PAGO ✅

Así que nuestras tablas 1NF ya cumplen 2NF

Tercera forma normal (3NF)

Regla: No debe haber dependencias transitivas (atributos no clave no dependen de otros atributos no clave).

En FACTURAS, MONTO_TOTAL depende solo de ID_FACTURA, no del cliente → ✅

En TELEFONOS, TELEFONO depende solo del ID_CLIENTE → ✅

Por lo tanto, nuestras tablas ya cumplen 3NF.

     -----------------------------------------------
    1|                                             |N
+------------+        +-------------+        +-------------+        +-------------+
|  CLIENTES  |1      N|  TELEFONOS  |        |  FACTURAS   |1      N|    PAGOS    |
+------------+--------+-------------+        +-------------+--------+-------------+
|PK ID_CLIENTE|       |PK TELEFONO  |        |PK ID_FACTURA|        |PK ID_PAGO   |
|NOMBRE       |       |FK ID_CLIENTE|        |FK ID_CLIENTE|        |FK ID_FACTURA|
|RFC          |       +-------------+        |MONTO_TOTAL  |        |MONTO_PAGO   |
+-------------+                              +-------------+        +-------------+
