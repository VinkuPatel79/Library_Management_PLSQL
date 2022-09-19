CREATE or replace TRIGGER tak_book before INSERT ON subscription
    for each row
declare
	nc number;
begin
select noofcopies into  nc from lib where bookid=:new.bookid;
  
   
   if(nc=0)
   then

    raise_application_error(-20001,'books are not available');
    
    end if;

	
end; 
/