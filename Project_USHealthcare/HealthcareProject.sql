CREATE DATABASE healthcare_claims;

USE healthcare_claims;

CREATE TABLE claims (
    ClaimID VARCHAR(36),
    PatientID VARCHAR(36),
    ProviderID VARCHAR(36),

    ClaimAmount DECIMAL(10,2),
    ClaimDate VARCHAR(20),

    DiagnosisCode VARCHAR(20),
    ProcedureCode VARCHAR(20),

    PatientAge INT,
    PatientGender VARCHAR(10),

    ProviderSpecialty VARCHAR(50),
    ClaimStatus VARCHAR(20),

    PatientIncome DECIMAL(12,2),

    PatientMaritalStatus VARCHAR(20),
    PatientEmploymentStatus VARCHAR(20),

    ProviderLocation VARCHAR(100),

    ClaimType VARCHAR(30),
    ClaimSubmissionMethod VARCHAR(20)
);

SELECT * FROM claims;

# checking all rows are loaded
SELECT COUNT(*) FROM claims;

# Validating for null values
SELECT * from claims
where ClaimAmount is NULL;

# checking for duplicate entries
select ClaimID,count(*) from claims
group by ClaimID 
Having count(*)>1;

# Converting date column
Alter table claims modify column ClaimDate date;

DESC claims;
select ClaimDate from claims limit 5;


#Checking for distinct values

SELECT DISTINCT ClaimStatus
FROM claims;
SELECT DISTINCT PatientGender
FROM claims;
SELECT DISTINCT ProviderSpecialty
FROM claims;
SELECT DISTINCT ClaimSubmissionMethod
FROM claims;

# KPI 1: Total claims:
Select count(*) AS Total_Claims from claims;

# KPI 2: Total ClaimAmount:
Select round(sum(ClaimAmount),2) as Total_ClaimAmount from claims;

# KPI 3: Average claim Amount:
Select round(avg(ClaimAmount),2) as Average_ClaimAmount from claims;

# KPI 4: Claims by status:
Select ClaimStatus,count(*) AS Total_claims 
from claims
group by ClaimStatus;