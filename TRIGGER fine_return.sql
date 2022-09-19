CREATE or replace TRIGGER return_fine after INSERT ON returns
    for each row
declare
	subscription_date date;
	f_amount number;
	days_between number;
	nc number; 
begin
   update lib set noofcopies=noofcopies+1 where bookid=:new.book_id;
   select noofcopies into  nc from lib where bookid=:new.book_id;
   if(nc=1)
   then
   update books set available='yes' where  bookid=:new.book_id;
 end if;

	select do_sub into subscription_date from subscription
	where bookid = :new.book_id and memb_id = :new.memb_id;

	if subscription_date + 30 < :new.return_date then
		days_between := ROUND(MONTHS_BETWEEN (:new.return_date, subscription_date + 30)*30, 0);
		f_amount := days_between * 10;
		insert into fine(memb_id, amount) values(:new.memb_id, f_amount);
	end if;
end; 
/