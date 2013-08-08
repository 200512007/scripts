
  --Actualiza el status para poder liberar la transaccion T2
  UPDATE CHECKPOINT_SIM
  SET STATUS = 3;
  COMMIT;