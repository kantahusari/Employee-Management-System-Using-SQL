-- -----------------------------------------------------
-- Schema Group 10 Schema
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Group 10 Schema` DEFAULT CHARACTER SET utf8 ;
USE `Group 10 Schema` ;

-- -----------------------------------------------------
-- Table `Group 10 Schema`.`GBC`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Group 10 Schema`.`GBC` (
  `GBC_Number` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`GBC_Number`))
ENGINE = InnoDB;

INSERT INTO `gbc` (`GBC_Number`) VALUES
('1'),
('2'),
('3'),
('4'),
('5');

-- -----------------------------------------------------
-- Table `Group 10 Schema`.`Address`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Group 10 Schema`.`Address` (
  `House` VARCHAR(50) NOT NULL,
  `Locality` VARCHAR(45) NOT NULL,
  `State` VARCHAR(45) NOT NULL,
  `Country` VARCHAR(45) NOT NULL,
  `Pin_Code` INT NOT NULL,
  `AddressID` INT NOT NULL,
  PRIMARY KEY (`AddressID`))
ENGINE = InnoDB;

INSERT INTO `address` (`House`, `Locality`, `State`, `Country`, `Pin_Code`, `AddressID`) VALUES
('453', 'Ontario', 'Ontario', 'Canada', 123456, 1),
('536', 'Ontario', 'Ontario', 'Canada', 456789, 2),
('789', 'Ontario', 'Ontario', 'Canada', 321654, 3),
('951', 'Ontario', 'Ontario', 'Canada', 258741, 4);

-- -----------------------------------------------------
-- Table `Group 10 Schema`.`Client`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Group 10 Schema`.`Client` (
  `GBC_Number` VARCHAR(50) NOT NULL,
  `Name` VARCHAR(50) NULL,
  `Address` INT NULL,
  `Contact_Phone` INT NULL,
  PRIMARY KEY (`GBC_Number`),
  INDEX `Address_FK_idx` (`Address` ASC),
  CONSTRAINT `Client_GBC_Number_FK`
    FOREIGN KEY (`GBC_Number`)
    REFERENCES `Group 10 Schema`.`GBC` (`GBC_Number`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Client_Address_FK`
    FOREIGN KEY (`Address`)
    REFERENCES `Group 10 Schema`.`Address` (`AddressID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

INSERT INTO `client` (`GBC_Number`, `Name`, `Address`, `Contact_Phone`) VALUES
('1', 'Great John', 1, NULL),
('2', 'Lois Walker', 2, 3035728492),
('3', 'Brenda Robinson', 3, NULL),
('4', 'Joe Robinson', 4, 2259454954);

-- -----------------------------------------------------
-- Table `Group 10 Schema`.`Project`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Group 10 Schema`.`Project` (
  `GBC_Number` VARCHAR(50) NOT NULL,
  `Name` VARCHAR(50) NULL,
  `Start Date` DATE NULL,
  `Finish Date` DATE NULL,
  `Client_GBC` VARCHAR(50) NULL,
  PRIMARY KEY (`GBC_Number`),
  INDEX `Client_GBC_FK_idx` (`Client_GBC` ASC),
  CONSTRAINT `GBC_Number_FK`
    FOREIGN KEY (`GBC_Number`)
    REFERENCES `Group 10 Schema`.`GBC` (`GBC_Number`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Client_GBC_FK`
    FOREIGN KEY (`Client_GBC`)
    REFERENCES `Group 10 Schema`.`Client` (`GBC_Number`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

INSERT INTO `project` (`GBC_Number`, `Name`, `Start Date`, `Finish Date`, `Client_GBC`) VALUES
('1', 'Project 1', '2019-04-10', '2019-04-27', '1'),
('2', 'Project 4', '2019-03-12', '2019-04-27', '2'),
('3', 'Project 3', '2019-02-18', '2019-04-27', '3'),
('4', 'Project 2', '2019-05-19', '2019-04-27', '4');

-- -----------------------------------------------------
-- Table `Group 10 Schema`.`Department`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Group 10 Schema`.`Department` (
  `Name` VARCHAR(50) NOT NULL,
  `Floor` INT NULL,
  `Room_Number` INT NULL,
  `Phone_Number` INT NULL,
  `ID` INT NOT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;

INSERT INTO `department` (`Name`, `Floor`, `Room_Number`, `Phone_Number`, `ID`) VALUES
('Finance', 1, 24, 1234567890, 1),
('Data Analytics', 2, 15, 9876543210, 2),
('Hardware Maintenance', 3, 3, 2058369147, 3),
('Software Devlopment', 3, 9, 1047258963, 4),
('Marketing', 4, 18, 9516238470, 5);

-- -----------------------------------------------------
-- Table `Group 10 Schema`.`Employee`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Group 10 Schema`.`Employee` (
  `GBC_Number` VARCHAR(50) NOT NULL,
  `First_Name` VARCHAR(50) NOT NULL,
  `Last_Name` VARCHAR(50) NOT NULL,
  `Address` INT NULL,
  `DOB` DATE NULL,
  `SIN_Number` VARCHAR(45) NOT NULL,
  `Job_Title` VARCHAR(50) NOT NULL,
  `Department` INT NOT NULL,
  `ProjectID` VARCHAR(50) NULL,
  `Spouse` VARCHAR(50) NULL,
  PRIMARY KEY (`GBC_Number`),
  INDEX `Address_FK_idx` (`Address` ASC),
  INDEX `Department_FK_idx` (`Department` ASC),
  INDEX `Project_FK_idx` (`ProjectID` ASC),
  INDEX `Spouse_FK_idx` (`Spouse` ASC),
  CONSTRAINT `Employee_GBC_Number_FK`
    FOREIGN KEY (`GBC_Number`)
    REFERENCES `Group 10 Schema`.`GBC` (`GBC_Number`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Address_FK`
    FOREIGN KEY (`Address`)
    REFERENCES `Group 10 Schema`.`Address` (`AddressID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Department_FK`
    FOREIGN KEY (`Department`)
    REFERENCES `Group 10 Schema`.`Department` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Project_FK`
    FOREIGN KEY (`ProjectID`)
    REFERENCES `Group 10 Schema`.`Project` (`GBC_Number`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Spouse_FK`
    FOREIGN KEY (`Spouse`)
    REFERENCES `Group 10 Schema`.`Employee` (`GBC_Number`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

INSERT INTO `employee` (`GBC_Number`, `First_Name`, `Last_Name`, `Address`, `DOB`, `SIN_Number`, `Job_Title`, `Department`, `ProjectID`, `Spouse`) VALUES
('2', 'Mary', 'Jaine', 1, '1993-04-17', '159753', 'Analyst', 2, NULL, NULL),
('1', 'Karan', 'Sharma', 1, '1991-04-02', '789465', 'Software Engineer', 1, '1', '2'),
('3', 'John', 'Doe', 2, '1989-04-15', '369147', 'Hardware', 3, NULL, NULL),
('5', 'Martin', 'Jones', 3, '1991-06-02', '321789', 'Networking', 4, NULL, NULL),
('4', 'Mike', 'Stark', 4, '1983-15-03', '654987', 'accountant', 5, '1', NULL);

-- -----------------------------------------------------
-- Table `Group 10 Schema`.`Dependent`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Group 10 Schema`.`Dependent` (
  `Name` VARCHAR(50) NOT NULL,
  `Dependent_GBC_Number` VARCHAR(50) NOT NULL,
  INDEX `GBC_FK_idx` (`Dependent_GBC_Number` ASC),
  CONSTRAINT `GBC_FK`
    FOREIGN KEY (`Dependent_GBC_Number`)
    REFERENCES `Group 10 Schema`.`Employee` (`GBC_Number`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Group 10 Schema`.`Task`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Group 10 Schema`.`Task` (
  `Name` VARCHAR(50) NULL,
  `Time_Needed` DATE NULL,
  `Finish_Date` DATE NULL,
  `ID` INT NOT NULL,
  `Project_ID` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `Project_FK_idx` (`Project_ID` ASC),
  CONSTRAINT `Task_Project_FK`
    FOREIGN KEY (`Project_ID`)
    REFERENCES `Group 10 Schema`.`Project` (`GBC_Number`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

INSERT INTO `task` (`Name`, `Time_Needed`, `Finish_Date`, `ID`, `Project_ID`) VALUES
('Programmer', '2019-04-03', '2019-05-18', 1, '1'),
('Developer', '2019-01-05', '2019-02-21', 2, '2'),
('Analyst', '2019-02-04', '2019-03-14', 3, '4'),
('Accountant', '2019-05-19', '2019-06-06', 4, '3');

-- -----------------------------------------------------
-- Table `Group 10 Schema`.`Skill`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Group 10 Schema`.`Skill` (
  `Name` VARCHAR(50) NOT NULL,
  `Description` VARCHAR(50) NULL,
  `Task_ID` INT NOT NULL,
  INDEX `Task_FK_idx` (`Task_ID` ASC),
  CONSTRAINT `Task_FK`
    FOREIGN KEY (`Task_ID`)
    REFERENCES `Group 10 Schema`.`Task` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

INSERT INTO `skill` (`Name`, `Description`, `Task_ID`) VALUES
('SQL', NULL, 1),
('C++', NULL, 2),
('Javascript', NULL, 3),
('CSS', NULL, 4);

-- -----------------------------------------------------
-- Table `Group 10 Schema`.`Vendors`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Group 10 Schema`.`Vendors` (
  `Name` VARCHAR(50) NOT NULL,
  `Address` INT NULL,
  `Phone_Number` INT NULL,
  `Deals_With_Department` INT NOT NULL,
  `ID` INT NOT NULL,
  INDEX `Address_FK_idx` (`Address` ASC),
  INDEX `Department_FK_idx` (`Deals_With_Department` ASC),
  PRIMARY KEY (`ID`),
  CONSTRAINT `Vendors_Address_FK`
    FOREIGN KEY (`Address`)
    REFERENCES `Group 10 Schema`.`Address` (`AddressID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Vendors_Department_FK`
    FOREIGN KEY (`Deals_With_Department`)
    REFERENCES `Group 10 Schema`.`Department` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Group 10 Schema`.`Equipment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Group 10 Schema`.`Equipment` (
  `Name` VARCHAR(50) NOT NULL,
  `Type` VARCHAR(10) NULL,
  `ID` INT NOT NULL,
  `Vendor_ID` INT NOT NULL,
  PRIMARY KEY (`ID`),
  CONSTRAINT `Equipment_Vendor_FK`
    FOREIGN KEY (`ID`)
    REFERENCES `Group 10 Schema`.`Vendors` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Group 10 Schema`.`Employee_Previous_Job_Titles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Group 10 Schema`.`Employee_Previous_Job_Titles` (
  `GBC_Number` VARCHAR(50) NOT NULL,
  `Title` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`GBC_Number`, `Title`),
  CONSTRAINT `Employee_FK`
    FOREIGN KEY (`GBC_Number`)
    REFERENCES `Group 10 Schema`.`Employee` (`GBC_Number`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

INSERT INTO `employee_previous_job_titles` (`GBC_Number`, `Title`) VALUES
('1', 'Developer');

-- -----------------------------------------------------
-- Table `Group 10 Schema`.`Project_Equipments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Group 10 Schema`.`Project_Equipments` (
  `Project_GBC` VARCHAR(50) NOT NULL,
  `Equipment_ID` INT NOT NULL,
  PRIMARY KEY (`Project_GBC`, `Equipment_ID`),
  INDEX `Equipment_FK_idx` (`Equipment_ID` ASC),
  CONSTRAINT `MM_Project_FK`
    FOREIGN KEY (`Project_GBC`)
    REFERENCES `Group 10 Schema`.`Project` (`GBC_Number`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `MM_Equipment_FK`
    FOREIGN KEY (`Equipment_ID`)
    REFERENCES `Group 10 Schema`.`Equipment` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Group 10 Schema`.`Department_Equipment_ID`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Group 10 Schema`.`Department_Equipment_ID` (
  `Department_ID` INT NOT NULL,
  `Equipment_ID` INT NOT NULL,
  PRIMARY KEY (`Department_ID`, `Equipment_ID`),
  INDEX `Equipment_FK_idx` (`Equipment_ID` ASC),
  CONSTRAINT `Dpartment_FK`
    FOREIGN KEY (`Department_ID`)
    REFERENCES `Group 10 Schema`.`Department` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Equipment_FK`
    FOREIGN KEY (`Equipment_ID`)
    REFERENCES `Group 10 Schema`.`Equipment` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
show databases;
select *from department;
SELECT Employee.GBC_Number, JobTitles.Title
FROM Employee
NATURAL JOIN Employee_Previous_Job_Titles AS JobTitles;
SELECT Department.Name, Skill.Name
FROM Employee
INNER JOIN Project ON Employee.ProjectID = Project.GBC_Number
INNER JOIN Task ON Task.Project_ID = Project.GBC_Number
INNER JOIN Skill ON Skill.Task_ID = Task.ID
INNER JOIN Department ON Department.ID = Employee.Department;
SELECT COUNT(Skill.Name) AS Skills
FROM Employee
INNER JOIN Project ON Employee.ProjectID = Project.GBC_Number
INNER JOIN Task ON Task.Project_ID = Project.GBC_Number
INNER JOIN Skill ON Skill.Task_ID = Task.ID;
SELECT * FROM Project
ORDER BY Name ASC;
SELECT Name
FROM Task
GROUP BY ID
HAVING Name LIKE "%Programmer%";
CREATE VIEW GetEmployeeSkills AS (
SELECT Employee.First_Name, COUNT(Skill.Name) AS Skills
FROM Employee
INNER JOIN Project ON Employee.ProjectID = Project.GBC_Number
INNER JOIN Task ON Task.Project_ID = Project.GBC_Number
INNER JOIN Skill ON Skill.Task_ID = Task.ID);
SELECT * FROM Employee RIGHT OUTER JOIN Project ON ProjectID = Project.GBC_Number;
SELECT * FROM Employee RIGHT OUTER JOIN Project ON ProjectID = Project.GBC_Number;
SELECT * FROM Project WHERE Client_GBC IN (SELECT GBC_Number FROM Client WHERE Name LIKE "%John");
SELECT Spouse.First_Name, Spouse.Last_Name FROM Employee INNER JOIN Employee AS Spouse ON Employee.Spouse = Spouse.GBC_Number;