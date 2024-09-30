-- MySQL dump 10.13  Distrib 5.7.24, for osx10.9 (x86_64)
--
-- Host: localhost    Database: company
-- ------------------------------------------------------
-- Server version	8.2.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Department`
--

DROP TABLE IF EXISTS `Department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Department` (
  `Department_ID` int NOT NULL,
  `Department_Name` varchar(50) NOT NULL,
  `Department_Size` int NOT NULL,
  `Office_ID` int NOT NULL,
  PRIMARY KEY (`Department_ID`),
  KEY `Office_ID` (`Office_ID`),
  CONSTRAINT `department_ibfk_1` FOREIGN KEY (`Office_ID`) REFERENCES `Office` (`Office_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Department`
--

LOCK TABLES `Department` WRITE;
/*!40000 ALTER TABLE `Department` DISABLE KEYS */;
INSERT INTO `Department` VALUES (1,'HR',15,1),(2,'Engineering',30,2),(3,'Marketing',20,3),(4,'Sales',25,4),(5,'Finance',10,5);
/*!40000 ALTER TABLE `Department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Employees`
--

DROP TABLE IF EXISTS `Employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Employees` (
  `EmployeeID` int NOT NULL,
  `Employee_Name` varchar(50) NOT NULL,
  `Phone_Number` varchar(20) NOT NULL,
  `Employee_Address` varchar(100) NOT NULL,
  `Salary` int NOT NULL,
  `Expericence` int NOT NULL,
  `Department_ID` int NOT NULL,
  `Project_ID` int NOT NULL,
  PRIMARY KEY (`EmployeeID`),
  KEY `Department_ID` (`Department_ID`),
  KEY `Project_ID` (`Project_ID`),
  CONSTRAINT `employees_ibfk_1` FOREIGN KEY (`Department_ID`) REFERENCES `Department` (`Department_ID`),
  CONSTRAINT `employees_ibfk_2` FOREIGN KEY (`Project_ID`) REFERENCES `Project` (`Project_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Employees`
--

LOCK TABLES `Employees` WRITE;
/*!40000 ALTER TABLE `Employees` DISABLE KEYS */;
INSERT INTO `Employees` VALUES (1,'Alice Johnson','555-0101','111 First St, Town X',60000,5,1,1),(2,'Bob Smith','555-0202','222 Second St, Town Y',75000,8,2,2),(3,'Carol Williams','555-0303','333 Third St, Town Z',50000,3,3,3),(4,'David Brown','555-0404','444 Fourth St, Town W',65000,6,4,4),(5,'Eve Davis','555-0505','555 Fifth St, Town V',70000,7,5,5);
/*!40000 ALTER TABLE `Employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Office`
--

DROP TABLE IF EXISTS `Office`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Office` (
  `Office_ID` int NOT NULL,
  `Office_Address` char(100) NOT NULL,
  `Capacity` int NOT NULL,
  PRIMARY KEY (`Office_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Office`
--

LOCK TABLES `Office` WRITE;
/*!40000 ALTER TABLE `Office` DISABLE KEYS */;
INSERT INTO `Office` VALUES (1,'123 Main St, City A',50),(2,'456 Elm St, City B',75),(3,'789 Maple St, City C',100),(4,'101 Oak St, City D',60),(5,'202 Pine St, City E',80);
/*!40000 ALTER TABLE `Office` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Project`
--

DROP TABLE IF EXISTS `Project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Project` (
  `Project_ID` int NOT NULL,
  `Project_Name` varchar(50) NOT NULL,
  `Team_Size` int NOT NULL,
  `Serviced_Area` varchar(100) NOT NULL,
  PRIMARY KEY (`Project_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Project`
--

LOCK TABLES `Project` WRITE;
/*!40000 ALTER TABLE `Project` DISABLE KEYS */;
INSERT INTO `Project` VALUES (1,'Apollo',10,'North America'),(2,'Zeus',8,'Europe'),(3,'Hermes',12,'Asia'),(4,'Athena',5,'Australia'),(5,'Poseidon',7,'South America');
/*!40000 ALTER TABLE `Project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Task`
--

DROP TABLE IF EXISTS `Task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Task` (
  `Task_ID` int NOT NULL,
  `Task_Content` varchar(100) NOT NULL,
  `Title` varchar(50) NOT NULL,
  `Deadline` date NOT NULL,
  `Project_ID` int NOT NULL,
  `EmployeeID` int NOT NULL,
  PRIMARY KEY (`Task_ID`),
  KEY `Project_ID` (`Project_ID`),
  KEY `EmployeeID` (`EmployeeID`),
  CONSTRAINT `task_ibfk_1` FOREIGN KEY (`Project_ID`) REFERENCES `Project` (`Project_ID`),
  CONSTRAINT `task_ibfk_2` FOREIGN KEY (`EmployeeID`) REFERENCES `Employees` (`EmployeeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Task`
--

LOCK TABLES `Task` WRITE;
/*!40000 ALTER TABLE `Task` DISABLE KEYS */;
INSERT INTO `Task` VALUES (1,'Develop module A','Development','2024-10-01',1,1),(2,'Design UI','Design','2024-11-15',2,2),(3,'Market research','Research','2024-09-30',3,3),(4,'Sales pitch','Presentation','2024-12-05',4,4),(5,'Financial report','Analysis','2024-10-20',5,5);
/*!40000 ALTER TABLE `Task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Vehicle`
--

DROP TABLE IF EXISTS `Vehicle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Vehicle` (
  `Vehicle_ID` int NOT NULL,
  `PlateNumber` varchar(50) NOT NULL,
  `Color` varchar(50) NOT NULL,
  `EmployeeID` int NOT NULL,
  PRIMARY KEY (`Vehicle_ID`),
  KEY `EmployeeID` (`EmployeeID`),
  CONSTRAINT `vehicle_ibfk_1` FOREIGN KEY (`EmployeeID`) REFERENCES `Employees` (`EmployeeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Vehicle`
--

LOCK TABLES `Vehicle` WRITE;
/*!40000 ALTER TABLE `Vehicle` DISABLE KEYS */;
INSERT INTO `Vehicle` VALUES (1,'ABC123','Red',1),(2,'XYZ789','Blue',2),(3,'LMN456','Green',3),(4,'PQR321','Black',4),(5,'GHI654','White',5);
/*!40000 ALTER TABLE `Vehicle` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-09-16 15:28:21
