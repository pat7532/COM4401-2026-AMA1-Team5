
/*
    Employee table
    Stores basic employee information
    Use auto numbers to generate a unique ID 
*/

CREATE TABLE Employee(
    employeeID INT AUTO_INCREMENT PRIMARY KEY,
    employeeName VARCHAR(255) NOT NULL
);


CREATE TABLE EmployeeRole (
    employeeRoleID INT AUTO_INCREMENT PRIMARY KEY,
    employeeID INT,
    roleDescription TEXT NOT NULL, 
    roleBudget DECIMAL(8,2) NOT NULL,
    FOREIGN KEY (employeeID)
        REFERENCES Employee(employeeID)
);

CREATE TABLE WorkstationBuilds(
    workstationBuildID INT AUTO_INCREMENT PRIMARY KEY, 
    employeeRoleID INT, 
    workstationBuildRecomendation TEXT NOT NULL,
    FOREIGN KEY (employeeRoleID)
      REFERENCES EmployeeRole(employeeRoleID)
);

CREATE TABLE Builds (
  buildID INT AUTO_INCREMENT PRIMARY KEY, 
  workstationBuildID INT, 
  buildCpu TEXT NOT NULL, 
  buildRAM TEXT NOT NULL,
  buildGPU TEXT,
  buildPwr TEXT NOT NULL, 
  buildMouse TEXT NOT NULl, 
  buildKeyboard TEXT NOT NULL,
  buildMonitor TEXT NOT NULL, 
  buildTotalCost  DECIMAL NOT NULL,

  FOREIGN KEY (workstationBuildID)
    REFERENCES WorkstationBuilds(workstationBuildID)

);