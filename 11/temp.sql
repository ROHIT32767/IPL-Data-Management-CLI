DROP DATABASE IF EXISTS IPL_FANTASY_LEAGUE;
CREATE DATABASE IPL_FANTASY_LEAGUE;
USE IPL_FANTASY_LEAGUE;

CREATE TABLE PARTNER (
    CIN INT UNIQUE NOT NULL,
    Name VARCHAR(50) UNIQUE NOT NULL,
    CONSTRAINT PARTNER_PK PRIMARY KEY(CIN)
);

CREATE TABLE PARTNER_TYPE (
    CIN INT UNIQUE NOT NULL,
    Type VARCHAR(50) NOT NULL,
    CONSTRAINT PARTNER_TYPE_PK PRIMARY KEY(CIN, Type),
    CONSTRAINT PARTNER_TYPE_FK
    FOREIGN KEY(CIN) REFERENCES PARTNER(CIN) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE LEAGUE (
    Prize_Money INT NOT NULL DEFAULT 10000000,
    Runner_Up VARCHAR(50) NOT NULL,
    Winner VARCHAR(50) NOT NULL,
    Name VARCHAR(50) NOT NULL,
    Season_Number INT AUTO_INCREMENT UNIQUE NOT NULL,
    CONSTRAINT LEAGUE_PK PRIMARY KEY(Season_Number)
);

CREATE TABLE TEAM (
    Place VARCHAR(50) NOT NULL,
    RTM_Cards INT NOT NULL DEFAULT 0,
    Money_Left INT NOT NULL DEFAULT 0,
    Brand_Value INT NOT NULL DEFAULT 10000000,
    Fair_play_points DECIMAL(5, 2) NOT NULL DEFAULT 0,
    Total_points INT NOT NULL DEFAULT 0,
    Name VARCHAR(50) NOT NULL UNIQUE,
    Coach VARCHAR(50) NOT NULL UNIQUE,
    CONSTRAINT TEAM_PK PRIMARY KEY(Name)
);

CREATE TABLE TEAM_MANAGER (
    Manager_First_Name VARCHAR(50) NOT NULL,
    Manager_Last_Name VARCHAR(50) NOT NULL ,
    Name VARCHAR(50) NOT NULL,
    CONSTRAINT TEAM_MANAGER_PK PRIMARY KEY(Name),
    CONSTRAINT TEAM_MANAGER_UNIQUE UNIQUE(Manager_First_Name, Manager_Last_Name)
);

CREATE TABLE FIXTURE (
    Date_Time TIMESTAMP NOT NULL, 
    Venue VARCHAR(50) NOT NULL ,
    Result VARCHAR(50),
    Match_No INT NOT NULL,
    CONSTRAINT FIXTURE_PK PRIMARY KEY(Date_Time, Venue)
);

CREATE TABLE UMPIRE (
    Date_Time TIMESTAMP NOT NULL, 
    Venue VARCHAR(50) NOT NULL ,
    Umpire_Name VARCHAR(50) NOT NULL UNIQUE,
    Umpire_Position INT NOT NULL,
    CONSTRAINT UMPIRE_PK PRIMARY KEY(Date_Time, Venue, Umpire_Name),
    CONSTRAINT UMPIRE_FK FOREIGN KEY (Date_Time, Venue) REFERENCES FIXTURE(Date_Time, Venue) ON DELETE CASCADE ON UPDATE CASCADE,
    CHECK (Umpire_Position = 1 OR Umpire_Position = 2 OR Umpire_Position = 3)
);

CREATE TABLE FORM (
    Fantasy_points INT NOT NULL DEFAULT 0,
    Form DECIMAL(3, 1) NOT NULL DEFAULT 0,
    CONSTRAINT FORM_PK PRIMARY KEY(Fantasy_points)
);

CREATE TABLE PLAYER (
    Base_price INT NOT NULL,
    Auctioned_price INT NOT NULL DEFAULT 2000000,
    Name VARCHAR(50) NOT NULL UNIQUE,
    CName VARCHAR(50) NOT NULL,
    Fantasy_points INT NOT NULL DEFAULT 0,
    CONSTRAINT PLAYER_PK PRIMARY KEY(Name),
    CONSTRAINT PLAYER_Fantasy_points_FK
    FOREIGN KEY PLAYER(Fantasy_points) REFERENCES FORM(Fantasy_points),
    CONSTRAINT PLAYER_CName_FK
    FOREIGN KEY PLAYER(CName) REFERENCES PLAYER(Name) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE AWARDS (
    Prize_Money INT NOT NULL DEFAULT 100000,
    Name VARCHAR(50) NOT NULL,
    AWARDED_IN INT NOT NULL,
    AWARDED_TO VARCHAR(50) NOT NULL UNIQUE,
    CONSTRAINT AWARDS_PK PRIMARY KEY(Name, AWARDED_IN, AWARDED_TO),
    CONSTRAINT AWARDS_AWARDED_IN_FK
    FOREIGN KEY(AWARDED_IN) REFERENCES LEAGUE(Season_Number) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT AWARDS_AWARDED_TO_FK
    FOREIGN KEY(AWARDED_TO) REFERENCES PLAYER(Name) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE SPONSORS_PLAYER (
    Name VARCHAR(50) NOT NULL,
    CIN INT NOT NULL,
    CONSTRAINT SPONSORS_PLAYER_PK PRIMARY KEY(Name, CIN),
    CONSTRAINT SPONSORS_PLAYER_Name_FK 
    FOREIGN KEY(Name) REFERENCES PLAYER(Name) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT SPONSORS_PLAYER_CIN_FK
    FOREIGN KEY(CIN) REFERENCES PARTNER(CIN) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE SPONSORS_LEAGUE (
    Number INT NOT NULL,
    CIN INT NOT NULL,
    CONSTRAINT SPONSORS_LEAGUE_PK PRIMARY KEY(Number, CIN),
    CONSTRAINT SPONSORS_LEAGUE_Number_FK 
    FOREIGN KEY(Number) REFERENCES LEAGUE(Season_Number) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT SPONSORS_LEAGUE_CIN_FK
    FOREIGN KEY(CIN) REFERENCES PARTNER(CIN) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE SPONSORS_TEAM (
    Name VARCHAR(50) NOT NULL,
    CIN INT NOT NULL,
    CONSTRAINT SPONSORS_TEAM_PK PRIMARY KEY(Name, CIN),
    CONSTRAINT SPONSORS_TEAM_Name_FK 
    FOREIGN KEY(Name) REFERENCES TEAM(Name) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT SPONSORS_Team_CIN_FK
    FOREIGN KEY(CIN) REFERENCES PARTNER(CIN) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE PLAYS_IN(
    Name VARCHAR(50) NOT NULL,
    Date_Time TIMESTAMP NOT NULL,
    Venue VARCHAR(50) NOT NULL,
    CONSTRAINT PLAYS_IN_PK PRIMARY KEY(Name, Date_Time, Venue),
    CONSTRAINT PLAYS_IN_Name_FK
    FOREIGN KEY(Name) REFERENCES TEAM(Name) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT PLAYS_IN_Date_Time_Venue_FK
    FOREIGN KEY(Date_Time, Venue) REFERENCES FIXTURE(Date_Time, Venue) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE PLAYS_FOR_IN_OF (
    PName VARCHAR(50) NOT NULL,
    TName VARCHAR(50) NOT NULL,
    Date_Time TIMESTAMP NOT NULL,
    Venue VARCHAR(50) NOT NULL,
    Season_Number INT NOT NULL,
    CONSTRAINT PLAYS_FOR_IN_OF_PK PRIMARY KEY(PName, TName, Date_Time, Venue, Season_Number),
    CONSTRAINT PLAYS_FOR_IN_OF_PName_FK
    FOREIGN KEY(PName) REFERENCES PLAYER(Name) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT PLAYS_FOR_IN_OF_TName_FK
    FOREIGN KEY(TName) REFERENCES TEAM(Name) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT PLAYS_FOR_IN_OF_Date_Time_Venue_FK
    FOREIGN KEY(Date_Time, Venue) REFERENCES FIXTURE(Date_Time, Venue) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT PLAYS_FOR_IN_OF_Season_Number_FK
    FOREIGN KEY(Season_Number) REFERENCES LEAGUE(Season_Number) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE COMMENTATORS(
    Date_Time TIMESTAMP NOT NULL,
    Venue VARCHAR(50) NOT NULL,
    Commentators VARCHAR(50) NOT NULL,
    CONSTRAINT COMMENTATORS_PK PRIMARY KEY(Date_Time, Venue, Commentators),
    CONSTRAINT COMMENTATORS_Date_Time_Venue_FK
    FOREIGN KEY(Date_Time, Venue) REFERENCES FIXTURE(Date_Time, Venue) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE JERSEY(
    Jersey_Number INT NOT NULL,
    BELONGS_TO VARCHAR(50) NOT NULL,
    CONSTRAINT JERSEY_PK PRIMARY KEY(Jersey_Number, BELONGS_TO),
    CONSTRAINT JERSEY_BELONGS_TO_FK
    FOREIGN KEY(BELONGS_TO) REFERENCES TEAM(Name) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO TEAM VALUES ('Wankhede Stadium', 4, 960000, 125000000, 0, 0, 'Mumbai Indians', 'Mahela Jayawardane'),
('Chepauk Stadium', 5, 14000000, 200000000, 0, 0, 'Chennai Super Kings', 'Stephen Fleming'),
('Rajiv Gandhi Stadium', 3,15600000, 60000000, 0,0,'Sunrisers Hyderabad','Tom Moody'),
('Chinnaswamy Stadium',4,30000000,246000000,0,0,'Royal Challengers Bangalore','Sanjay Bangar'),
('Narendra Modi Stadium',1,2000000,50000000,0,0,'Gujarat Titans','Gary Kirsten'),
('Eden Gardens',2,7500000,120000000,0,0,'Kolkata Knight Riders','Brendon McCullum'),
('Sardar Vallabhbhai Patel Stadium',3,20000000,1150000000,0,0,'Lucknow Super Giants','Gautam Gambhir'),
('Mohali Stadium',4,50000000,900000000,0,0,'Punjab Kings','Anil Kumble'),
('Feroz Shah Kotla Ground',0,1000000,1800000000,0,0,'Delhi Capitals','Ricky Ponting'),
('Sawai Mansingh Stadium',3,11500000,1900000000,0,0,'Rajasthan Royals','Kumar Sangakkara');

INSERT INTO JERSEY VALUES (7, 'Chennai Super Kings'),
(18, 'Royal Challengers Bangalore'),
(45, 'Mumbai Indians'),
(31, 'Sunrisers Hyderabad');

INSERT INTO FORM VALUES (307,7.6),(276,6.9),(203,5.1),(294,7.3),(200,5.0),(372,9.3),(265,6.3),(233,5.8),(191,4.7),(287,7.1);

INSERT INTO PLAYER VALUES ('150000000','200000000','Hardik Pandya','Hardik Pandya',287),
('100000000','156000000','Kane Williamson','Kane Williamson',191),
('90000000','125000000','Faf Du Plessis','Faf Du Plessis',233),
('75000000','135000000','Shreyas Iyer','Shreyas Iyer',265),
('170000000','200000000','Virat Kohli','Faf Du Plessis',307),
('150000000','170000000','Rohit Sharma','Rohit Sharma',276),
('120000000','150000000','MS Dhoni','MS Dhoni',203),
('100000000','140000000','David Warner','Kane Williamson',294),
('90000000','150000000','Rashid Khan','Hardik Pandya',200),
('85000000','120000000','Andre Russell','Shreyas Iyer',372);

INSERT INTO FIXTURE VALUES ('2022-03-26 19:30:00.000','Chepauk Stadium','Kolkata Knight Riders',1), -- KKR VS CSK
('2022-05-08 15:30:00.000','Chinnaswamy Stadium','Royal Challengers Bangalore',54), -- RCB vs 
('2022-05-07 19:30:00.000','Wankhede Stadium','Mumbai Indians',51), -- MI vs 
('2022-04-15 19:30:00.000','Narendra Modi Stadium','Sunrisers Hyderabad',25), -- SRH 
('2022-04-21 19:30:00.000','Chepauk Stadium', 'Chennai Super Kings',33), -- CSK vs 
('2022-04-09 15:30:00.000','Mohali Stadium','Rajasthan Royals',12), -- PBKS VS RR
('2022-03-26 15:30:00.000','Feroz Shah Kotla Ground','Delhi Capitals',19), -- DC vs SRH done
('2022-04-28 19:30:00.000','Rajiv Gandhi Stadium','Sunrisers Hyderabad',7), -- SRH vs RCB
('2022-05-24 15:30:00.000','Sawai Mansingh Stadium','Gujarat Titans',29), -- GT vs RR done 14
('2022-05-12 19:30:00.000','Sardar Vallabhbhai Patel Stadium','Lucknow Super Giants',36), -- LSG vs MI done
('2022-05-17 19:30:00.000','Eden Gardens','Kolkata Knight Riders',4); -- KKR vs LSG


INSERT INTO PARTNER VALUES (830940635,'Disney + Hotstar'),(131235894,'CRED'),(110415674,'CEAT'),(371251789,'Paytm'),(833192133,'Aramco'),(0847819876,'TATA'),(547811128,'Unacademy');

INSERT INTO PARTNER_TYPE VALUES (830940635,'Digital Streaming Partner'),(131235894,'Official Partner'),(110415674,'Strategic Timeout Partner'),(371251789,'Umpire Partner'),(833192133,'Official Orange & Purple Cap Partner'),
(0847819876,'Title Sponsor'),(547811128,'Official Partner');

INSERT INTO LEAGUE VALUES (200000000,'Chennai Super Kings','Rajasthan Royals','DLF IPL',1),
(200000000,'Royal Challengers Bangalore','Sunrisers Hyderabad','DLF IPL',2),
(200000000,'Mumbai Indians','Chennai Super Kings','DLF IPL',3),
(200000000,'Royal Challengers Bangalore','Chennai Super Kings','DLF IPL',4),
(200000000,'Chennai Super Kings','Kolkata Knight Riders','DLF IPL',5),
(200000000,'Chennai Super Kings','Mumbai Indians','Pepsi IPL',6),
(200000000,'Punjab Kings','Kolkata Knight Riders','Pepsi IPL',7),
(200000000,'Chennai Super Kings','Mumbai Indians','Pepsi IPL',8),
(200000000,'Royal Challengers Bangalore','Sunrisers Hyderabad','Vivo IPL',9),
(200000000,'Lucknow Super Giants','Mumbai Indians','Vivo IPL',10),
(200000000,'Sunrisers Hyderabad','Chennai Super Kings','Vivo IPL',11),
(200000000,'Chennai Super Kings','Mumbai Indians','Vivo IPL',12),
(200000000,'Delhi Capitals','Mumbai Indians','Dream 11 IPL',13),
(200000000,'Kolkata Knight Riders','Chennai Super Kings','Dream 11 IPL',14),
(200000000,'Rajasthan Royals','Gujarat Titans','TATA IPL',15);

INSERT INTO TEAM_MANAGER VALUES ('Mukesh','Ambani','Mumbai Indians'),
('Narayanaswami','Srinivasan','Chennai Super Kings'),
('Vijay','Mallya','Royal Challengers Bangalore'),
('Raj','Kundra','Rajasthan Royals'),
('Ness','Wadia','Punjab Kings'),
('ShahRukh','Khan','Kolkata Knight Riders'),
('Parth','Jindal','Delhi Capitals'),
('Kalanithi','Maran','Sunrisers Hyderabad'),
('Steve','Koltes','Gujarat Titans'),
('Sanjeev','Goenka','Lucknow Super Giants');

INSERT INTO UMPIRE VALUES ('2022-03-26 19:30:00.000','Chepauk Stadium','Kumar Dharmasena',1),
('2022-05-08 15:30:00.000','Chinnaswamy Stadium','Sundaram Ravi',2),
('2022-05-07 19:30:00.000','Wankhede Stadium','Anil Chaudhary',3),
('2022-04-15 19:30:00.000','Narendra Modi Stadium','Marais Erasmus',2),
('2022-04-21 19:30:00.000','Chepauk Stadium','Nitin Menon',1);

INSERT INTO COMMENTATORS VALUES ('2022-03-26 19:30:00.000','Chepauk Stadium','Harsha Bhogle'),
('2022-05-08 15:30:00.000','Chinnaswamy Stadium','Ravi Shastri'),
('2022-05-07 19:30:00.000','Wankhede Stadium','Sanjay Manjrekar'),
('2022-04-15 19:30:00.000','Narendra Modi Stadium','Danny Morrison'),
('2022-04-21 19:30:00.000','Chepauk Stadium','Simon Doull');

INSERT INTO AWARDS VALUES (100000,'Man of the Match',9,'Andre Russell'),
(500000,'Man of the Tournament',13,'Virat Kohli'),
(100000,'Emerging Player of the Season',12,'Shreyas Iyer'),
(300000,'Super-striker of the Season',8,'Hardik Pandya'),
(100000,'Game changer of the Match',8,'Kane Williamson');

INSERT INTO SPONSORS_PLAYER VALUES ('Virat Kohli', 110415674),('Hardik Pandya',131235894),('Kane Williamson',547811128);
INSERT INTO SPONSORS_LEAGUE VALUES (15,0847819876),(13,371251789),(8,830940635);
INSERT INTO SPONSORS_TEAM VALUES ('Gujarat Titans',833192133),('Chennai Super Kings', 110415674),('Royal Challengers Bangalore',0847819876);

INSERT INTO PLAYS_IN VALUES ('Kolkata Knight Riders','2022-03-26 19:30:00.000','Chepauk Stadium'),
('Royal Challengers Bangalore','2022-05-08 15:30:00.000','Chinnaswamy Stadium'),
('Mumbai Indians','2022-05-07 19:30:00.000','Wankhede Stadium'),
('Sunrisers Hyderabad','2022-04-15 19:30:00.000','Narendra Modi Stadium'),
('Delhi Capitals','2022-03-26 15:30:00.000','Feroz Shah Kotla Ground'),
('Sunrisers Hyderabad','2022-03-26 15:30:00.000','Feroz Shah Kotla Ground'),
('Gujarat Titans','2022-05-24 15:30:00.000','Sawai Mansingh Stadium'),
('Rajasthan Royals','2022-05-24 15:30:00.000','Sawai Mansingh Stadium'),
('Lucknow Super Giants','2022-05-12 19:30:00.000','Sardar Vallabhbhai Patel Stadium'),
('Mumbai Indians','2022-05-12 19:30:00.000','Sardar Vallabhbhai Patel Stadium'),
('Chennai Super Kings','2022-04-21 19:30:00.000','Chepauk Stadium');

INSERT INTO PLAYS_FOR_IN_OF VALUES  ('Andre Russell','Kolkata Knight Riders','2022-03-26 19:30:00.000','Chepauk Stadium',3),
('Virat Kohli','Royal Challengers Bangalore','2022-05-08 15:30:00.000','Chinnaswamy Stadium',7),
('Faf Du Plessis','Royal Challengers Bangalore','2022-05-08 15:30:00.000','Chinnaswamy Stadium',7),
('Rohit Sharma','Mumbai Indians','2022-05-07 19:30:00.000','Wankhede Stadium',12),
('David Warner','Sunrisers Hyderabad','2022-04-15 19:30:00.000','Narendra Modi Stadium',15),
('Rashid Khan','Gujarat Titans','2022-05-24 15:30:00.000','Sawai Mansingh Stadium',14),
('Hardik Pandya','Gujarat Titans','2022-05-24 15:30:00.000','Sawai Mansingh Stadium',14),
('Shreyas Iyer','Kolkata Knight Riders','2022-03-26 19:30:00.000','Chepauk Stadium',3),
('Kane Williamson','Sunrisers Hyderabad','2022-04-15 19:30:00.000','Narendra Modi Stadium',15),
('MS Dhoni','Chennai Super Kings','2022-04-21 19:30:00.000','Chepauk Stadium',11);