CREATE OR REPLACE PROCEDURE INSERT_book
(
    bid in books.bookid%type,
    bname in books.bookname%type,
    av in books.available%type,
   
    au in books.author%type 
)
iS
 BEGIN
   insert into books(bookid,bookname,available,author) values(bid,bname,av,au);
   
   
   end;
   /



--execute
--exec insert_book(1,'MATHS','YES','manish ');