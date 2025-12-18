/*
===============================================================================
DDL Script: Create Bronze Tables
===============================================================================
Layer: Bronze (Raw Landing)
Database: data_warehouse
Schema: bronze
Naming Convention: lowercase_snake_case
===============================================================================
*/

-- 1. Patient Table
DROP TABLE IF EXISTS bronze.patient CASCADE;
CREATE TABLE bronze.patient (
    patient_id      INT PRIMARY KEY,
    last_name       VARCHAR(20),
    first_name      VARCHAR(23),
    gender          VARCHAR(6),
    address         VARCHAR(100),
    city            VARCHAR(100),
    postal_code     VARCHAR(20),
    country         VARCHAR(2),
    email           VARCHAR(100),
    phone           VARCHAR(25),
    birth_date      VARCHAR(10), -- Kept as VARCHAR per source for raw landing
    age             INT,
    social_sec_num  VARCHAR(16),
    blood_group     VARCHAR(3),
    weight          VARCHAR(5),
    height          VARCHAR(3)
);

-- 2. Diagnostic Table
DROP TABLE IF EXISTS bronze.diagnostic CASCADE;
CREATE TABLE bronze.diagnostic (
    diagnostic_code VARCHAR(50) PRIMARY KEY,
    diagnostic_name VARCHAR(255)
);

-- 3. Professional Table (Professionnel_de_sante)
DROP TABLE IF EXISTS bronze.professional CASCADE;
CREATE TABLE bronze.professional (
    professional_id VARCHAR(50) PRIMARY KEY,
    civility        VARCHAR(50),
    category        VARCHAR(100),
    last_name       VARCHAR(100),
    first_name      VARCHAR(100),
    profession      VARCHAR(100),
    id_type         VARCHAR(50),
    specialty_code  VARCHAR(50)
);

-- 4. Specialties Table (Specialites)
DROP TABLE IF EXISTS bronze.speciality CASCADE;
CREATE TABLE bronze.speciality (
    speciality_code  VARCHAR(50) PRIMARY KEY,
    function        VARCHAR(100),
    speciality_name  VARCHAR(100)
);

-- 5. Consultation Table (Fact Source)
DROP TABLE IF EXISTS bronze.consultation CASCADE;
CREATE TABLE bronze.consultation (
    consultation_id   INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    mutuelle_id       INT,
    patient_id        INT,
    professional_id   VARCHAR(50),
    diagnostic_code   VARCHAR(50),
    motif             VARCHAR(255),
    consultation_date DATE,
    start_time        TIME,
    end_time          TIME
);

-- 6. Medication Table (Medicaments)
DROP TABLE IF EXISTS bronze.medication CASCADE;
CREATE TABLE bronze.medication (
    cis_code          VARCHAR(50) PRIMARY KEY,
    label             VARCHAR(255),
    dosage_form       VARCHAR(255),
    admin_route       VARCHAR(255),
    admin_status      VARCHAR(100),
    procedure_type    VARCHAR(100),
    marketing_state   VARCHAR(100),
    marketing_date    VARCHAR(50),
    bdm_status        VARCHAR(50),
    eu_auth_num       VARCHAR(100),
    holder            VARCHAR(255),
    enhanced_survey   VARCHAR(10)
);

-- 7. Laboratory Table (Laboratoire)
DROP TABLE IF EXISTS bronze.laboratory CASCADE;
CREATE TABLE bronze.laboratory (
    laboratory_id     INT PRIMARY KEY,
    laboratory_name   VARCHAR(100),
    country           VARCHAR(100)
);

-- 8. Mutuelle Table
DROP TABLE IF EXISTS bronze.mutuelle CASCADE;
CREATE TABLE bronze.mutuelle (
    mutuelle_id       INT PRIMARY KEY,
    name              VARCHAR(100),
    address           VARCHAR(100)
);

-- 9. Prescription Table (Mapping table)
DROP TABLE IF EXISTS bronze.prescription CASCADE;
CREATE TABLE bronze.prescription (
    consultation_id   INT,
    cis_code          VARCHAR(50)
);

-- 10. Room Table (Salle)
DROP TABLE IF EXISTS bronze.room CASCADE;
CREATE TABLE bronze.room (
    room_id           VARCHAR(50) PRIMARY KEY,
    consultation_id   INT,
    block_code        VARCHAR(50),
    floor_num         VARCHAR(10),
    room_num          VARCHAR(10)
);

-- 11. Date Reference Table
DROP TABLE IF EXISTS bronze.date_lookup CASCADE;
CREATE TABLE bronze.date_lookup (
    date_val_1        VARCHAR(50),
    date_val_2        VARCHAR(50)
);
