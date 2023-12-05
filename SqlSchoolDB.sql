CREATE DATABASE SchoolDb

USE SchoolDb

CREATE Table Groups (
    Id INT PRIMARY KEY IDENTITY,
    No INT
);

CREATE TABLE Students (
    Id INT IDENTITY PRIMARY KEY,
    FullName VARCHAR(100),
    Point INT,
    GroupId INT,
    FOREIGN KEY (GroupId) REFERENCES Groups(Id)
);

CREATE TABLE Exams (
    Id INT IDENTITY PRIMARY KEY,
    [Subject] VARCHAR(100),
    StartDate DATE,
    EndDate DATE
);

CREATE TABLE StudentExams (
    StudentId INT,
    ExamId INT,
    ResultPoint INT,
    FOREIGN KEY (StudentId) REFERENCES Students(Id),
    FOREIGN KEY (ExamId) REFERENCES Exams(Id)
);

INSERT INTO Groups VALUES 
(200),
(236)

INSERT INTO Exams VALUES 
('Riyaziyyat', '2023-08-20', '2023-11-03'),
('Fizika', '2023-09-01', '2023-10-02')

INSERT INTO Students VALUES ('Elcan', 85, 1);
INSERT INTO Students VALUES ('Ehed', 75, 2);

INSERT INTO StudentExams VALUES (1, 1, 85);
INSERT INTO StudentExams VALUES (1, 2, 88);
INSERT INTO StudentExams VALUES (2, 1, 72);
INSERT INTO StudentExams VALUES (2, 2, 75);

SELECT *
FROM Students s
LEFT JOIN Groups g ON s.GroupId = g.Id;

SELECT s.*, COUNT(se.ExamId) AS ExamCount
FROM Students s
LEFT JOIN StudentExams se ON s.Id = se.StudentId
GROUP BY s.Id, s.FullName, s.Point, s.GroupId;


SELECT se.*, s.FullName, g.No AS GroupNo
FROM StudentExams se
JOIN Students s ON se.StudentId = s.Id
JOIN Groups g ON s.GroupId = g.Id;

SELECT s.*, AVG(se.ResultPoint) AS AvgResult
FROM Students s
LEFT JOIN StudentExams se ON s.Id = se.StudentId
GROUP BY s.Id, s.FullName, s.Point, s.GroupId;