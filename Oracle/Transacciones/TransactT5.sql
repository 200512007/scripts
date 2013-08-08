--TRANSACCION T5

DECLARE
   status_ckp checkpoint_sim.status%TYPE := 1;
   exit_stmt NUMBER := 1;
BEGIN

 	WHILE (exit_stmt = 1)
    LOOP
    
      SELECT status
      INTO status_ckp
      FROM checkpoint_sim;
  
      IF (status_ckp = 6) THEN --Si el status es 6 cosa que no pasara para simular la transaccion T5
      
        TRANSFERIR_FONDOS('2510 10 2000 9887787887','5687 10 2000 8754652212',2500); 
        COMMIT;
        
        exit_stmt :=0;
        
      END IF;
          
    END LOOP;
    
    
END;
