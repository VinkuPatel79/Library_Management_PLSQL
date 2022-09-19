CREATE OR REPLACE PROCEDURE INSERT_subscription
(
    bid in subscription.bookid%TYPE,
    mid in subscription.memb_id%type,
    subd in subscription.do_sub%type
    
)   

iS
 BEGIN
   insert into subscription(bookid,memb_id,do_sub) values(bid,mid,to_date(subd,'dd-MM-yyyy hh24:mi:ss'));
end;
/


--execute
-- insert into subscription values(2,102,sysdate-5);
--INSERT into subscription values (2,102,'15-sep-2004');
