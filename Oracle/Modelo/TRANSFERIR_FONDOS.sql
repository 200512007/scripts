create or replace PROCEDURE TRANSFERIR_FONDOS
( cuenta_origen IN VARCHAR2, 
  cuenta_destino IN VARCHAR2, 
  importe IN NUMBER
) AS
BEGIN
  
     UPDATE CUENTAS 
     SET SALDO = SALDO - importe
     WHERE CUENTA = cuenta_origen;
	 
     UPDATE CUENTAS 
     SET SALDO = SALDO + importe
     WHERE CUENTA = cuenta_destino;
	 
     INSERT INTO TRANSACCIONES(CUENTA_ORIGEN, CUENTA_DESTINO,IMPORTE, FECHA_MOVIMIENTO)
     VALUES(cuenta_origen, cuenta_destino, importe*(-1), SYSDATE);
	 
     INSERT INTO TRANSACCIONES(CUENTA_ORIGEN, CUENTA_DESTINO,IMPORTE, FECHA_MOVIMIENTO)
     VALUES(cuenta_destino,cuenta_origen, importe, SYSDATE);
	 
     COMMIT;

     EXCEPTION 
     WHEN OTHERS THEN
           dbms_output.put_line('Error en la transaccion:'||SQLERRM);
           dbms_output.put_line('Se deshacen las modificaciones');
           ROLLBACK;
           
  
END TRANSFERIR_FONDOS;

