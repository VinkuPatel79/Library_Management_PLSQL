CREATE OR REPLACE PROCEDURE INSERT_member
(
  id in member.memb_id%type,
  name in member.name%type,
  addr in member.address%type,
  ph in member.phone_no%type
  )

  iS
 BEGIN
   insert into member(memb_id,name,address,phone_no) values(id,name,addr,ph);
   end;
   / 

--exec 
--exec insert_member(101,'VINKU PATEL','BAPUNAGAR',1234567891);   

