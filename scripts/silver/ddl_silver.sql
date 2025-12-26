/*
===============================================================================
DDL Script: Create Silver Tables
===============================================================================
Layer: Silver (Cleaned & Standardized)
Metadata: Added dwh_create_date for lineage tracking
===============================================================================
*/

-- Create Schema if it doesn't exist
CREATE SCHEMA IF NOT EXISTS silver;

-- 1. Patient Table
DROP TABLE IF EXISTS silver.patient CASCADE;
CREATE TABLE silver.patient (
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
    birth_date      DATE, -- Changed to DATE for Silver
    age             INT,
    social_sec_num  VARCHAR(50),
    blood_group     VARCHAR(10),
    weight          VARCHAR(20),
    height          VARCHAR(20),
    dwh_create_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP -- Metadata column
);

-- 2. Diagnostic Table
DROP TABLE IF EXISTS silver.diagnostic CASCADE;
CREATE TABLE silver.diagnostic (
    diagnostic_code VARCHAR(50) PRIMARY KEY,
    diagnostic_name TEXT,
    dwh_create_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 3. Professional Table
DROP TABLE IF EXISTS silver.professional CASCADE;
CREATE TABLE silver.professional (
    professional_id VARCHAR(50) PRIMARY KEY,
    civility        VARCHAR(50),
    category        TEXT,
    last_name       TEXT,
    first_name      TEXT,
    profession      TEXT,
    id_type         VARCHAR(50),
    specialty_code  VARCHAR(50),
    dwh_create_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 4. Speciality Table
DROP TABLE IF EXISTS silver.speciality CASCADE;
CREATE TABLE silver.speciality (
    speciality_code  VARCHAR(50) PRIMARY KEY,
    function         TEXT,
    speciality_name  TEXT,
    dwh_create_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 5. Consultation Table (Fact)
DROP TABLE IF EXISTS silver.consultation CASCADE;
CREATE TABLE silver.consultation (
    consultation_id   INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    mutuelle_id       INT,
    patient_id        INT,
    professional_id   VARCHAR(50),
    diagnostic_code   VARCHAR(50),
    motif             TEXT,
    consultation_date DATE, -- Changed to DATE
    start_time        TIME, -- Changed to TIME
    end_time          TIME, -- Changed to TIME
    dwh_create_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 6. Medication Table
DROP TABLE IF EXISTS silver.medication CASCADE;
CREATE TABLE silver.medication (
    cis_code          VARCHAR(50) PRIMARY KEY,
    label             TEXT,
    dosage_form       TEXT,
    admin_route       TEXT,
    admin_status      TEXT,
    procedure_type    TEXT,
    marketing_state   TEXT,
    marketing_date    DATE, -- Changed to DATE
    bdm_status        TEXT,
    eu_auth_num       TEXT,
    holder            TEXT,
    enhanced_survey   VARCHAR(20),
    dwh_create_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 7. Laboratory Table
DROP TABLE IF EXISTS silver.laboratory CASCADE;
CREATE TABLE silver.laboratory (
    laboratory_id     INT PRIMARY KEY,
    laboratory_name   TEXT,
    country           TEXT,
    dwh_create_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 8. Mutuelle Table
DROP TABLE IF EXISTS silver.mutuelle CASCADE;
CREATE TABLE silver.mutuelle (
    mutuelle_id       INT PRIMARY KEY,
    name              TEXT,
    address           TEXT,
    dwh_create_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 9. Prescription Table
DROP TABLE IF EXISTS silver.prescription CASCADE;
CREATE TABLE silver.prescription (
    consultation_id   INT,
    cis_code          VARCHAR(50),
    dwh_create_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 10. Room Table
DROP TABLE IF EXISTS silver.room CASCADE;
CREATE TABLE silver.room (
    room_id           VARCHAR(50) PRIMARY KEY,
    consultation_id   INT,
    block_code        VARCHAR(50),
    floor_num         VARCHAR(20),
    room_num          VARCHAR(20),
    dwh_create_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 11. Date Lookup Table
DROP TABLE IF EXISTS silver.date_lookup CASCADE;
CREATE TABLE silver.date_lookup (
    date_val_1        DATE,
    date_val_2        DATE,
    dwh_create_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 12. Death Data
DROP TABLE IF EXISTS silver.death CASCADE;
CREATE TABLE silver.death (
    last_name             TEXT,
    first_name            TEXT,
    gender                VARCHAR(20),
    birth_date            DATE,
    birth_place_code      VARCHAR(50),
    birth_place           TEXT,
    birth_country         TEXT,
    death_date            DATE,
    death_place_code      VARCHAR(50),
    death_certificate_num VARCHAR(100),
    dwh_create_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 13. Professional Activity
DROP TABLE IF EXISTS silver.professional_activity CASCADE;
CREATE TABLE silver.professional_activity (
    professional_id       VARCHAR(50),
    organization_id       VARCHAR(50),
    practice_mode         TEXT,
    dwh_create_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 14. Healthcare Facility
DROP TABLE IF EXISTS silver.healthcare_facility CASCADE;
CREATE TABLE silver.healthcare_facility (
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
    street_name           TEXT,
    dwh_create_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 15. Professional Details
DROP TABLE IF EXISTS silver.professional_details CASCADE;
CREATE TABLE silver.professional_details (
    professional_id       VARCHAR(50),
    civility              VARCHAR(50),
    category              TEXT,
    last_name             TEXT,
    first_name            TEXT,
    city                  TEXT,
    profession            TEXT,
    specialty             TEXT,
    id_type               VARCHAR(50),
    dwh_create_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 16. Hospitalization
DROP TABLE IF EXISTS silver.hospitalization CASCADE;
CREATE TABLE silver.hospitalization (
    hospitalization_id    VARCHAR(50),
    patient_id            INT,
    organization_id       VARCHAR(50),
    diagnostic_code       VARCHAR(50),
    diag_follow_up        TEXT,
    admission_date        DATE,
    hospitalization_days  INT,
    dwh_create_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
