USE master
GO
IF EXISTS(SELECT'True' FROM SYS.DATABASES WHERE NAME='COMPANIE')
BEGIN
DROP DATABASE COMPANIE
END
CREATE DATABASE COMPANIE
GO
USE COMPANIE
GO
CREATE TABLE Angajati(
    IDAngajat int PRIMARY KEY,
    NumeAngajat varchar(50),
    SalariuPeOra money
)

CREATE TABLE Servicii(
    IDServiciu int PRIMARY KEY,
    DenumireaServiciu varchar(25),
    IDAngajat int FOREIGN KEY REFERENCES Angajati(IDAngajat),
    DataServiciu date,
    OreLucrate int
)

INSERT INTO Angajati VALUES
(1, 'Lari Edam', 100),
(2, 'Panainte Filip', 120),
(3, 'Falin Dorin', 60),
(4, 'Ghenion Marin', 110),
(5, 'Borin Eduard', 90)

INSERT INTO Servicii VALUES
(1, 'Servicii de Curatenie', 3, '2018-10-11', 6),
(2, 'Servicii Tehnice', 1, '2018-09-21', 8),
(3, 'Secretariat', 5, '2018-05-11', 10),
(4, 'Reparatie', 4, '2018-09-05', 7),
(5, 'ITSpecialist', 2, '2018-05-10', 6)

-- lista angajaților, care au acordat serviciul, ce conține în denumire cuvântul ”reparatie”;
GO
CREATE VIEW Rep AS
SELECT a.IDAngajat, NumeAngajat, DenumireaServiciu 
FROM Angajati a, Servicii s
WHERE a.IDAngajat=s.IDAngajat and DenumireaServiciu like '%Reparatie%'
GO
-- lista angajaților, care au efectuat lucrări în perioada 01.09.2018 – 15.10.2018;
BEGIN TRAN T1
SELECT NumeAngajat, DataServiciu
FROM Angajati a, Servicii s
WHERE a.IDAngajat=s.IDAngajat and DataServiciu>'2018-09-01' AND DataServiciu<'2018-10-15'
COMMIT
GO

-- lista serviciilor acordate și suma totală pentru fiecare serviciu;

SELECT DenumireaServiciu, SUM(SalariuPeOra) AS PRET
FROM Angajati A, Servicii S
WHERE A.IDAngajat = S.IDAngajat
GROUP BY DenumireaServiciu
go
-- lista angajaților și suma totală câștigată de fiecare angajat pentru serviciile acordate
BEGIN TRAN T2
ALTER TABLE Angajati
ADD  SalTotal money
 SAVE TRANSACTION sv1
 go
 UPDATE Angajati SET
 SalTotal=SalariuPeOra*OreLucrate
 FROM Angajati A, Servicii S
 WHERE A.IdAngajat=S.IDAngajat
 commit

 SELECT * FROM Angajati