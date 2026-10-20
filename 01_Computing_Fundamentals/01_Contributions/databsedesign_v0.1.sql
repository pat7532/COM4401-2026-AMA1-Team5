
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
    buildMotherboard(255) NOT NULL, 
    buildRam VARCHAR(255) NOT NULL,
    buildGpu VARCHAR(255),
    buildPwr VARCHAR(255) NOT NULL,
    buildCase, VARCHAR(255) NOT NULL, 
    buildMouse VARCHAR(255) NOT NULL,
    buildKeyboard VARCHAR(255) NOT NULL,
    buildMonitor VARCHAR(255) NOT NULL,
    buildWebcam VARCHAR(255) NOT NULL, 
    buildHeadset VARCHAR(255) NOT NULL,
    buildNetwork VARCHAR(255) NOT NULL,
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


INSERT INTO employeeRole (
    employeeId,
    roleDescription,
    roleBudget
)
VALUES (
    2,
    'Architect-CAD Workstation',
    2500.00
);


INSERT INTO workstationBuild (
    employeeRoleId,
    workstationBuildRecommendation
)
VALUES (
    2,
    'CAD workstation which includes high resolution monitors and large capacity storage that can store required programs and data, a dedicated GPU which can multitask and provide great resolution and better performance.'
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
    'ASUS Prime Radeon RX 9060 XT 8GB GDDR6 OC Edition',
    'Corsair RM1000e (2025) 1000W',
    'HyperX Pulsefire Haste 2 Core',
    'Redragon K745 Wired Gasket RGB Mechanical Keyboard',
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


-- Display total build costs

SELECT CONCAT('£', FORMAT(SUM(buildTotalCost), 2)) AS totalBuildCost
FROM build;


-- Query 1: List every role
-- show all columns for every role

SELECT *
FROM employeeRole;


-- Query 2: Just the names and budgets
-- show the role description and budget per workstation

SELECT roleDescription, roleBudget
FROM employeeRole;


-- Query 3: The higher-budget roles
-- show roles with a budget over £1000 per workstation

SELECT roleDescription, roleBudget
FROM employeeRole
WHERE roleBudget > 1000;


-- Query 4: Roles by team size
-- show each role and the number of employees, largest teams first

SELECT
    employeeRole.roleDescription,
    COUNT(employee.employeeId) AS teamSize
FROM employeeRole
JOIN employee
    ON employeeRole.employeeId = employee.employeeId
GROUP BY employeeRole.employeeRoleId, employeeRole.roleDescription
ORDER BY teamSize DESC;


-- Query 5: Find one build's items
-- show every component recorded for build number 1

SELECT *
FROM build
WHERE buildId = 1;


-- Query 6: Count the items in a build
-- count the components recorded for build number 1

SELECT
    buildId,
    (
        (buildCpu IS NOT NULL) +
        (buildRam IS NOT NULL) +
        (buildGpu IS NOT NULL) +
        (buildPwr IS NOT NULL) +
        (buildMouse IS NOT NULL) +
        (buildKeyboard IS NOT NULL) +
        (buildMonitor IS NOT NULL)
    ) AS itemCount
FROM build
WHERE buildId = 1;


-- Query 7: Total cost of one build
-- show the total hardware cost for build number 1

SELECT CONCAT('£', FORMAT(buildTotalCost, 2)) AS totalHardwareCost
FROM build
WHERE buildId = 1;


-- Query 8: Cost of every build
-- show the total cost of each build, most expensive first

SELECT
    buildId,
    CONCAT('£', FORMAT(buildTotalCost, 2)) AS totalCost
FROM build
ORDER BY buildTotalCost DESC;


-- Query 9: Which role is each build for?
-- show each build alongside the role it belongs to

SELECT
    build.buildId,
    employeeRole.roleDescription
FROM build
JOIN workstationBuild
    ON build.workstationBuildId = workstationBuild.workstationBuildId
JOIN employeeRole
    ON workstationBuild.employeeRoleId = employeeRole.employeeRoleId;


-- Query 10: Items with their build and role
-- show the components alongside their build and role

SELECT
    build.buildId,
    employeeRole.roleDescription,
    build.buildCpu,
    build.buildRam,
    build.buildGpu,
    build.buildPwr,
    build.buildMouse,
    build.buildKeyboard,
    build.buildMonitor,
    build.buildTotalCost
FROM build
JOIN workstationBuild
    ON build.workstationBuildId = workstationBuild.workstationBuildId
JOIN employeeRole
    ON workstationBuild.employeeRoleId = employeeRole.employeeRoleId;
