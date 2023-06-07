-- MySQL dump 10.13  Distrib 8.0.29, for Linux (x86_64)
--
-- Host: localhost    Database: IPL_FANTASY_LEAGUE
-- ------------------------------------------------------
-- Server version       8.0.29

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `AWARDS`
--

DROP TABLE IF EXISTS `AWARDS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AWARDS` (
  `Prize_Money` int NOT NULL DEFAULT '100000',
  `Name` varchar(50) NOT NULL,
  `AWARDED_IN` int NOT NULL,
  `AWARDED_TO` varchar(50) NOT NULL,
  PRIMARY KEY (`Name`,`AWARDED_IN`,`AWARDED_TO`),
  UNIQUE KEY `AWARDED_TO` (`AWARDED_TO`),
  KEY `AWARDS_AWARDED_IN_FK` (`AWARDED_IN`),
  CONSTRAINT `AWARDS_AWARDED_IN_FK` FOREIGN KEY (`AWARDED_IN`) REFERENCES `LEAGUE` (`Season_Number`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `AWARDS_AWARDED_TO_FK` FOREIGN KEY (`AWARDED_TO`) REFERENCES `PLAYER` (`Name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AWARDS`
--

LOCK TABLES `AWARDS` WRITE;
/*!40000 ALTER TABLE `AWARDS` DISABLE KEYS */;
INSERT INTO `AWARDS` VALUES (100000,'Emerging Player of the Season',12,'Shreyas Iyer'),(100000,'Game changer of the Match',8,'Kane Williamson'),(100000,'Man of the Match',9,'Andre Russell'),(500000,'Man of the Tournament',13,'Virat Kohli'),(300000,'Super-striker of the Season',8,'Hardik Pandya');
/*!40000 ALTER TABLE `AWARDS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `COMMENTATORS`
--

DROP TABLE IF EXISTS `COMMENTATORS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `COMMENTATORS` (
  `Date_Time` timestamp NOT NULL,
  `Venue` varchar(50) NOT NULL,
  `Commentators` varchar(50) NOT NULL,
  PRIMARY KEY (`Date_Time`,`Venue`,`Commentators`),
  CONSTRAINT `COMMENTATORS_Date_Time_Venue_FK` FOREIGN KEY (`Date_Time`, `Venue`) REFERENCES `FIXTURE` (`Date_Time`, `Venue`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `COMMENTATORS`
--

LOCK TABLES `COMMENTATORS` WRITE;
/*!40000 ALTER TABLE `COMMENTATORS` DISABLE KEYS */;
INSERT INTO `COMMENTATORS` VALUES ('2022-03-26 19:30:00','Chepauk Stadium','Harsha Bhogle'),('2022-04-15 19:30:00','Narendra Modi Stadium','Danny Morrison'),('2022-04-21 19:30:00','Chepauk Stadium','Simon Doull'),('2022-05-07 19:30:00','Wankhede Stadium','Sanjay Manjrekar'),('2022-05-08 15:30:00','Chinnaswamy Stadium','Ravi Shastri');
/*!40000 ALTER TABLE `COMMENTATORS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FIXTURE`
--

DROP TABLE IF EXISTS `FIXTURE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FIXTURE` (
  `Date_Time` timestamp NOT NULL,
  `Venue` varchar(50) NOT NULL,
  `Result` varchar(50) DEFAULT NULL,
  `Match_No` int NOT NULL,
  PRIMARY KEY (`Date_Time`,`Venue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FIXTURE`
--

LOCK TABLES `FIXTURE` WRITE;
/*!40000 ALTER TABLE `FIXTURE` DISABLE KEYS */;
INSERT INTO `FIXTURE` VALUES ('2022-03-26 15:30:00','Feroz Shah Kotla Ground','Delhi Capitals',19),('2022-03-26 19:30:00','Chepauk Stadium','Kolkata Knight Riders',1),('2022-04-09 15:30:00','Mohali Stadium','Rajasthan Royals',12),('2022-04-15 19:30:00','Narendra Modi Stadium','Sunrisers Hyderabad',25),('2022-04-21 19:30:00','Chepauk Stadium','Chennai Super Kings',33),('2022-04-28 19:30:00','Rajiv Gandhi Stadium','Sunrisers Hyderabad',7),('2022-05-07 19:30:00','Wankhede Stadium','Mumbai Indians',51),('2022-05-08 15:30:00','Chinnaswamy Stadium','Royal Challengers Bangalore',54),('2022-05-12 19:30:00','Sardar Vallabhbhai Patel Stadium','Lucknow Super Giants',36),('2022-05-17 19:30:00','Eden Gardens','Kolkata Knight Riders',4),('2022-05-24 15:30:00','Sawai Mansingh Stadium','Gujarat Titans',29);
/*!40000 ALTER TABLE `FIXTURE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FORM`
--

DROP TABLE IF EXISTS `FORM`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FORM` (
  `Fantasy_points` int NOT NULL DEFAULT '0',
  `Form` decimal(3,1) NOT NULL DEFAULT '0.0',
  PRIMARY KEY (`Fantasy_points`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FORM`
--

LOCK TABLES `FORM` WRITE;
/*!40000 ALTER TABLE `FORM` DISABLE KEYS */;
INSERT INTO `FORM` VALUES (191,4.7),(200,5.0),(203,5.1),(233,5.8),(265,6.3),(276,6.9),(287,7.1),(294,7.3),(307,7.6),(372,9.3);
/*!40000 ALTER TABLE `FORM` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `JERSEY`
--

DROP TABLE IF EXISTS `JERSEY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `JERSEY` (
  `Jersey_Number` int NOT NULL,
  `BELONGS_TO` varchar(50) NOT NULL,
  PRIMARY KEY (`Jersey_Number`,`BELONGS_TO`),
  KEY `JERSEY_BELONGS_TO_FK` (`BELONGS_TO`),
  CONSTRAINT `JERSEY_BELONGS_TO_FK` FOREIGN KEY (`BELONGS_TO`) REFERENCES `TEAM` (`Name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `JERSEY`
--

LOCK TABLES `JERSEY` WRITE;
/*!40000 ALTER TABLE `JERSEY` DISABLE KEYS */;
INSERT INTO `JERSEY` VALUES (7,'Chennai Super Kings'),(45,'Mumbai Indians'),(18,'Royal Challengers Bangalore'),(31,'Sunrisers Hyderabad');
/*!40000 ALTER TABLE `JERSEY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LEAGUE`
--

DROP TABLE IF EXISTS `LEAGUE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `LEAGUE` (
  `Prize_Money` int NOT NULL DEFAULT '10000000',
  `Runner_Up` varchar(50) NOT NULL,
  `Winner` varchar(50) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Season_Number` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`Season_Number`),
  UNIQUE KEY `Season_Number` (`Season_Number`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LEAGUE`
--

LOCK TABLES `LEAGUE` WRITE;
/*!40000 ALTER TABLE `LEAGUE` DISABLE KEYS */;
INSERT INTO `LEAGUE` VALUES (200000000,'Chennai Super Kings','Rajasthan Royals','DLF IPL',1),(200000000,'Royal Challengers Bangalore','Sunrisers Hyderabad','DLF IPL',2),(200000000,'Mumbai Indians','Chennai Super Kings','DLF IPL',3),(200000000,'Royal Challengers Bangalore','Chennai Super Kings','DLF IPL',4),(200000000,'Chennai Super Kings','Kolkata Knight Riders','DLF IPL',5),(200000000,'Chennai Super Kings','Mumbai Indians','Pepsi IPL',6),(200000000,'Punjab Kings','Kolkata Knight Riders','Pepsi IPL',7),(200000000,'Chennai Super Kings','Mumbai Indians','Pepsi IPL',8),(200000000,'Royal Challengers Bangalore','Sunrisers Hyderabad','Vivo IPL',9),(200000000,'Lucknow Super Giants','Mumbai Indians','Vivo IPL',10),(200000000,'Sunrisers Hyderabad','Chennai Super Kings','Vivo IPL',11),(200000000,'Chennai Super Kings','Mumbai Indians','Vivo IPL',12),(200000000,'Delhi Capitals','Mumbai Indians','Dream 11 IPL',13),(200000000,'Kolkata Knight Riders','Chennai Super Kings','Dream 11 IPL',14),(200000000,'Rajasthan Royals','Gujarat Titans','TATA IPL',15);
/*!40000 ALTER TABLE `LEAGUE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PARTNER`
--

DROP TABLE IF EXISTS `PARTNER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PARTNER` (
  `CIN` int NOT NULL,
  `Name` varchar(50) NOT NULL,
  PRIMARY KEY (`CIN`),
  UNIQUE KEY `CIN` (`CIN`),
  UNIQUE KEY `Name` (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PARTNER`
--

LOCK TABLES `PARTNER` WRITE;
/*!40000 ALTER TABLE `PARTNER` DISABLE KEYS */;
INSERT INTO `PARTNER` VALUES (833192133,'Aramco'),(110415674,'CEAT'),(131235894,'CRED'),(830940635,'Disney + Hotstar'),(371251789,'Paytm'),(847819876,'TATA'),(547811128,'Unacademy');
/*!40000 ALTER TABLE `PARTNER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PARTNER_TYPE`
--

DROP TABLE IF EXISTS `PARTNER_TYPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PARTNER_TYPE` (
  `CIN` int NOT NULL,
  `Type` varchar(50) NOT NULL,
  PRIMARY KEY (`CIN`,`Type`),
  UNIQUE KEY `CIN` (`CIN`),
  CONSTRAINT `PARTNER_TYPE_FK` FOREIGN KEY (`CIN`) REFERENCES `PARTNER` (`CIN`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PARTNER_TYPE`
--

LOCK TABLES `PARTNER_TYPE` WRITE;
/*!40000 ALTER TABLE `PARTNER_TYPE` DISABLE KEYS */;
INSERT INTO `PARTNER_TYPE` VALUES (110415674,'Strategic Timeout Partner'),(131235894,'Official Partner'),(371251789,'Umpire Partner'),(547811128,'Official Partner'),(830940635,'Digital Streaming Partner'),(833192133,'Official Orange & Purple Cap Partner'),(847819876,'Title Sponsor');
/*!40000 ALTER TABLE `PARTNER_TYPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PLAYER`
--

DROP TABLE IF EXISTS `PLAYER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PLAYER` (
  `Base_price` int NOT NULL,
  `Auctioned_price` int NOT NULL DEFAULT '2000000',
  `Name` varchar(50) NOT NULL,
  `CName` varchar(50) NOT NULL,
  `Fantasy_points` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`Name`),
  UNIQUE KEY `Name` (`Name`),
  KEY `PLAYER_Fantasy_points_FK` (`Fantasy_points`),
  KEY `PLAYER_CName_FK` (`CName`),
  CONSTRAINT `PLAYER_CName_FK` FOREIGN KEY (`CName`) REFERENCES `PLAYER` (`Name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `PLAYER_Fantasy_points_FK` FOREIGN KEY (`Fantasy_points`) REFERENCES `FORM` (`Fantasy_points`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PLAYER`
--

LOCK TABLES `PLAYER` WRITE;
/*!40000 ALTER TABLE `PLAYER` DISABLE KEYS */;
INSERT INTO `PLAYER` VALUES (85000000,120000000,'Andre Russell','Shreyas Iyer',372),(100000000,140000000,'David Warner','Kane Williamson',294),(90000000,125000000,'Faf Du Plessis','Faf Du Plessis',233),(150000000,200000000,'Hardik Pandya','Hardik Pandya',287),(100000000,156000000,'Kane Williamson','Kane Williamson',191),(120000000,150000000,'MS Dhoni','MS Dhoni',203),(90000000,150000000,'Rashid Khan','Hardik Pandya',200),(150000000,170000000,'Rohit Sharma','Rohit Sharma',276),(75000000,135000000,'Shreyas Iyer','Shreyas Iyer',265),(170000000,200000000,'Virat Kohli','Faf Du Plessis',307);
/*!40000 ALTER TABLE `PLAYER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PLAYS_FOR_IN_OF`
--

DROP TABLE IF EXISTS `PLAYS_FOR_IN_OF`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PLAYS_FOR_IN_OF` (
  `PName` varchar(50) NOT NULL,
  `TName` varchar(50) NOT NULL,
  `Date_Time` timestamp NOT NULL,
  `Venue` varchar(50) NOT NULL,
  `Season_Number` int NOT NULL,
  PRIMARY KEY (`PName`,`TName`,`Date_Time`,`Venue`,`Season_Number`),
  KEY `PLAYS_FOR_IN_OF_TName_FK` (`TName`),
  KEY `PLAYS_FOR_IN_OF_Date_Time_Venue_FK` (`Date_Time`,`Venue`),
  KEY `PLAYS_FOR_IN_OF_Season_Number_FK` (`Season_Number`),
  CONSTRAINT `PLAYS_FOR_IN_OF_Date_Time_Venue_FK` FOREIGN KEY (`Date_Time`, `Venue`) REFERENCES `FIXTURE` (`Date_Time`, `Venue`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `PLAYS_FOR_IN_OF_PName_FK` FOREIGN KEY (`PName`) REFERENCES `PLAYER` (`Name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `PLAYS_FOR_IN_OF_Season_Number_FK` FOREIGN KEY (`Season_Number`) REFERENCES `LEAGUE` (`Season_Number`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `PLAYS_FOR_IN_OF_TName_FK` FOREIGN KEY (`TName`) REFERENCES `TEAM` (`Name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PLAYS_FOR_IN_OF`
--

LOCK TABLES `PLAYS_FOR_IN_OF` WRITE;
/*!40000 ALTER TABLE `PLAYS_FOR_IN_OF` DISABLE KEYS */;
INSERT INTO `PLAYS_FOR_IN_OF` VALUES ('Andre Russell','Kolkata Knight Riders','2022-03-26 19:30:00','Chepauk Stadium',3),('Shreyas Iyer','Kolkata Knight Riders','2022-03-26 19:30:00','Chepauk Stadium',3),('Faf Du Plessis','Royal Challengers Bangalore','2022-05-08 15:30:00','Chinnaswamy Stadium',7),('Virat Kohli','Royal Challengers Bangalore','2022-05-08 15:30:00','Chinnaswamy Stadium',7),('MS Dhoni','Chennai Super Kings','2022-04-21 19:30:00','Chepauk Stadium',11),('Rohit Sharma','Mumbai Indians','2022-05-07 19:30:00','Wankhede Stadium',12),('Hardik Pandya','Gujarat Titans','2022-05-24 15:30:00','Sawai Mansingh Stadium',14),('Rashid Khan','Gujarat Titans','2022-05-24 15:30:00','Sawai Mansingh Stadium',14),('David Warner','Sunrisers Hyderabad','2022-04-15 19:30:00','Narendra Modi Stadium',15),('Kane Williamson','Sunrisers Hyderabad','2022-04-15 19:30:00','Narendra Modi Stadium',15);
/*!40000 ALTER TABLE `PLAYS_FOR_IN_OF` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PLAYS_IN`
--

DROP TABLE IF EXISTS `PLAYS_IN`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PLAYS_IN` (
  `Name` varchar(50) NOT NULL,
  `Date_Time` timestamp NOT NULL,
  `Venue` varchar(50) NOT NULL,
  PRIMARY KEY (`Name`,`Date_Time`,`Venue`),
  KEY `PLAYS_IN_Date_Time_Venue_FK` (`Date_Time`,`Venue`),
  CONSTRAINT `PLAYS_IN_Date_Time_Venue_FK` FOREIGN KEY (`Date_Time`, `Venue`) REFERENCES `FIXTURE` (`Date_Time`, `Venue`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `PLAYS_IN_Name_FK` FOREIGN KEY (`Name`) REFERENCES `TEAM` (`Name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PLAYS_IN`
--

LOCK TABLES `PLAYS_IN` WRITE;
/*!40000 ALTER TABLE `PLAYS_IN` DISABLE KEYS */;
INSERT INTO `PLAYS_IN` VALUES ('Delhi Capitals','2022-03-26 15:30:00','Feroz Shah Kotla Ground'),('Sunrisers Hyderabad','2022-03-26 15:30:00','Feroz Shah Kotla Ground'),('Kolkata Knight Riders','2022-03-26 19:30:00','Chepauk Stadium'),('Sunrisers Hyderabad','2022-04-15 19:30:00','Narendra Modi Stadium'),('Chennai Super Kings','2022-04-21 19:30:00','Chepauk Stadium'),('Mumbai Indians','2022-05-07 19:30:00','Wankhede Stadium'),('Royal Challengers Bangalore','2022-05-08 15:30:00','Chinnaswamy Stadium'),('Lucknow Super Giants','2022-05-12 19:30:00','Sardar Vallabhbhai Patel Stadium'),('Mumbai Indians','2022-05-12 19:30:00','Sardar Vallabhbhai Patel Stadium'),('Gujarat Titans','2022-05-24 15:30:00','Sawai Mansingh Stadium'),('Rajasthan Royals','2022-05-24 15:30:00','Sawai Mansingh Stadium');
/*!40000 ALTER TABLE `PLAYS_IN` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SPONSORS_LEAGUE`
--

DROP TABLE IF EXISTS `SPONSORS_LEAGUE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SPONSORS_LEAGUE` (
  `Number` int NOT NULL,
  `CIN` int NOT NULL,
  PRIMARY KEY (`Number`,`CIN`),
  KEY `SPONSORS_LEAGUE_CIN_FK` (`CIN`),
  CONSTRAINT `SPONSORS_LEAGUE_CIN_FK` FOREIGN KEY (`CIN`) REFERENCES `PARTNER` (`CIN`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `SPONSORS_LEAGUE_Number_FK` FOREIGN KEY (`Number`) REFERENCES `LEAGUE` (`Season_Number`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SPONSORS_LEAGUE`
--

LOCK TABLES `SPONSORS_LEAGUE` WRITE;
/*!40000 ALTER TABLE `SPONSORS_LEAGUE` DISABLE KEYS */;
INSERT INTO `SPONSORS_LEAGUE` VALUES (13,371251789),(8,830940635),(15,847819876);
/*!40000 ALTER TABLE `SPONSORS_LEAGUE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SPONSORS_PLAYER`
--

DROP TABLE IF EXISTS `SPONSORS_PLAYER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SPONSORS_PLAYER` (
  `Name` varchar(50) NOT NULL,
  `CIN` int NOT NULL,
  PRIMARY KEY (`Name`,`CIN`),
  KEY `SPONSORS_PLAYER_CIN_FK` (`CIN`),
  CONSTRAINT `SPONSORS_PLAYER_CIN_FK` FOREIGN KEY (`CIN`) REFERENCES `PARTNER` (`CIN`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `SPONSORS_PLAYER_Name_FK` FOREIGN KEY (`Name`) REFERENCES `PLAYER` (`Name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SPONSORS_PLAYER`
--

LOCK TABLES `SPONSORS_PLAYER` WRITE;
/*!40000 ALTER TABLE `SPONSORS_PLAYER` DISABLE KEYS */;
INSERT INTO `SPONSORS_PLAYER` VALUES ('Virat Kohli',110415674),('Hardik Pandya',131235894),('Kane Williamson',547811128);
/*!40000 ALTER TABLE `SPONSORS_PLAYER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SPONSORS_TEAM`
--

DROP TABLE IF EXISTS `SPONSORS_TEAM`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SPONSORS_TEAM` (
  `Name` varchar(50) NOT NULL,
  `CIN` int NOT NULL,
  PRIMARY KEY (`Name`,`CIN`),
  KEY `SPONSORS_Team_CIN_FK` (`CIN`),
  CONSTRAINT `SPONSORS_Team_CIN_FK` FOREIGN KEY (`CIN`) REFERENCES `PARTNER` (`CIN`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `SPONSORS_TEAM_Name_FK` FOREIGN KEY (`Name`) REFERENCES `TEAM` (`Name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SPONSORS_TEAM`
--

LOCK TABLES `SPONSORS_TEAM` WRITE;
/*!40000 ALTER TABLE `SPONSORS_TEAM` DISABLE KEYS */;
INSERT INTO `SPONSORS_TEAM` VALUES ('Chennai Super Kings',110415674),('Gujarat Titans',833192133),('Royal Challengers Bangalore',847819876);
/*!40000 ALTER TABLE `SPONSORS_TEAM` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TEAM`
--

DROP TABLE IF EXISTS `TEAM`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TEAM` (
  `Place` varchar(50) NOT NULL,
  `RTM_Cards` int NOT NULL DEFAULT '0',
  `Money_Left` int NOT NULL DEFAULT '0',
  `Brand_Value` int NOT NULL DEFAULT '10000000',
  `Fair_play_points` decimal(5,2) NOT NULL DEFAULT '0.00',
  `Total_points` int NOT NULL DEFAULT '0',
  `Name` varchar(50) NOT NULL,
  `Coach` varchar(50) NOT NULL,
  PRIMARY KEY (`Name`),
  UNIQUE KEY `Name` (`Name`),
  UNIQUE KEY `Coach` (`Coach`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TEAM`
--

LOCK TABLES `TEAM` WRITE;
/*!40000 ALTER TABLE `TEAM` DISABLE KEYS */;
INSERT INTO `TEAM` VALUES ('Chepauk Stadium',5,14000000,200000000,0.00,0,'Chennai Super Kings','Stephen Fleming'),('Feroz Shah Kotla Ground',0,1000000,1800000000,0.00,0,'Delhi Capitals','Ricky Ponting'),('Narendra Modi Stadium',1,2000000,50000000,0.00,0,'Gujarat Titans','Gary Kirsten'),('Eden Gardens',2,7500000,120000000,0.00,0,'Kolkata Knight Riders','Brendon McCullum'),('Sardar Vallabhbhai Patel Stadium',3,20000000,1150000000,0.00,0,'Lucknow Super Giants','Gautam Gambhir'),('Wankhede Stadium',4,960000,125000000,0.00,0,'Mumbai Indians','Mahela Jayawardane'),('Mohali Stadium',4,50000000,900000000,0.00,0,'Punjab Kings','Anil Kumble'),('Sawai Mansingh Stadium',3,11500000,1900000000,0.00,0,'Rajasthan Royals','Kumar Sangakkara'),('Chinnaswamy Stadium',4,30000000,246000000,0.00,0,'Royal Challengers Bangalore','Sanjay Bangar'),('Rajiv Gandhi Stadium',3,15600000,60000000,0.00,0,'Sunrisers Hyderabad','Tom Moody');
/*!40000 ALTER TABLE `TEAM` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TEAM_MANAGER`
--

DROP TABLE IF EXISTS `TEAM_MANAGER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TEAM_MANAGER` (
  `Manager_First_Name` varchar(50) NOT NULL,
  `Manager_Last_Name` varchar(50) NOT NULL,
  `Name` varchar(50) NOT NULL,
  PRIMARY KEY (`Name`),
  UNIQUE KEY `TEAM_MANAGER_UNIQUE` (`Manager_First_Name`,`Manager_Last_Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TEAM_MANAGER`
--

LOCK TABLES `TEAM_MANAGER` WRITE;
/*!40000 ALTER TABLE `TEAM_MANAGER` DISABLE KEYS */;
INSERT INTO `TEAM_MANAGER` VALUES ('Kalanithi','Maran','Sunrisers Hyderabad'),('Mukesh','Ambani','Mumbai Indians'),('Narayanaswami','Srinivasan','Chennai Super Kings'),('Ness','Wadia','Punjab Kings'),('Parth','Jindal','Delhi Capitals'),('Raj','Kundra','Rajasthan Royals'),('Sanjeev','Goenka','Lucknow Super Giants'),('ShahRukh','Khan','Kolkata Knight Riders'),('Steve','Koltes','Gujarat Titans'),('Vijay','Mallya','Royal Challengers Bangalore');
/*!40000 ALTER TABLE `TEAM_MANAGER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `UMPIRE`
--

DROP TABLE IF EXISTS `UMPIRE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `UMPIRE` (
  `Date_Time` timestamp NOT NULL,
  `Venue` varchar(50) NOT NULL,
  `Umpire_Name` varchar(50) NOT NULL,
  `Umpire_Position` int NOT NULL,
  PRIMARY KEY (`Date_Time`,`Venue`,`Umpire_Name`),
  UNIQUE KEY `Umpire_Name` (`Umpire_Name`),
  CONSTRAINT `UMPIRE_FK` FOREIGN KEY (`Date_Time`, `Venue`) REFERENCES `FIXTURE` (`Date_Time`, `Venue`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `UMPIRE_chk_1` CHECK (((`Umpire_Position` = 1) or (`Umpire_Position` = 2) or (`Umpire_Position` = 3)))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `UMPIRE`
--

LOCK TABLES `UMPIRE` WRITE;
/*!40000 ALTER TABLE `UMPIRE` DISABLE KEYS */;
INSERT INTO `UMPIRE` VALUES ('2022-03-26 19:30:00','Chepauk Stadium','Kumar Dharmasena',1),('2022-04-15 19:30:00','Narendra Modi Stadium','Marais Erasmus',2),('2022-04-21 19:30:00','Chepauk Stadium','Nitin Menon',1),('2022-05-07 19:30:00','Wankhede Stadium','Anil Chaudhary',3),('2022-05-08 15:30:00','Chinnaswamy Stadium','Sundaram Ravi',2);
/*!40000 ALTER TABLE `UMPIRE` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-27  8:20:40