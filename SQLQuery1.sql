create table userdata(
id int primary key identity(1,1),
firstname varchar(20),
lastname varchar(20),
username varchar(40),
phonenumber int,
gender varchar(8),
pw varchar(20),
repw varchar(20)
);

insert into userdata(firstname,lastname,username,phonenumber,gender, pw, repw) values ('Saif',
'Battah','SaifBattah',0595556418,'Male', '1234', '1234');

select * from userdata

create table booktable(
id int primary key identity(1,1),
bookname varchar(50),
authorname varchar(50),
booktype varchar(50),
pagenumbers int,
available varchar(10)
);

insert into booktable(bookname,booktype,authorname,pagenumbers,available) values ('SQL Basics','Data Base','Dr.Hafiz',500,'true');
insert into booktable(bookname,booktype,authorname,pagenumbers,available) values ('Trees','Data Structure','Dr.Rami',300,'true');
insert into booktable(bookname,booktype,authorname,pagenumbers,available) values ('Loops','Java','Dr.Sami',200,'true');
insert into booktable(bookname,booktype,authorname,pagenumbers,available) values ('OOP','Java','Dr.Hafiz',520,'true');
insert into booktable(bookname,booktype,authorname,pagenumbers,available) values ('Functions','Java','Dr.Ali',320,'true');
insert into booktable(bookname,booktype,authorname,pagenumbers,available) values ('Binding','Data Base','Dr.Sami',450,'true');
insert into booktable(bookname,booktype,authorname,pagenumbers,available) values ('Wheres','Data Base','Dr.Anas',220,'true');
insert into booktable(bookname,booktype,authorname,pagenumbers,available) values ('Linked Lists','Data Structure','Dr.Khaled',200,'true');
insert into booktable(bookname,booktype,authorname,pagenumbers,available) values ('Structs','C','Dr.Mohammad',250,'true');
insert into booktable(bookname,booktype,authorname,pagenumbers,available) values ('CSS','C#','Dr.Rami',240,'true');
insert into booktable(bookname,booktype,authorname,pagenumbers,available) values ('Interfaces','C#','Dr.Ahmad',520,'true');
insert into booktable(bookname,booktype,authorname,pagenumbers,available) values ('C Loops','C','Dr.Sameer',100,'true');
insert into booktable(bookname,booktype,authorname,pagenumbers,available) values ('C Pointers','C','Dr.Ali',340,'true');
insert into booktable(bookname,booktype,authorname,pagenumbers,available) values ('PWD','Shell','Dr.Nassar',730,'true');
insert into booktable(bookname,booktype,authorname,pagenumbers,available) values ('Shell Introduction','Shell','Dr.Tawfiq',560,'true');

select * from booktable;
