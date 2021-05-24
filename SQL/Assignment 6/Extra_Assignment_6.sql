create database if not exists assignment6extra;
use assignment6extra;

CREATE TABLE IF NOT EXISTS Employee (
    EmployeeID INT AUTO_INCREMENT PRIMARY KEY,
    EmployeeFirstName VARCHAR(10),
    EmployeeLastName VARCHAR(10),
    EmployeeHireDate DATE,
    EmployeeStatus VARCHAR(20),
    SupervisorID INT,
    SocialSecurityNumber INT
);

CREATE TABLE IF NOT EXISTS Projects (
    ProjectID INT AUTO_INCREMENT PRIMARY KEY,
    ProjectName VARCHAR(20),
    ProjectStartDate DATE,
    ProjectDescription VARCHAR(50),
    ProjectDetail VARCHAR(50),
    ProjectCompleteOn DATE
);

CREATE TABLE IF NOT EXISTS Projects_Modules (
    ModuleID INT AUTO_INCREMENT PRIMARY KEY,
    ProjectID INT,
    FOREIGN KEY (ProjectID) REFERENCES Projects (ProjectID),
    ProjectModuleDate DATE,
    ProjectModuleCompleteOn DATE,
    ProjectModuleDescription VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS Work_Done (
    WorkDoneID INT AUTO_INCREMENT PRIMARY KEY,
    ModuleID INT,
    FOREIGN KEY (ModuleID) REFERENCES Projects_Modules (ModuleID),
    WorkDoneDate DATE,
    WorkDoneDescription VARCHAR(50),
    WorkDoneStatus VARCHAR(20)
);
