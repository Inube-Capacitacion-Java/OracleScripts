                                      =====================================
                                      Lenguaje de Definición de Datos (DDL)
                                      =====================================

 Es un lenguaje de programación para definir estructuras de datos, proporcionado por los sistemas gestores de bases
 de datos. En inglés, Data Definition Language, de ahí sus siglas DDL.

 Este lenguaje permite a los programadores de un sistema gestor de base de datos, como Postgres, definir las estructuras
 que almacenarán los datos así como los procedimientos o funciones que permitan consultarlos.

 Para definir las estructura disponemos de tres sentencias:

                      CREATE, se usa para crear una base de datos, tabla, vistas, etc.
                      ALTER, se utiliza para modificar la estructura, por ejemplo
                      añadir o borrar columnas de una tabla.

                      DROP, con esta sentencia, podemos eliminar los objetos de la estructura,
                      por ejemplo un índice o una secuencia.

                                      =======================================
                                      Lenguaje de Manipulación de Datos (DML)
                                      =======================================

 También es un lenguaje proporcionado por los sistemas gestores de bases de datos. En inglés, Data Manipulation Language (DML).

 Utilizando instrucciones de SQL, permite a los usuarios introducir datos para posteriormente realizar tareas de
 consultas o modificación de los datos que contienen las Bases de Datos.

 Los elementos que se utilizan para manipular los datos, son los siguientes:

                  SELECT, esta sentencia se utiliza para realizar consultas sobre los datos.
                  INSERT, con esta instrucción podemos insertar los valores en una base de datos.
                  UPDATE, sirve para modificar los valores de uno o varios registros.
                  DELETE, se utiliza para eliminar las filas de una tabla.

                                      ==================================
                                      Lenguaje de Control de Datos (DCL)
                                      ==================================

 Lenguaje de Control de Datos (DCL)
 Es un lenguaje que incluye una serie de comandos SQL. Como los anteriores, es proporcionado por los sistemas gestores
 de bases de datos. Sus siglas son DCL por su nombre en inglés, Data Control Language.

 Estos comandos permiten al Administrador del sistema gestor de base de datos, controlar el acceso a los objetos, es
 decir,  podemos otorgar o denegar permisos a uno o más roles para realizar determinadas tareas.

 Los comandos para controlar los permisos son los siguientes:

 GRANT, permite otorgar permisos.
 REVOKE, elimina los permisos que previamente se han concedido.