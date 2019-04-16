create or replace FUNCTION DAYS360 
(
  DT_END IN DATE DEFAULT sysdate 
, DT_START IN DATE 
) RETURN NUMBER AS 
v_final_resualt NUMBER;
v_dt_end date;
BEGIN
if dt_end is null THEN
v_dt_end:=trunc(sysdate);
else
v_dt_end:=dt_end;
end if;
v_final_resualt:=(least( extract( day from v_dt_end ), 30 ) - least( extract( day from DT_START ), 30 )+1)
       + (30 * ( extract( month from v_dt_end ) - extract( month from DT_START ) ) )
       + (360 * ( extract( year from v_dt_end ) - extract( year from DT_START ) ));
  RETURN v_final_resualt;
END DAYS360;