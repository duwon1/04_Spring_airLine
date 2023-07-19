set head off
set pagesize 0
set verify off
set feedback off
spool drop_objects.sql
select 'drop ' || object_type || ' ' || object_name || ' ' ||
decode(object_type, 'TABLE', 'CASCADE CONSTRAINTS;', ';')
from user_objects;
spool off
@drop_objects.sql
exit
