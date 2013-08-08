--TRANSACCION T2

DECLARE
   status_ckp checkpoint_sim.status%TYPE := 1;
   exit_stmt NUMBER := 1;
BEGIN
 
 	WHILE (exit_stmt = 1)
    LOOP
    
      SELECT status
      INTO status_ckp
      FROM checkpoint_sim;
  
      IF (status_ckp =3) THEN  --Si el status es 3 entonces
      
        UPDATE CHECKPOINT_SIM  --Actualizamos el status para que se pueda forzar el CHECKPOINT
        SET STATUS = 1;
        COMMIT;               
        
        --Se ejecuta la transaccion y se realiza commit
        TRANSFERIR_FONDOS('2530 10 2000 1234567890','2574 10 2000 2211100112',100); 
        COMMIT;
        
        exit_stmt :=0; 
        
      END IF;
          
    END LOOP;
      
END;




