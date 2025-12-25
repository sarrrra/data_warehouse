/*
===============================================================================
Load Bronze Layer (Direct Script)
===============================================================================
*/

-- 1. Patient
TRUNCATE TABLE bronze.patient;
COPY bronze.patient
    FROM 'C:\DataProjects\MyBIProject\data_warehouse\patient.csv'
    DELIMITER ',' CSV HEADER;

-- 2. Diagnostic
TRUNCATE TABLE bronze.diagnostic;
COPY bronze.diagnostic
    FROM 'C:\DataProjects\MyBIProject\data_warehouse\diagnostic.csv'
    DELIMITER ',' CSV HEADER;

-- 3. Professional
TRUNCATE TABLE bronze.professional;
COPY bronze.professional
    FROM 'C:\DataProjects\MyBIProject\data_warehouse\professional.csv'
    DELIMITER ',' CSV HEADER;

-- 4. Speciality
TRUNCATE TABLE bronze.speciality;
COPY bronze.speciality
    FROM 'C:\DataProjects\MyBIProject\data_warehouse\speciality.csv'
    DELIMITER ',' CSV HEADER;

-- 5. Consultation
TRUNCATE TABLE bronze.consultation;
COPY bronze.consultation
    FROM 'C:\DataProjects\MyBIProject\data_warehouse\consultation.csv'
    DELIMITER ',' CSV HEADER;

-- 6. Medication
TRUNCATE TABLE bronze.medication;
COPY bronze.medication
    FROM 'C:\DataProjects\MyBIProject\data_warehouse\medication.csv'
    DELIMITER ',' CSV HEADER;

-- 7. Laboratory
TRUNCATE TABLE bronze.laboratory;
COPY bronze.laboratory
    FROM 'C:\DataProjects\MyBIProject\data_warehouse\laboratory.csv'
    DELIMITER ',' CSV HEADER;

-- 8. Mutuelle
TRUNCATE TABLE bronze.mutuelle;
COPY bronze.mutuelle
    FROM 'C:\DataProjects\MyBIProject\data_warehouse\mutuelle.csv'
    DELIMITER ',' CSV HEADER;

-- 9. Prescription
TRUNCATE TABLE bronze.prescription;
COPY bronze.prescription
    FROM 'C:\DataProjects\MyBIProject\data_warehouse\prescription.csv'
    DELIMITER ',' CSV HEADER;

-- 10. Room
TRUNCATE TABLE bronze.room;
COPY bronze.room
    FROM 'C:\DataProjects\MyBIProject\data_warehouse\room.csv'
    DELIMITER ',' CSV HEADER;

-- 11. Date Lookup
TRUNCATE TABLE bronze.date_lookup;
COPY bronze.date_lookup
    FROM 'C:\DataProjects\MyBIProject\data_warehouse\date_lookup.csv'
    DELIMITER ',' CSV HEADER;
