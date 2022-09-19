CREATE or replace TRIGGER take_book after INSERT ON subscription
    for each row
declare
	nc number;
begin
select noofcopies into  nc from lib where bookid=:new.bookid;
   update lib set noofcopies=nc-1 where bookid=:new.bookid;
   select noofcopies into  nc from lib where bookid=:new.bookid;
   if(nc=0)
   then
    update books set available='NO' where  bookid=:new.bookid;
   end if;
end; 
/