CREATE DATABASE Student;
--Drop database Student

CREATE TABLE Korisnik (
    Id int NOT NULL IDENTITY PRIMARY KEY,
    UserName varchar(20),
    Password varchar(20)
);


--drop table Korisnik
select * from Student
alter TABLE Student(
    Indeks int,
	FullName varchar(100),
	Prosek float,
	Grad varchar(30)
);

ALTER TABLE Student
ADD Message varchar(5000);

alter table Student
add Message varchar(100);
select * from Student
Create TABLE Predmeti (
    Indeks int,
	SubjectName varchar(100),
	Grade int
);
Select * from Student

Alter TABLE Student
Drop column Message
INSERT INTO Predmeti (Indeks, SubjectName, Grade)
VALUES (100100,'��������',6),(100100,'���������� �������',8),(100100,'��������� � ��������� �� ��������',9),(100100,'���������� � ����������',10),
(100101,'��������',6),(100101,'���������� �������',8),(100101,'��������� � ��������� �� ��������',10),(100101,'���������� � ����������',8),
(100102,'��������',7),(100102,'���������� �������',9),(100102,'��������� � ��������� �� ��������',9),(100102,'���������� � ����������',6),
(100103,'��������',8),(100103,'���������� �������',8),(100103,'��������� � ��������� �� ��������',7),(100103,'���������� � ����������',6),
(100104,'��������',10),(100104,'���������� �������',9),(100104,'��������� � ��������� �� ��������',9),(100104,'���������� � ����������',6)


SELECT '��������', CAST(AVG(1. * Grade) AS numeric(12, 2)) as Prosek FROM Predmeti WHERE SubjectName = '��������'
SELECT '���������� �������', CAST(AVG(1. * Grade) AS numeric(12, 2)) as Prosek FROM Predmeti WHERE SubjectName = '���������� �������'
SELECT '��������� � ��������� �� ��������', CAST(AVG(1. * Grade) AS numeric(12, 2)) as Prosek FROM Predmeti WHERE SubjectName = '��������� � ��������� �� ��������'
SELECT '���������� � ����������', CAST(AVG(1. * Grade) AS numeric(12, 2)) as Prosek FROM Predmeti WHERE SubjectName = '���������� � ����������'

SELECT * FROM Predmeti ORDER BY Grade

SELECT p.SubjectName, p.Grade FROM Student s 
INNER JOIN Predmeti p ON s.Indeks = p.Indeks 
WHERE s.Indeks=100102

ALTER TABLE Korisnik
ADD IsActive int;

ALTER TABLE Korisnik
ADD IsAdmin int;

CREATE TABLE Gradovi (
    Id int,
    Name varchar(30)
);

SELECT * FROM Korisnik
delete Student
SELECT * FROM dbo.Student

SELECT * FROM Gradovi

INSERT INTO Korisnik (UserName, Password, IsActive, IsAdmin)
VALUES ('admin','admin12',1,1),('test1','test1',1,0),('admin2','admin2',1,1),('test2','test2',1,0)

DELETE Korisnik WHERE UserName = 'test'

INSERT INTO Student (Indeks, FullName, Prosek, Grad)
VALUES 
(100100,'���������� ���������', 7.5, '�����'),
(100101,'������ ������', 8.6, '�������'),
(100102,'����� �������', 9.7, '����'),
(100103,'���������� ����������', 6.3, '����� ������'),
(100104,'���� ���������', 7.2, '�����');


UPDATE Student
SET Kvota='�������'
WHERE FullName='���� ���������';
select * from Student
UPDATE Student
SET Message='Enter your message...'
WHERE Indeks='100104' 
DELETE FROM Student WHERE From_Email='Enter from email...';
select * from Student
INSERT INTO Gradovi (Id, Name)
VALUES
(1,'�����'),(2,'�������'),(3,'����'),(4,'����� ������'),(5,'�����'),(6,'����� �����'),(7,'���������'),(8,'��������'),(9,'������'),(10,'������'),
(11,'������'), (12,'���������� ��������'),(13,'�������'),(14,'���������'),(15,'�����'),(16,'������'),(17,'���������� ����'),(18,'�����'),(19,'������'),(20,'��������'),
(21,'���������'),(22,'��������'),(23,'�������'),(24,'��������'),(25,'������'),(26,'����� �����'),(27,'�������'),(28,'������'),(29,'�����'),(30,'��������'),
(31,'������'),(32,'�������'),(33,'����� �������'),(34,'��������');

--DROP TABLE Student
CREATE PROCEDURE SelectKorisnik (@UserName as varchar(20), @Password as varchar(20))
AS
BEGIN
SELECT * FROM Korisnik WHERE UserName = @UserName AND Password = @Password 
END
exec SelectKorisnik 'test1','test1'

CREATE PROCEDURE SelectGradovi 
AS
SELECT * FROM Gradovi

Alter PROCEDURE SelectStudents 
AS
SELECT * FROM Student
GO;
EXEC SelectStudents
CREATE PROCEDURE SelectUsers 
AS
SELECT * FROM Korisnik

UPDATE Korisnik SET IsAdmin = 0 WHERE Id<3


Exec SelectUsers
CREATE PROCEDURE SelectStudentByIndex
@Indeks INT
AS
BEGIN
    SELECT * FROM Student WHERE Indeks = @Indeks;
END

CREATE PROCEDURE SelectKorisnikById
@Id INT
AS
BEGIN
    SELECT * FROM Korisnik WHERE Id = @Id;
END

Alter PROCEDURE SelectUspeh (@Indeks as int)
AS
BEGIN
SELECT p.Indeks ,p.SubjectName, p.Grade FROM Student s 
INNER JOIN Predmeti p ON s.Indeks = p.Indeks 
WHERE s.Indeks=@Indeks
END

EXEC SelectUspeh 100102
EXEC SelectStudentByIndex 100101

ALTER PROCEDURE InsertStudent (@Indeks as int, @FullName as varchar(100), @Prosek as float, @Grad as varchar(30),@Kvota as varchar(30))
AS
BEGIN
INSERT INTO Student (Indeks, FullName, Prosek, Grad,Kvota) 
VALUES (@Indeks, @FullName, @Prosek, @Grad,@Kvota)
END
GO;

ALTER PROCEDURE InsertKorisnik(@UserName as varchar(20), @Password as varchar(20), @IsActive int, @IsAdmin int)
AS
BEGIN
INSERT INTO Korisnik(UserName,Password,IsActive,IsAdmin)
VALUES (@UserName,@Password,@IsActive,@IsAdmin)
END
GO;


EXEC InsertStudent 100105 ''

ALTER PROCEDURE UpdateStudent (@Indeks as int, @FullName as varchar(100), @Prosek as float, @Grad as varchar(30),@Kvota as varchar(50))
AS
BEGIN
UPDATE Student SET Indeks = @Indeks, FullName = @FullName, Prosek = @Prosek,Grad = @Grad,Kvota=@Kvota WHERE Indeks = @Indeks
END
GO;

CREATE PROCEDURE UpdateKvota(@Indeks as int,@Kvota as varchar(30))

EXEC UpdateStudent 100100,'���������� ���������',8.75,'�����','�������'

select * from Predmeti
select * from Student

CREATE PROCEDURE DeleteStudent @Indeks int
AS
DELETE FROM Student WHERE Indeks = @Indeks
GO;
Exec DeleteStudent 100106
EXEC SelectStudents

CREATE PROCEDURE UpdatePassword (@NewPassword as varchar(20), @UserName as varchar(20))
AS
BEGIN
UPDATE Korisnik SET Password = @NewPassword WHERE UserName = @UserName
END
GO;

SELECT name, type FROM dbo.sysobjects WHERE (type = 'P') --proverka za proceduri

Exec SelectStudentByIndex 100100
select * from Students
SELECT 
    *
FROM
    information_schema.tables;

SELECT CAST(AVG(1. * Grade) AS numeric(12, 2)) FROM Predmeti WHERE Indeks = 100100
UPDATE Student SET Prosek = (SELECT CAST(AVG(1. * Grade) AS numeric(12, 2)) FROM Predmeti WHERE Indeks = 100104) WHERE Indeks = 100104

CREATE PROCEDURE UpdateProsek (@Indeks as int)
AS
BEGIN
UPDATE Student SET Prosek = (SELECT CAST(AVG(1. * Grade) AS numeric(12, 2)) FROM Predmeti WHERE Indeks = @Indeks) WHERE Indeks = @Indeks
END
GO;

select * from Predmeti




Alter PROCEDURE UpdateGrade(@Indeks as int,@Grade as int,@SubjectName as varchar(100))
AS
BEGIN
UPDATE Predmeti SET Grade=@Grade WHERE SubjectName=@SubjectName AND Indeks=@Indeks
END
GO;

exec UpdateGrade 100100,10,'���������� � ����������'




CREATE PROCEDURE UpdateKvota (@Indeks as int,@Kvota as varchar(30))
AS
BEGIN
UPDATE Student SET Kvota = @Kvota WHERE Indeks = @Indeks
END
GO;

exec UpdateKvota 100100,'�������'

select * from Predmeti