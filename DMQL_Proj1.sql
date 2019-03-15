show databases;
CREATE DATABASE DMQL_Proj1;
USE DMQL_Proj1;

CREATE TABLE Users (
    EmailId varchar(250) NOT NULL,
    DisplayName varchar(100) NOT NULL,
    UserPassword varchar(50) NOT NULL,
    PRIMARY KEY (EmailId)
);

CREATE TABLE Courses(
CourseName varchar(100) NOT NULL,
CourseNumber varchar(100) NOT NULL,
CourseYear int NOT NULL,
Semester varchar(100) NOT NULL,
UniversityName varchar(250) NOT NULL,
PRIMARY KEY(CourseNumber,CourseYear,Semester,UniversityName)
);

CREATE TABLE TeachingUser(
CourseNumber varchar(100) NOT NULL,
CourseYear int NOT NULL,
Semester varchar(100) NOT NULL,
UniversityName varchar(250) NOT NULL,
EmailId varchar(250) NOT NULL,
PRIMARY KEY(CourseNumber,CourseYear,Semester,UniversityName,EmailId),
FOREIGN KEY(CourseNumber,CourseYear,Semester,UniversityName) REFERENCES Courses(CourseNumber,CourseYear,Semester,UniversityName),
FOREIGN KEY(EmailId) REFERENCES Users(EmailId)
);

CREATE TABLE CourseCreate(
CourseNumber varchar(100) NOT NULL,
CourseYear int NOT NULL,
Semester varchar(100) NOT NULL,
UniversityName varchar(250) NOT NULL,
TeacherEmailId varchar(250) NOT NULL,
PRIMARY KEY(CourseNumber,CourseYear,Semester,UniversityName),
FOREIGN KEY(CourseNumber,CourseYear,Semester,UniversityName) REFERENCES Courses(CourseNumber,CourseYear,Semester,UniversityName),
FOREIGN KEY(TeacherEmailId) REFERENCES TeachingUser(EmailId)
);

CREATE TABLE CourseRegister(
CourseNumber varchar(100) NOT NULL,
CourseYear int NOT NULL,
Semester varchar(100) NOT NULL,
UniversityName varchar(250) NOT NULL,
studentEmailId varchar(250) NOT NULL,
PRIMARY KEY(CourseNumber,CourseYear,Semester,UniversityName,studentEmailId),
FOREIGN KEY(CourseNumber,CourseYear,Semester,UniversityName) REFERENCES Courses(CourseNumber,CourseYear,Semester,UniversityName),
FOREIGN KEY(studentEmailId) REFERENCES Users(EmailId)
);

CREATE TABLE CreateUpdate(
CourseNumber varchar(100) NOT NULL,
CourseYear int NOT NULL,
Semester varchar(100) NOT NULL,
UniversityName varchar(250) NOT NULL,
EmailId varchar(250) NOT NULL,
FOREIGN KEY(CourseNumber,CourseYear,Semester,UniversityName,EmailId) REFERENCES TeachingUser(CourseNumber,CourseYear,Semester,UniversityName,EmailId)
);

CREATE TABLE QuestionPost (
	postId INT NOT NULL,
    CourseNumber VARCHAR(100) NOT NULL,
    UniversityName VARCHAR(100) NOT NULL,
    CourseYear INT NOT NULL, 
    Semester VARCHAR(250) NOT NULL,
    studentEmailId varchar(250) NOT NULL,
    QuesDescription VARCHAR(250) NOT NULL,
    QuesTitle VARCHAR(100) NOT NULL,
    PostedTime datetime NOT NULL,
    PRIMARY KEY (postId,CourseNumber, UniversityName, CourseYear, Semester, studentEmailId,PostedTime),
    FOREIGN KEY (CourseNumber,CourseYear,Semester,UniversityName,studentEmailId) REFERENCES CourseRegister(CourseNumber,CourseYear,Semester,UniversityName,studentEmailId)
);

CREATE TABLE AnswerPost (
	postId INT NOT NULL,
    CourseNumber VARCHAR(100) NOT NULL,
    CourseYear INT NOT NULL, 
    UniversityName VARCHAR(100) NOT NULL,
    Semester VARCHAR(250) NOT NULL,
    EmailId varchar(250) NOT NULL,
    QuesAnswer VARCHAR(250) NOT NULL,
    AnswerTime datetime NOT NULL,
    PRIMARY KEY (postId,CourseNumber, UniversityName, CourseYear, Semester,AnswerTime,EmailId),
    FOREIGN KEY (postId,CourseNumber, UniversityName, CourseYear, Semester) REFERENCES QuestionPost(postId,CourseNumber, UniversityName, CourseYear, Semester)
);

