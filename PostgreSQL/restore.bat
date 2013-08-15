createdb -h localhost -p 5432 -U DBA_SYS -T template0 DBP3_Nueva 
pg_restore -i -h localhost -p 5432 -U DBA_SYS -d DBP3_Nueva -v -c "C:\backups\postgreSQL\DBP3_BKP.bkp"
pause