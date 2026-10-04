-- employee table
-- stores basic employee information

CREATE TABLE employee (
    employeeId INT AUTO_INCREMENT PRIMARY KEY,
    employeeName VARCHAR(255) NOT NULL
);


-- employee role table
-- stores an employee's role and workstation budget

CREATE TABLE employeeRole (
    employeeRoleId INT AUTO_INCREMENT PRIMARY KEY,
    employeeId INT NOT NULL,
    roleDescription TEXT NOT NULL,
    roleBudget DECIMAL(10,2) NOT NULL,

    FOREIGN KEY (employeeId)
        REFERENCES employee(employeeId)
);


-- workstation build table
-- stores the recommended workstation for each employee role

CREATE TABLE workstationBuild (
    workstationBuildId INT AUTO_INCREMENT PRIMARY KEY,
    employeeRoleId INT NOT NULL,
    workstationBuildRecommendation TEXT NOT NULL,

    FOREIGN KEY (employeeRoleId)
        REFERENCES employeeRole(employeeRoleId)
);


-- build table
-- stores the components and total cost of the workstation

CREATE TABLE build (
    buildId INT AUTO_INCREMENT PRIMARY KEY,
    workstationBuildId INT NOT NULL,
    buildCpu VARCHAR(255) NOT NULL,
    buildRam VARCHAR(255) NOT NULL,
    buildGpu VARCHAR(255),
    buildPwr VARCHAR(255) NOT NULL,
    buildMouse VARCHAR(255) NOT NULL,
    buildKeyboard VARCHAR(255) NOT NULL,
    buildMonitor VARCHAR(255) NOT NULL,
    buildTotalCost DECIMAL(10,2) NOT NULL,

    FOREIGN KEY (workstationBuildId)
        REFERENCES workstationBuild(workstationBuildId)
);


-- insert employee

INSERT INTO employee (employeeName)
VALUES ('Patryk');


-- insert employee role

INSERT INTO employeeRole (
    employeeId,
    roleDescription,
    roleBudget
)
VALUES (
    1,
    'Project Manager - Business Workstation',
    1250.00
);


-- insert workstation recommendation

INSERT INTO workstationBuild (
    employeeRoleId,
    workstationBuildRecommendation
)
VALUES (
    1,
    'Business workstation suitable for project management, office applications, multitasking, video conferencing and general productivity.'
);


-- insert workstation build

INSERT INTO build (
    workstationBuildId,
    buildCpu,
    buildRam,
    buildGpu,
    buildPwr,
    buildMouse,
    buildKeyboard,
    buildMonitor,
    buildTotalCost
)
VALUES (
    1,
    'AMD Ryzen 5 9600X',
    '16GB Corsair Vengeance RGB DDR5 5200',
    NULL,
    'MSI MAG A650GL 650W 80+ Gold',
    'Generic USB Optical Office Mouse',
    'Generic USB Wired Office Keyboard',
    'Dell 27 Plus QHD S2725DSM',
    1250.00
);

INSERT INTO employee (employeeName)
VALUES ('gowri');


INSERT INTO employeeRole (employeeId, roleDescription,roleBudget
)
VALUES (
    2,
    'Architect-CAD Workstation', 2500.00
    
);



INSERT INTO workstationBuild (employeeRoleId,workstationBuildRecommendation
)
VALUES (
    2,'CAD worksation which includes high relosution monitors and large capacity of storge that can store requird programms and data a dedicated GPU which can multitask and provide greate resolution and with better performance '
);




INSERT INTO build (
    workstationBuildId,
    buildCpu,
    buildRam,
    buildGpu,
    buildPwr,
    buildMouse,
    buildKeyboard,
    buildMonitor,
    buildTotalCost
)
VALUES (
    2,
    'Intel Core i9-14900KX',
    'Crucial Pro Overclocking 32GB DDR5 6000 CL36',
    'ASUS Prime Radeon RX 9060 XT 8GB GDDR6 OC Edition ',
    'Corsair RM1000e (2025) 1000W',
    'HyperX Pulsefire Haste 2 Core ',
    'Redragon K745 Wired Gasket RGB Mechanical Keyboard ',
    'Dell Alienware AW2725D 26.7"',
    2434.00
);
  
-- display all employees
SELECT *
FROM employee;


-- display all employee roles

SELECT *
FROM employeeRole;


-- display all workstation recommendations

SELECT *
FROM workstationBuild;


-- display all computer builds

SELECT *
FROM build;

