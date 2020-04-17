
/********************************************************************/
/*  Date	Name	Description                                 */
/*  --------------------------------------------------------------- */
/*                                                                  */
/*1/16/2020  Kaitelyn Low   Initial deployed. Program accepts input.*/
/********************************************************************/

--Edited for SWDV-235 4/17/2020

DROP DATABASE IF EXISTS RSTrans;
GO
CREATE DATABASE RSTrans;
GO
USE RSTrans;
GO

CREATE TABLE employee
 (
	employeeID INT NOT NULL identity PRIMARY KEY,
	employeeName VARCHAR(255) NOT NULL
 );

CREATE TABLE visitor
 (
	visitorID INT  NOT NULL  identity ,
	visitorName  VARCHAR(255)  NOT NULL,
	visitorEmail  VARCHAR(255)  NOT NULL,
	visitorComm  VARCHAR(500),
	Rating INT,
	visitorUpdates  bit
	--employeeID  INT  NOT NULL REFERENCES employee(employeeID),
 );
 

 INSERT INTO employee
 (employeeName)
 VALUES
  ('Kaitelyn'),
  ('Ayden'),
  ('Ethan'),
  ('Mae'),
  ('Megan'),
  ('Maggie'),
  ('Jordan'),
  ('Spice'),
  ('Sheila'),
  ('Dundee'),
  ('Dingo'),
  ('Dinkiti'),
  ('Rue'),
  ('Boomer'),
  ('Louie'),
  ('Emma'),
  ('Lily'),
  ('Kai'),
  ('Keito'),
  ('Katarina');
  GO

  create procedure InsertVisitor
	@visitorName varchar(255), @visitorEmail varchar(255), @visitorComm varchar(500), @Ratiing int, @visitorUpdates bit
  as
  insert into visitor
	(visitorName, visitorEmail, visitorComm, Rating, visitorUpdates)
  values
	(@visitorName, @visitorEmail, @visitorComm, @Ratiing, @visitorUpdates)
  GO

 --INSERT INTO visitor
 --(visitorName, visitorEmail, visitorComm, Rating, visitorUpdates)
 --VALUES
 -- ('Athena', 'Marriage4Ever@hotmail.com', NULL, 4, NULL),
 -- ('Tsuki Yomi', 'missingTheSun@gmail.com', 'Needs more accuracy', 6, 1),
 -- ('Amatsurasu', 'justTheSun@yahoo.com', NULL, NULL, 0),
 -- ('Zeus', 'zapper@yahoo.com', 'why read when you can be king?', 3, 0),
 -- ('Hermes', 'gottaGoFAST@hotmail.com',NULL, 9, 1),
 -- ('Aphrodite', 'IamLove@hotmail.com','I think you need more romance novels.', 5, 1),
 -- ('Bishomon', 'FightMe@gmail.com',NULL, NULL, 0),
 -- ('Tenshin', 'readMore@gmailcom',NULL, 4, 0),
 -- ('Apollo', 'SuperLit@hotmail.com','You guys need to get out of the basement', 7, 0),
 -- ('Ash', 'forever12@yahoo.com','Thanks for all the work!', 10, 1),
 -- ('Kaneki', 'EdgeLord@gmail.com', NULL, NULL, 0),
 -- ('Lucy', 'ZodiacQueen@yahoo.com', NULL, 10, 1),
 -- ('Saitama', 'NeedMoreFoes@yahoo.com', NULL, 1, 0),
 -- ('Sonic', 'WillDefeatSaitama@gmail.com', NULL, NULL, 0),
 -- ('Violet', 'WhatAreFeelings@gmail.com','Where is the general?', NULL, 1),
 -- ('Tanjiro', 'SaveMySister@hotmail.com','You guys are awesome!', 8, 1),
 -- ('Zenetsu', 'PleaseMarryMe@yahoo.com','Someone please marry me...', NULL, 0),
 -- ('Inosuke', 'Beast@yahoo.com', NULL, NULL, 0),
 -- ('Giyuu', 'WaterBlade@gmail.com', NULL, NULL, 0),
 -- ('Touka', 'WannaBeNormal@gmail.com', NULL, 7, 0);
 -- GO


  exec InsertVisitor 'Snape', 'snape@hogwarts.com', 'ssms', 1, 1
  go

  create user [EJApp] for login [EJApp] with default_schema=dbo
  go
  grant execute on InsertVisitor to EJApp
  go