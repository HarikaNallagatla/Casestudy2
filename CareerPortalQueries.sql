create database CareerGuidancePortal

create table tblUsers
(
UserId int primary key identity not null,
UserName nvarchar(50) not null,
Email nvarchar(50) not null,
Password  varchar(50) not null,
ConfirmPassword  varchar(50) not null,
User_timestamp DateTime not null,
RoleId int not null references tblRoles(RoleId)
)

create table tblMentors
(
MentorId int primary key identity not null,
MentorName nvarchar(50) not null,
Email nvarchar(50) not null,
Password  varchar(50) not null,
ConfirmPassword  varchar(50) not null,
Phonenumber nvarchar(50) not null,
Experience int not null,
Technology nvarchar(50) not null,
Mentor_timestamp DateTime not null,
RoleId int not null references tblRoles(RoleId)
)

drop table tblUsers
create table tblRoles
(
RoleId int primary key not null,
RoleName nvarchar(50) not null
)
Insert into tblRoles values(1,'User'),
(2,'Mentor')

select * from tblInstitutions

create table tblInstitutions
(
InstitutionId int primary key identity not null,
InstitutionName nvarchar(75) not null,
Place nvarchar(100) not null,
link nvarchar(75) not null
)

drop table tblInstitutions

create table tblCareers(

careerId int primary key identity not null,
careerName nvarchar(50) not null
)

 insert into tblCareers values('Engineering'),('Medicine'),('ArtsandSciences'),('Management'),('Law'),('FilmDirection')


GO
CREATE PROCEDURE [dbo].[ps_UserRegister]

@UserName nvarchar(50),
@EmailId nvarchar(50),
@Password nvarchar(50),
@ConfirmPassword  varchar(50),
@RoleId int 

AS
BEGIN
INSERT INTO tblUsers(UserName,Email,Password,ConfirmPassword,User_timestamp,RoleId)
VALUES(@UserName,@EmailId,@Password,@ConfirmPassword ,getdate(),@RoleId)
END

GO


GO
CREATE PROCEDURE [dbo].[ps_MentorRegister]

@MentorName varchar(50),
@EmailId varchar(50),
@Password varchar(50),
@ConfirmPassword  varchar(50),
@Phonenumber nvarchar(50),
@Experience int,
@Technology nvarchar(50),
@RoleId int 

AS
BEGIN
INSERT INTO tblMentors(MentorName,Email,Password,ConfirmPassword,Phonenumber,Experience,Technology,Mentor_timestamp,RoleId)
VALUES(@MentorName,@EmailId,@Password,@ConfirmPassword,@Phonenumber,@Experience,@Technology,getDate(),@RoleId)
END

GO

Drop Procedure  [dbo].[Answers]

 select * from tblForums
  select * from tblUsers

 insert into tblInstitutions values('IIT Kanpur','Kanpur,India','http://www.iitk.ac.in/'),('IIT Bombay','Bombay,Maharastra,India','http://www.iitb.ac.in/'),('IIT Madras','Chennai,Tamil Nadu,India','https://www.iitm.ac.in/'),('NIT Warangal','Warangal,AndhraPradesh,India','http://www.nitw.ac.in/main/'),('	
International Institute of Information Technology','Hyederabad,Andhra Pradesh,India','https://www.iiit.ac.in/')

create table tblForums
(
Question_Id int primary key identity not null,
Question nvarchar(max),
Posted_by nvarchar(50) not null,
)

create table tblAnswers
(
Ans_Id int primary key identity not null,
Answers nvarchar(max) ,
Answered_by nvarchar(50) not null,
Likes int ,
Question_Id int references tblForums(Question_Id)
)
 

delete   from  tblForums


insert into tblForums values('Why is this forum built?','panchami and harika')

insert into tblAnswers values('Because sivaraj asked us','pooja',43,10)
insert into tblAnswers values('Because sivaraj and Rajat both had asked us','PoojaB',43,1)

Go

create procedure [dbo].[ps_Forums]
@Question nvarchar(max),
@PostedBy nvarchar(50) 
As
Begin 
Insert into tblForums(Question,Posted_by)
 values(@Question,@PostedBy)
End
 Go

 create procedure [dbo].[ps_Answers]
 @Answers nvarchar(max) ,
 @Answered_by nvarchar(max),
 @Likes int,
 @Question_Id int 
 As 
 Begin 
 Insert into tblAnswers(Answers,Answered_by ,Likes,Question_Id)
  values(@Answers,@Answered_by, @Likes,@Question_Id)
 End
 Go

 select * from tblAnswers 

 Insert into tblMentor values('Harika','harika@gmail.com','vijaya','vijaya',9494752379,2,'C#',)