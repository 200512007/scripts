--FORZAR CHECKPOINT GLOBAL

DECLARE
   ckpstmt  VARCHAR2(1024) := 'alter system checkpoint global';
   status_ckp checkpoint_sim.status%TYPE := 1;
   exit_stmt NUMBER := 1;
BEGIN
 
 	WHILE (exit_stmt = 1)
    LOOP
    
      SELECT status
      INTO status_ckp
      FROM checkpoint_sim;
  
      IF (status_ckp =1) THEN  --Si el estatus es 1 entonces 
        EXECUTE IMMEDIATE ckpstmt; --Se ejecuta un ALTER SYSTEM CHECKPOINT GLOBAL
      
        UPDATE CHECKPOINT_SIM --Se cambia el status y se libera la operacion T2
        SET STATUS = 2;
        
        exit_stmt :=0;
        COMMIT; --Se realiza commit para guardar el status de la simulacion
        
      END IF;
          
    END LOOP;
    
    --TRANSACCION T4
    TRANSFERIR_FONDOS('5687 10 2000 8754652212','2510 10 2000 9887787887',2500); 
    COMMIT;
    
END;

