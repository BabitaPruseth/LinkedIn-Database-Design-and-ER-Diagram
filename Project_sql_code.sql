CREATE TABLE UserProfiles (
    UserID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Password VARCHAR(255) NOT NULL,
    ProfileSummary TEXT,
    Skills VARCHAR(255)  -- This could be a separate table for more complex relationships
);

CREATE TABLE Connections (
    ConnectionID INT PRIMARY KEY,
    UserID INT,
    ConnectionUserID INT,
    ConnectionDate DATE,
    FOREIGN KEY (UserID) REFERENCES UserProfiles(UserID),
    FOREIGN KEY (ConnectionUserID) REFERENCES UserProfiles(UserID)
);

CREATE TABLE JobPostings (
    JobID INT PRIMARY KEY,
    UserID INT,
    JobTitle VARCHAR(100) NOT NULL,
    Company VARCHAR(100) NOT NULL,
    Location VARCHAR(100),
    PostedDate DATE,
    FOREIGN KEY (UserID) REFERENCES UserProfiles(UserID)
);

CREATE TABLE Messages (
    MessageID INT PRIMARY KEY,
    SenderID INT,
    ReceiverID INT,
    MessageText TEXT,
    Timestamp TIMESTAMP,
    FOREIGN KEY (SenderID) REFERENCES UserProfiles(UserID),
    FOREIGN KEY (ReceiverID) REFERENCES UserProfiles(UserID)
);

CREATE TABLE Endorsements (
    EndorsementID INT PRIMARY KEY,
    UserID INT,
    Skill VARCHAR(100),
    EndorserID INT,
    Date DATE,
    FOREIGN KEY (UserID) REFERENCES UserProfiles(UserID),
    FOREIGN KEY (EndorserID) REFERENCES UserProfiles(UserID)
);

CREATE TABLE LearningCourses (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(100) NOT NULL,
    UserID INT,
    CompletionStatus VARCHAR(50),  -- e.g., "Completed", "In Progress"
    CompletionDate DATE,
    FOREIGN KEY (UserID) REFERENCES UserProfiles(UserID)
);
