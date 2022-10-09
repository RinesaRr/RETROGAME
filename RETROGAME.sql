create database RETROGAME;
use RETROGAME;

create table Admins(
    ID int KEY NOT NULL,
    email VARCHAR(20) NOT NULL,
    passwords VARCHAR(50) NOT NULL
);

---------------------------------
show tables;


insert into Admins values (1, 'email', 'ebbc3c26a34b609dc46f5c3378f96e08', '30/08/1898');
insert into Admins values (2, 'email', '97d776ba1a18978559710ff9657d1c03', '22/03/1975');
insert into Admins values (3, 'email', '76781364472416dabd4707b75946ef72', '08/09/1993');
insert into Admins values (4, 'email', 'b84c8ce8dba041cef912c1116f6b7236', '16/03/1989');

select * from Admin;

-------------------------------------------------------------------------

create table Account(
    ID int KEY NOT NULL,
    nom VARCHAR(20) NOT NULL,
    pass VARCHAR(50) NOT NULL,
    signindate VARCHAR(11) NOT NULL
);

---------------------------------
show tables;


insert into Account values (1, 'Alma', 'ebbc3c26a34b609dc46f5c3378f96e08', '30/08/2022');
insert into Account values (2, 'Ledri', '97d776ba1a18978559710ff9657d1c03', '22/03/2015');
insert into Account values (3, 'Armando', '76781364472416dabd4707b75946ef72', '08/09/2008');
insert into Account values (4, 'Donna', 'b84c8ce8dba041cef912c1116f6b7236', '16/03/2014');

select * from Account;

--------------------------------------------------------------------------

create table order(
    ID int KEY NOT NULL,
    nom VARCHAR(20) NOT NULL,
     VARCHAR(50) NOT NULL,
     VARCHAR(11) NOT NULL
);


show tables;


insert into Account values (1, 'Alma', 'ebbc3c26a34b609dc46f5c3378f96e08', '30/08/2022');
insert into Account values (2, 'Ledri', '97d776ba1a18978559710ff9657d1c03', '22/03/2015');
insert into Account values (3, 'Armando', '76781364472416dabd4707b75946ef72', '08/09/2008');
insert into Account values (4, 'Donna', 'b84c8ce8dba041cef912c1116f6b7236', '16/03/2014');

select * from Account;