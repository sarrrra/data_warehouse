/*
===============================================================================
DDL Script: Create Bronze Tables
===============================================================================
Layer: Bronze (Raw Landing)
Database: data_warehouse
Schema: bronze
Naming Convention: lowercase_snake_case
Description:
    This script creates the physical schema for the Bronze (Raw) layer.
===============================================================================
*/


-- Create Schema if it doesn't exist
CREATE SCHEMA IF NOT EXISTS bronze;

-- 1. Patient Table
DROP TABLE IF EXISTS bronze.patient CASCADE;
CREATE TABLE bronze.patient (
    patient_id      INT PRIMARY KEY,
    last_name       TEXT,
    first_name      TEXT,
    gender          VARCHAR(20),
    address         TEXT,
    city            TEXT,
    postal_code     VARCHAR(20),
    country         VARCHAR(10),
    email           TEXT,
    phone           VARCHAR(50),
    birth_date      VARCHAR(50), 
    age             INT,
    social_sec_num  VARCHAR(50),
    blood_group     VARCHAR(10),
    weight          VARCHAR(20),
    height          VARCHAR(20)
);

-- 2. Diagnostic Table
DROP TABLE IF EXISTS bronze.diagnostic CASCADE;
CREATE TABLE bronze.diagnostic (
    diagnostic_code VARCHAR(50) PRIMARY KEY,
    diagnostic_name TEXT
);

-- 3. Professional Table
DROP TABLE IF EXISTS bronze.professional CASCADE;
CREATE TABLE bronze.professional (
    professional_id VARCHAR(50) PRIMARY KEY,
    civility        VARCHAR(50),
    category        TEXT,
    last_name       TEXT,
    first_name      TEXT,
    profession      TEXT,
    id_type         VARCHAR(50),
    specialty_code  VARCHAR(50)
);

-- 4. Speciality Table
DROP TABLE IF EXISTS bronze.speciality CASCADE;
CREATE TABLE bronze.speciality (
    speciality_code  VARCHAR(50) PRIMARY KEY,
    function         TEXT,
    speciality_name  TEXT
);

-- 5. Consultation Table (Fact)
DROP TABLE IF EXISTS bronze.consultation CASCADE;
CREATE TABLE bronze.consultation (
    consultation_id   INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    mutuelle_id       INT,
    patient_id        INT,
    professional_id   VARCHAR(50),
    diagnostic_code   VARCHAR(50),
    motif             TEXT,
    consultation_date VARCHAR(50), 
    start_time        VARCHAR(50),
    end_time          VARCHAR(50)
);

-- 6. Medication Table
DROP TABLE IF EXISTS bronze.medication CASCADE;
CREATE TABLE bronze.medication (
    cis_code          VARCHAR(50) PRIMARY KEY,
    label             TEXT,
    dosage_form       TEXT,
    admin_route       TEXT,
    admin_status      TEXT,
    procedure_type    TEXT,
    marketing_state   TEXT,
    marketing_date    VARCHAR(50),
    bdm_status        TEXT,
    eu_auth_num       TEXT,
    holder            TEXT,
    enhanced_survey   VARCHAR(20)
);

-- 7. Laboratory Table
DROP TABLE IF EXISTS bronze.laboratory CASCADE;
CREATE TABLE bronze.laboratory (
    laboratory_id     INT PRIMARY KEY,
    laboratory_name   TEXT,
    country           TEXT
);

-- 8. Mutuelle Table
DROP TABLE IF EXISTS bronze.mutuelle CASCADE;
CREATE TABLE bronze.mutuelle (
    mutuelle_id       INT PRIMARY KEY,
    name              TEXT,
    address           TEXT
);

-- 9. Prescription Table
DROP TABLE IF EXISTS bronze.prescription CASCADE;
CREATE TABLE bronze.prescription (
    consultation_id   INT,
    cis_code          VARCHAR(50)
);

-- 10. Room Table
DROP TABLE IF EXISTS bronze.room CASCADE;
CREATE TABLE bronze.room (
    room_id           VARCHAR(50) PRIMARY KEY,
    consultation_id   INT,
    block_code        VARCHAR(50),
    floor_num         VARCHAR(20),
    room_num          VARCHAR(20)
);

-- 11. Date Lookup Table
DROP TABLE IF EXISTS bronze.date_lookup CASCADE;
CREATE TABLE bronze.date_lookup (
    date_val_1        VARCHAR(50),
    date_val_2        VARCHAR(50)
);

-- 12. Death Data (New)
DROP TABLE IF EXISTS bronze.death CASCADE;
CREATE TABLE bronze.death (
    last_name             TEXT,
    first_name            TEXT,
    gender                VARCHAR(20),
    birth_date            VARCHAR(50),
    birth_place_code      VARCHAR(50),
    birth_place           TEXT,
    birth_country         TEXT,
    death_date            VARCHAR(50),
    death_place_code      VARCHAR(50),
    death_certificate_num VARCHAR(100)
);

-- 13. Professional Activity (New)
DROP TABLE IF EXISTS bronze.professional_activity CASCADE;
CREATE TABLE bronze.professional_activity (
    professional_id       VARCHAR(50),
    organization_id       VARCHAR(50),
    practice_mode         TEXT
);

-- 14. Healthcare Facility (New)
DROP TABLE IF EXISTS bronze.healthcare_facility CASCADE;
CREATE TABLE bronze.healthcare_facility (
    address               TEXT,
    cedex                 VARCHAR(50),
    city_code             VARCHAR(50),
    postal_code           VARCHAR(50),
    city                  TEXT,
    dest_recipient        TEXT,
    geo_point_comp        TEXT,
    email                 TEXT,
    commercial_name       TEXT,
    finess_legal          VARCHAR(50),
    finess_site           VARCHAR(50),
    organization_id       VARCHAR(50),
    street_repeat_index   VARCHAR(20),
    distrib_mention       TEXT,
    street_num            VARCHAR(20),
    country               TEXT,
    legal_name            TEXT,
    siren_site            VARCHAR(50),
    siret_site            VARCHAR(50),
    fax                   VARCHAR(50),
    phone_1               VARCHAR(50),
    phone_2               VARCHAR(50),
    street_type           VARCHAR(50),
    street_name           TEXT
);

-- 15. Professional Details (New)
DROP TABLE IF EXISTS bronze.professional_details CASCADE;
CREATE TABLE bronze.professional_details (
    professional_id       VARCHAR(50),
    civility              VARCHAR(50),
    category              TEXT,
    last_name             TEXT,
    first_name            TEXT,
    city                  TEXT,
    profession            TEXT,
    specialty             TEXT,
    id_type               VARCHAR(50)
);

-- 16. Hospitalization (New)
DROP TABLE IF EXISTS bronze.hospitalization CASCADE;
CREATE TABLE bronze.hospitalization (
    hospitalization_id    VARCHAR(50),
    patient_id            INT,
    organization_id       VARCHAR(50),
    diagnostic_code       VARCHAR(50),
    diag_follow_up        TEXT,
    admission_date        VARCHAR(50),
    hospitalization_days  INT
);
