@echo off
echo CREATE OR REPLACE DIRECTORY DATA_DUMP AS '%~dp0';>create_directory.sql
echo exit>>create_directory.sql
sqlplus sys/oracle as sysdba @create_directory.sql
del create_directory.sql
pause