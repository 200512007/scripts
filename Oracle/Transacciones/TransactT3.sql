--TRANSACCION T3

DECLARE
   status_ckp checkpoint_sim.status%TYPE := 1;
   exit_stmt NUMBER := 1;
BEGIN
 
 	WHILE (exit_stmt = 1)
    LOOP
    
      SELECT status
      INTO status_ckp
      FROM checkpoint_sim;
  
      IF (status_ckp =5) THEN  --Si el status es 5 cosa que nunca pasara para simular la transaccion T3
      
        TRANSFERIR_FONDOS('2574 10 2000 2211100112','2530 10 2000 1234567890',100); 
        COMMIT;
  
        exit_stmt :=0;
        
      END IF;
          
    END LOOP;
    
END;
