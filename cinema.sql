create database CINEMA;
use CINEMA;

create table Admins(
    ID int KEY NOT NULL,
    nom VARCHAR(20) NOT NULL,
    pass VARCHAR(50) NOT NULL,
    signindate VARCHAR(11) NOT NULL
);

---------------------------------
show tables;


insert into Admins values (1, 'Alma', 'ebbc3c26a34b609dc46f5c3378f96e08', '30/08/2022');
insert into Admins values (2, 'Ledri', '97d776ba1a18978559710ff9657d1c03', '22/03/2015');
insert into Admins values (3, 'Armando', '76781364472416dabd4707b75946ef72', '08/09/2008');
insert into Admins values (4, 'Donna', 'b84c8ce8dba041cef912c1116f6b7236', '16/03/2014');

select * from Admins;

-----------------------------------------------------------------------------------------------

create table Client(
    ID int NOT NULL,
    first_name VARCHAR(20) NOT NULL,
    last_name VARCHAR(15) NOT NULL,
    age VARCHAR(2) NOT NULL,
    signindate VARCHAR(11) NOT NULL
);

---------------------------------

insert into Client values (1, 'Denver', 'Lorente', '30', '12/12/2017');
insert into Client values (2, 'Tokyo', 'Corbero', '33', '18/10/2017');
insert into Client values (3, 'Rio', 'Cortez', '27', '05/01/2017');
insert into Client values (4, 'Berlin', 'Alonso', '43', '25/11/2017');
insert into Client values (5, 'Stockholm', 'Lorente', '34', '13/12/2017');
insert into Client values (6, 'Nairobi', 'Flores', '25', '21/05/2017');

select * from Client;

-----------------------------------------------------------------------------------------------

create table Cinema(
    ID int Primary key NOT NULL,
    Nom VARCHAR(20) NOT NULL,
    City VARCHAR(20) NOT NULL,
    Rooms INT(2) NOT NULL,
    Admins_id int NOT NULL,
    FOREIGN KEY(Admins_id) REFERENCES Admins(ID)
);

---------------------------------

insert into Cinema values (1, 'Elios_Cine', 'Bern', 155, 1);
insert into Cinema values (3, 'Summer_Day', 'Barcelona', 8, 2);
insert into Cinema values (2, 'Kine_Vula', 'Tirana', 18, 3);
insert into Cinema values (4, 'Radio_City_Hall', 'New_York', 26, 4);

select * from Cinema;

-----------------------------------------------------------------------------------------------

create table Movie(  
    ID int PRIMARY KEY NOT NULL,
    Nom VARCHAR(30),
    realaseDate VARCHAR(11),
    Category VARCHAR(30)
    );

---------------------------------

INSERT INTO Movie values (1, 'Doctor_Strange_2','04/05/2022', 'Action/Aventure');
INSERT INTO Movie VALUES (2, 'Uncharted', '18/02/2022', 'Action');
INSERT INTO Movie VALUES (3, 'Morbius', '30/03/2022', 'Action/Cine Fantasy');
INSERT INTO Movie VALUES (4, 'Top_Gun', '25/05/2022', 'Action/Aventure');
INSERT INTO Movie VALUES (5,'Le_Bal_De_L.Enfer', '24/08/2022', 'Horror');

-----------------------------------------------------------------------------------------------

create table Price(
    ID int Primary Key not null,
    Movie_ID int not null,
    Type VARCHAR(30),
    Price int(2) not null,
    FOREIGN KEY(Movie_ID) REFERENCES Movie(ID)
    );

alter table Price modify Price int(2) not null;

---------------------------------

INSERT INTO Price values (1, 2, 'Etudiant', 12);
INSERT INTO Price VALUES (2, 1, 'Adulte', 9);
INSERT INTO Price VALUES (3, 3, 'Etudiant', 9);
INSERT INTO Price VALUES (4, 4, 'Etudiant', 10);
INSERT INTO Price VALUES (5, 5, 'Adulte', 10);

-----------------------------------------------------------------------------------------------

create table Room(
    ID int PRIMARY KEY not null,
    cinema_ID int not null,
    Places DECIMAL(10,2),
    FOREIGN KEY(cinema_ID) REFERENCES Cinema(ID)
    );

alter table Room modify Places int(5) not null;

---------------------------------

INSERT INTO Room values (1, 1, 600);
INSERT INTO Room VALUES (2, 2, 512);
INSERT INTO Room VALUES (3, 3, 350);
INSERT INTO Room VALUES (4, 4, 480);
INSERT INTO Room VALUES (5, 5, 460);

-----------------------------------------------------------------------------------------------

create table Seance(
    ID int Primary KEY not null,
    Movie_ID int not null,
    Cinema_ID int not null,
    Dates VARCHAR(11),
    Hour VARCHAR (5),
    Room_ID int not null,
    FOREIGN KEY (Movie_ID) REFERENCES Movie(ID),
);

alter table Seance
    add CONSTRAINT fk_Cinema
    FOREIGN KEY(Cinema_ID) REFERENCES Cinema(ID);

alter table Seance
    add CONSTRAINT fk_Room
    FOREIGN KEY(Room_ID) REFERENCES Room(ID) ;

---------------------------------

INSERT INTO Seance values (1, 1, );
INSERT INTO Seance VALUES (2, 2, );
INSERT INTO Seance VALUES (3, 3, );
INSERT INTO Seance VALUES (4, 4, );
INSERT INTO Seance VALUES (5, 5, );

-----------------------------------------------------------------------------------------------

create table Reservation(
    ID INT PRIMARY KEY NOT NULL,
    Order_ID int not null,
    Price DECIMAL(10,2),
    Seance_ID int not null,
    FOREIGN KEY (Seance_ID) REFERENCES Seance(ID)
);

alter table Reservation
    add CONSTRAINT fk_Order
    FOREIGN KEY (Order_ID) REFERENCES Order(ID);

alter table Reservationlast_name
    add CONSTRAINT fk_Seance
    FOREIGN KEY (Seance_ID) REFERENCES Seance(ID);
---------------------------------




-----------------------------------------------------------------------------------------------

create table Order(
    ID INT PRIMARY KEY NOT NULL,
    Client_ID INT NOT NULL,
    Total int(10) not null,
    Statu VARCHAR(30)not null,
    Purchase_date VARCHAR (20),
    FOREIGN KEY (Client_ID) REFERENCES Client(ID)
);

---------------------------------



-----------------------------------------------------------------------------------------------

create table INDEXX(
    ID int PRIMARY KEY not null,
    Admins_ID int not null,
    Cinema_ID int not null,
    FOREIGN KEY (Admins_ID) REFERENCES Admins(ID),
    FOREIGN KEY (Cinema_ID) REFERENCES Cinema(ID)
);


---------------------------------



-----------------------------------------------------------------------------------------------
ALTER TABLE CINEMA.Client MODIFY COLUMN age int(3) NOT NULL;
ALTER TABLE CINEMA.Reservation DROP FOREIGN KEY Reservation_ibfk_1;ALTER TABLE CINEMA.Reservation DROP FOREIGN KEY Reservation_ibfk_1;
RENAME TABLE CINEMA.INDEXX TO CINEMA.INDEXX_CA;

ALTER TABLE Client 
    ADD CONSTRAINT fk_Client 
    FOREIGN KEY (Rsrv_ID) REFERENCES Reservation(ID);

ALTER TABLE Client ADD Rsrv_ID int not NULL;
ALTER TABLE Client DROP Rsrv_ID;






select cinema.city as cinecity, admins.name as admname
from Cinema
inner join admins
on cinema.admins = admins.id
group by admins.name
where cinecity = 1 ;


select * from TRAIN
    inner join TICKET
    inner join COMMANDE
    inner join CLIENT.FirstName AND CLIENT.LastName



SELECT TRAIN.ID, CLIENT_FirstName
FROM CLIENT
INNER JOIN COMMANDE
ON CLIENT.ID = COMMANDE.Client_ID
INNER JOIN TICKET
ON COMMANDE.ID = TICKET.Commande_ID
INNER JOIN TRAIN
ON TICKET.ID = TRAIN.ID
GROUP BY TRAIN.ID
WHERE CLIENT.ID = 2;


<?php
  if ($_SERVER["REQUEST_METHOD"] == "GET"){
    $try = "first try";
  }
  else {
    $try = "Post request sent with ".$_POST['name'];
  }

?>
<html>
  <head>
    <title>PHP Test</title>
  </head>
  <body>
    <?php 
      echo $try;
      echo '<p>Hello World</p>'; 
      $hello = "there";
      echo '<h1>'.$hello.'</h1>';
      echo $_ENV['dbname'];
    ?> 
<form method="post" >
      <p>votre nom :</p><input name="name" type="text"></p>
      <p>votre age :</p><input name="age" type="text"></p>
      <button>c mwoi</button>
    </form>


    <html>
  <head>
    <title>PHP Test</title>
  
  </head>
  <body>
    <?php $try;
      $TAG = "FORMULAIRE";
      echo '<h1>' .$TAG. '</h1>';

      if ($_SERVER["REQUEST_METHOD"] == "GET"){
        $try = "YOU WIN";
      }
      else {
        $try = "Post request sent with ".$_POST['name'];
        $name htmlspecialchars
      }
    ?>

    <form method="post">
      <h4> What is your Name ?</h4>
      <input type="text" name="name" id="name">

      <h4>Write your Email</h4>
      <input type="email" name="email" id="email">

      <h4>Write</h4>
      <input type="password" name="pass" id="pass">

      <br>
      <br>      
      
      <button>SEND</button>
    </form>

    <h2>HELLO THERE !!!</h2>

    --afficher les données et sécurisez les données reçu--
    
    <script src="https://replit.com/public/js/replit-badge.js" theme="blue" defer></script> 
  </body>
</html>



---------------------------------------------------------------------------------------

-- Envoyer par Christophe

<?php
  if ($_SERVER["REQUEST_METHOD"] == "GET"){
    $try = "first try";
  }
  else {
    $try = "Post request sent with ".$_POST['name'];

  }

?>
<html>
    <head>
        <title>PHP Test</title>
    </head>
    <body>
        <?php 
            echo $try;
            echo '<p>Hello World</p>'; 
            $hello = "there";
            echo '<h1>'.$hello.'</h1>';
            echo $_ENV['dbname'];
        ?> 
        <form method="post" >
            <p>votre nom :</p><input name="name" type="text"></p>
            <p>votre age :</p><input name="age" type="text"></p>
            <button>c mwoi</button>
        </form>
    </body>
</html>