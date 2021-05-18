SET DATEFORMAT dmy
USE master
GO
IF EXISTS(SELECT'True' FROM SYS.DATABASES WHERE NAME='CEITI')
BEGIN
DROP DATABASE CEITI
END
GO
CREATE DATABASE CEITI
GO
USE CEITI

--crearea tabelelor
GO 
--Lista profesorilor
CREATE TABLE Profesor(
					 IdProfesor int PRIMARY KEY,
					 NmProfesor char(50)
					 )
GO
--Lista specialitatior
CREATE TABLE Spec(
				 IdSpec int PRIMARY KEY,
				 NmSpec char(50)
				 )
GO
--lista grupelor
CREATE TABLE Grupa(
					IdGrupa int PRIMARY KEY,
					NmGrupa nvarchar(10),
					AnAdm int, 
					IdProfesor int FOREIGN KEY REFERENCES Profesor(IdProfesor),
					IdSpec int FOREIGN KEY REFERENCES Spec(IdSpec)
					)
GO
--Lista catedrelor
CREATE TABLE Catedre(
					 IdCatedre int PRIMARY KEY,
					 NmCatedre nvarchar(50),
					 IdProfesor int FOREIGN KEY REFERENCES Profesor(IdProfesor)
					 )

GO
--lista raionalor
CREATE TABLE Raion(
					IdRaion int PRIMARY KEY,
					NmRaion char(50)
				   )

GO
--lista localitatilor
CREATE TABLE Localit(
					IdLocalit int PRIMARY KEY,
					NmLocalit CHAR(50),
					IdRaion int FOREIGN KEY REFERENCES Raion(IdRaion)
					)
GO  
--Lista studentilor
CREATE TABLE Student(
					IdStudent int PRIMARY KEY,
					NmStud nvarchar(25),
					PrenStud nvarchar(30),
					PatrStud nvarchar(30),
					SexStud char(1),
					DataNS date,
					GSM char(10),
					IdGrupa int FOREIGN KEY REFERENCES Grupa(IdGrupa),
					IdLocalit int FOREIGN KEY REFERENCES Localit(IdLocalit)
					)
GO
--Disciplinele studiate în colegiu
CREATE TABLE ObjStud(
					IdObjStud int PRIMARY KEY,
					NmObjStud nvarchar(50),
					IdCatedre int FOREIGN KEY REFERENCES Catedre(IdCatedre)
					)

GO
--Disciplinele studiate în fiecare grupa
CREATE TABLE ObjStGr(
					IdObjStGr int PRIMARY KEY,
					IdGrupa int FOREIGN KEY REFERENCES Grupa(IdGrupa),
					IdObjStud int FOREIGN KEY REFERENCES ObjStud(IdObjStud),
					IdProfesor int FOREIGN KEY  REFERENCES Profesor(IdProfesor)
					)
GO
--Lista notelor studenţilor la disciplinele studiate
CREATE TABLE Notele(
					IdNotele int PRIMARY KEY,
					IdStudent int FOREIGN KEY REFERENCES Student(IdStudent),
					IdObjStud int FOREIGN KEY  REFERENCES ObjStud(IdObjStud),
					IdGrupa int FOREIGN KEY REFERENCES Grupa(IdGrupa),
					--NData date,
					Nota int
					)

INSERT INTO Profesor 
VALUES  (1, 'Mihalas Ion'),
		(2, 'Covali Eugenia'),
		(3, 'Luncasu Galina'),
		(4, 'Trifan Aurel'),
		(5, 'Harea Crina'),
		(6, 'Carchilan Natalia'),
		(7, 'Dovgani Irina'),
		(8, 'Lotca Irina'),
		(9, 'Polucci Tatiana'),
		(10,'Petrovchi Andreea'),
		(11,'Ghibu Octavian'),
		(12,'Botnari Liliana'),
		(13,'Ciobanu Andrei'),
		(14,'Melnic Vasile'),
		(15,'Talmaci Natalia'),
		(16,'Turcanu Aurelia'),
		(17,'Musteata Victoria'),
		(18,'Alexandru Railean'),
		(19,'Andrei Ciobanu')

INSERT INTO Spec
VALUES	(11, 'Administrarea bazelor de date'),
		(22, 'Contabilitate'),
		(33, 'Administrarea Aplicatiilor WEB'),
		(44, 'Programarea si analiza produselor program'),
		(55, 'Retele de Calculatoare'),
		(66, 'Servicii Administrative si de Secretariat')

INSERT INTO Grupa
VALUES (1, 'B-1921', 2019, 1, 11),
	   (2, 'B-1922', 2019, 2, 11),
	   (3, 'W-1922', 2019, 4, 33),
	   (4, 'P-1923', 2019, 3, 44),
	   (5, 'R-1921', 2019, 6, 55),
	   (6, 'C-1921', 2019, 7, 22),
	   (7, 'O-2011', 2020, 4, 55),
	   (8, 'C-2011', 2020, 9, 22),
	   (9, 'C-1831', 2018, 8, 22),
	   (10,'C-1741', 2017,10, 22),
	   (11,'W-2011', 2020,11, 33),
	   (12,'P-1831', 2018,12, 44),
	   (13,'S-1741', 2017,13, 66),
	   (14,'B-1831', 2018,14, 11),
	   (15,'B-1741', 2017,15, 11)

	   
 
INSERT INTO Catedre
VALUES (1111, 'Matematica si Fizica',  1),
	   (2222, 'Informatica',           2),
	   (3333, 'Stiinte socioumane',    5),
	   (4444, 'Limba română',          6) 



INSERT INTO Raion
VALUES 
	(1,  'Anenii Noi'),
	(2,  'Basarabeasca'),
	(3,  'Briceni'),
	(4,  'Cahul'),
	(5,  'Cantemir'),
	(6,  'Calarasi'),
	(7,  'Căuseni'),
	(8,  'Cimislia'),
	(9,  'Criuleni'),
	(10,  'Donduseni'),
	(11, 'Drochia'),
	(12, 'Dubasari'),
	(13, 'Edinet'),
	(14, 'Falești'),
	(15, 'Floresti'),
	(16, 'Glodeni'),
	(17, 'Hincești'),
	(18, 'Ialoveni'),
	(19, 'Leova'),
	(20, 'Nisporeni'),
	(21, 'Ocnita'),
	(22, 'Orhei'),
	(23, 'Rezina'),
	(24, 'Riscani'),
	(25, 'Singerei'),
	(26, 'Soroca'),
	(27, 'Straseni'),
	(28, 'Soldănești'),
	(29, 'Stefan Voda'),
	(30, 'Taraclia'),
	(31, 'Telenesti'),
	(32, 'Ungheni'),
	(33, 'Chisinau'),
	(34, 'Balti')

INSERT INTO Localit
VALUES  (1,  'Anenii Noi',   1),
		(2,  'Basarabeasca', 2),
		(3,  'Briceni',      3),
		(4,  'Cahul',        4),
		(5,  'Cantemir',     5),
		(6,  'Calarasi',     6),
		(7,  'Căuseni',      7),
		(8,  'Cimislia',     8),
		(9,  'Criuleni',     9),
		(10,  'Donduseni',   10),
		(11, 'Drochia',      11),
		(12, 'Dubasari',     12),
		(13, 'Edinet',       13),
		(14, 'Falești',      14),
		(15, 'Floresti',     15),
		(16, 'Glodeni',      16),
		(17, 'Hincești',     17),
		(18, 'Ialoveni',     18),
		(19, 'Leova',        19),
		(20, 'Nisporeni',    20),
		(21, 'Ocnita',       21),
		(22, 'Orhei',        22),
		(23, 'Rezina',       23),
		(24, 'Riscani',      24),
		(25, 'Singerei',     25),
		(26, 'Soroca',       26),
		(27, 'Straseni',     27),
		(28, 'Soldănești',   28),
		(29, 'Stefan Voda',  29),
		(30, 'Taraclia',     30),
		(31, 'Telenesti',    31),
		(32, 'Ungheni',      32),
		(33, 'Chisinau',     33),
		(34, 'Balti',        34),
	    (35, 'Cetireni',     32),
		(36, 'Posta veche',  33),
	    (37, 'Bacioi',       33),
	    (38, 'Budesti',      33),
	    (39, 'Bubuieci',     33),
	    (40, 'Durlesti',     33),
	    (41, 'Parlita',      34),
	    (42, 'Cornesti',     32)
 
INSERT INTO Student 
VALUES (901, 'Creciunel', 'Gheorghe',    'Dorin',     'M', '2003.08.15', '066545651',1, 32),
	   (902, 'Pocitaru',  'Constantin',  'Alexandru', 'M', '2003.06.03', '064124122',3, 11),
	   (903, 'Paulescu',  'Eduard',      'Vasile',    'M', '2003.06.29', '062141253',1, 33),
	   (904, 'Grigoras',  'Dumitru',     'Oleg',      'M', '2004.01.27', '060535214',1, 33),
	   (905, 'Iosob',     'Adrian',      'Vitalie',   'M', '2003.12.14', '073123214',1, 38),
	   (906, 'Grecu',     'Stefania',    'Alexandr',  'F', '2004.09.13', '074214214',1, 33),
	   (907, 'Vasilache', 'Ion',         'Sergiu',    'M', '2003.11.11', '068312312',4, 42),
	   (908, 'Gorincioi', 'Liviu',       'Sergiu',    'M', '2004.06.21', '068489065',5, 32),
	   (909, 'Osavciuc',  'Maxim',       'Ion',       'M', '2003.12.17', '068387412',6, 32),
	   (910, 'Andoni',    'Vladimir',    'Vladimir',  'M', '2003.11.10', '066731321',1, 33),
	   (911, 'Boico',  	  'Alexandru',	 'Vitalie',   'M', '2004.03.08', '061412765',1, 15),
	   (912, 'Briceag',   'Ion',         'Sergiu',    'M', '2004.01.18', '075312312',1, 1),
	   (913, 'Buju',      'Nicoleta',	 'Nicolae',   'F', '2003.11.14', '073213121',1, 2),
	   (914, 'Colesnicenco','Artiom',	 'Ivan',      'M', '2003.07.05', '072141999',1, 3),
	   (915, 'Iasca',	   'Nicolae',	 'Alexandru', 'M', '2002.12.15', '078312488',1, 4),
	   (916, 'Munteanu',   'Corina',	 'Anatolii',  'F', '2003.09.17', '074281543',1, 5),
	   (917, 'Timofte',    'Gheorghe',	 'Gheorghe',  'M', '2003.11.29', '071512577',1, 6)


INSERT INTO ObjStud
VALUES (101, 'Matematica',        1111),
	   (102, 'Implimentarea SQL', 2222),
	   (103, 'Programarea POO',   2222),
	   (104, 'Fizica',            1111),
	   (105, 'Limba română',      4444),
	   (106, 'Istoria',           3333)

INSERT INTO ObjStGr
VALUES (1, 1, 101, 1),
	   (2, 1, 102, 2),
	   (3, 3, 103, 3),
	   (4, 6, 104, 4),
	   (5, 4, 105, 5),
	   (7, 3, 101, 1)

INSERT INTO Notele
VALUES (1, 901, 101,1, 9),
	   (2, 901, 102,1, 8),
	   (3, 901, 103,1, 8),
	   (4, 901, 104,1, 6),
	   (5, 901, 105,1, 7),
	   (6, 901, 106,1, 7),
	   (7, 902, 101,3, 4),
	   (8, 903, 102,1, 7),
	   (9, 904, 103,1, 8),
	   (10, 905,105,1, 5),
	   (11, 906,106,1, 4),
	   (12, 907,101,4, 6),
	   (13, 908,102,5, 3),
	   (14, 909,106,6, 8)

--SELECT * FROM Profesor
--SELECT * FROM Spec
--SELECT * FROM Grupa
--SELECT * FROM Catedre
--SELECT * FROM ObjStud
--SELECT * FROM Raion
--SELECT * FROM Localit
--SELECT * FROM Student
--SELECT * FROM ObjStGr
--SELECT * FROM Notele

--1.numarul de grupe ce au elevi cu note negative
SELECT NmGrupa, Count(Nota) AS NrDeNote
	FROM Grupa g INNER JOIN Notele n
	ON g.IdGrupa=n.IdGrupa
	WHERE Nota<5
	GROUP BY NmGrupa

--2.elevii ce au nota 8		
SELECT DISTINCT NmStud,	PrenStud, Nota 
	FROM Student S INNER JOIN Notele n
	ON s.IdStudent=n.IdStudent
	WHERE Nota=8 AND NmStud IN ('Creciunel', 'Osavciuc', 'Gorincioi', 'Iosob','Grecu')

--3.Lista catedrelor şi numele profesorului şef de catedră, respectiv
SELECT DISTINCT NmCatedre, NmProfesor
	FROM Profesor p INNER JOIN Catedre c
	ON p.IdProfesor = c.IdProfesor

--4.localitati din fiecare raion
SELECT NmRaion, NmLocalit 
   FROM Localit l INNER JOIN  Raion r 
   ON  l.IdRaion = r.IdRaion

--5Lista grupelor, numele specialităţii şi numele profesorului diriginte
SELECT  NmGrupa, NmSpec, NmProfesor
	FROM Grupa g  INNER JOIN Spec s
	ON g.IdSpec = s.IdSpec 
	INNER JOIN Profesor p
	ON p.IdProfesor = g.IdProfesor

--6.Numarul de grupe pentru fiecare an de studiu(am pus admitere)
SELECT COUNT(IdGrupa) AS NrDeGrupe, AnAdm
	FROM Grupa 
	GROUP BY AnAdm

--7.Să se determine câte localităţi din fiecare raion conţine tabelul Localit
SELECT NmRaion, COUNT(IdLocalit) as NrDeLocalitati
	FROM Raion r INNER JOIN Localit l
	ON r.IdRaion = l.IdRaion
	GROUP BY NmRaion

--8.Să se determine câte grupe sunt la fiecare specialitate:
SELECT NmSpec, COUNT(IdGrupa) as NrDeGrupe
	FROM Spec s INNER JOIN Grupa g
	ON s.IdSpec = g.IdSpec
	GROUP BY NmSpec

--9.Să se determine câţi studenţi învaţă din fiecare localitate:
SELECT NmLocalit, COUNT(NmLocalit) AS NrStudenti
  FROM Student s INNER JOIN Localit l
  ON s.IdLocalit=l.IdLocalit
  GROUP BY NmLocalit

--10. Să se determine câte grupe studiază disciplinele predate în colegiu
SELECT COUNT(DISTINCT ObjStGr.IdGrupa) as NrDeGrupe 
		FROM ObjStGr 
GO
--11. Să se afişeze lista localităţilor din care îşi fac studiile cel puţin 3 studenţi.
CREATE VIEW [LOC>3] AS
SELECT l.NmLocalit, COUNT(s.IdStudent) AS NrStudent
FROM Student s INNER JOIN Localit l 
ON s.IdLocalit = l.IdLocalit
GROUP BY NmLocalit
HAVING COUNT(s.IdStudent) >= 3
GO
SELECT * FROM [LOC>3]
GO

--12.Să se afişeze lista specialităţilor la care îşi fac studiile cel puţin 4 grupe :
CREATE VIEW [SPEC>4] AS
SELECT NmSpec, COUNT(IdGrupa) as NrGrupe
FROM Spec s	INNER JOIN Grupa g
ON g.IdSpec = s.IdSpec
GROUP BY NmSpec	
HAVING COUNT(g.IdSpec)>=4
GO
SELECT * FROM [SPEC>4]



