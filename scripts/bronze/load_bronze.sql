/*
===============================================================================
STORED PROCEDURE: Load Bronze Layer
===============================================================================
Purpose: 
    This procedure imports raw data from CSV files into the Bronze schema.
    It cleans out the old data (Truncate) before loading the new data (Copy).

How to run: 
    CALL bronze.load_bronze();

Source Files: 
    Located in C:\DataProjects\MyBIProject\data_warehouse\
===============================================================================
*/

CREATE OR REPLACE PROCEDURE bronze.load_bronze()
LANGUAGE plpgsql
AS $$
DECLARE 
    v_start_time       TIMESTAMP; 
    v_end_time         TIMESTAMP; 
    v_batch_start_time TIMESTAMP; 
    v_batch_end_time   TIMESTAMP;
BEGIN
    -- Start Batch Timing
    v_batch_start_time := clock_timestamp();
    
    RAISE NOTICE '================================================';
    RAISE NOTICE 'Loading Bronze Layer';
    RAISE NOTICE '================================================';

    --------------------------------------------------------
    -- 1. Patient
    --------------------------------------------------------
    v_start_time := clock_timestamp();
    RAISE NOTICE '>> Truncating Table: bronze.patient';
    TRUNCATE TABLE bronze.patient;
    
    RAISE NOTICE '>> Inserting Data Into: bronze.patient';
    COPY bronze.patient FROM 'C:\DataProjects\MyBIProject\data_warehouse\patient.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', NULL '');
    
    v_end_time := clock_timestamp();
    RAISE NOTICE '>> Load Duration: % seconds', ROUND(EXTRACT(EPOCH FROM (v_end_time - v_start_time))::numeric, 2);
    RAISE NOTICE '>> -------------';

    --------------------------------------------------------
    -- 2. Diagnostic
    --------------------------------------------------------
    v_start_time := clock_timestamp();
    RAISE NOTICE '>> Truncating Table: bronze.diagnostic';
    TRUNCATE TABLE bronze.diagnostic;
    
    RAISE NOTICE '>> Inserting Data Into: bronze.diagnostic';
    COPY bronze.diagnostic FROM 'C:\DataProjects\MyBIProject\data_warehouse\diagnostic.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', NULL '');
    
    v_end_time := clock_timestamp();
    RAISE NOTICE '>> Load Duration: % seconds', ROUND(EXTRACT(EPOCH FROM (v_end_time - v_start_time))::numeric, 2);
    RAISE NOTICE '>> -------------';

    --------------------------------------------------------
    -- 3. Professional
    --------------------------------------------------------
    v_start_time := clock_timestamp();
    RAISE NOTICE '>> Truncating Table: bronze.professional';
    TRUNCATE TABLE bronze.professional;
    
    RAISE NOTICE '>> Inserting Data Into: bronze.professional';
    COPY bronze.professional FROM 'C:\DataProjects\MyBIProject\data_warehouse\professional.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', NULL '');
    
    v_end_time := clock_timestamp();
    RAISE NOTICE '>> Load Duration: % seconds', ROUND(EXTRACT(EPOCH FROM (v_end_time - v_start_time))::numeric, 2);
    RAISE NOTICE '>> -------------';

    --------------------------------------------------------
    -- 4. Speciality
    --------------------------------------------------------
    v_start_time := clock_timestamp();
    RAISE NOTICE '>> Truncating Table: bronze.speciality';
    TRUNCATE TABLE bronze.speciality;
    
    RAISE NOTICE '>> Inserting Data Into: bronze.speciality';
    COPY bronze.speciality FROM 'C:\DataProjects\MyBIProject\data_warehouse\speciality.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', NULL '');
    
    v_end_time := clock_timestamp();
    RAISE NOTICE '>> Load Duration: % seconds', ROUND(EXTRACT(EPOCH FROM (v_end_time - v_start_time))::numeric, 2);
    RAISE NOTICE '>> -------------';

    --------------------------------------------------------
    -- 5. Consultation
    --------------------------------------------------------
    v_start_time := clock_timestamp();
    RAISE NOTICE '>> Truncating Table: bronze.consultation';
    TRUNCATE TABLE bronze.consultation;
    
    RAISE NOTICE '>> Inserting Data Into: bronze.consultation';
    COPY bronze.consultation FROM 'C:\DataProjects\MyBIProject\data_warehouse\consultation.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', NULL '');
    
    v_end_time := clock_timestamp();
    RAISE NOTICE '>> Load Duration: % seconds', ROUND(EXTRACT(EPOCH FROM (v_end_time - v_start_time))::numeric, 2);
    RAISE NOTICE '>> -------------';

    --------------------------------------------------------
    -- 6. Medication
    --------------------------------------------------------
    v_start_time := clock_timestamp();
    RAISE NOTICE '>> Truncating Table: bronze.medication';
    TRUNCATE TABLE bronze.medication;
    
    RAISE NOTICE '>> Inserting Data Into: bronze.medication';
    COPY bronze.medication FROM 'C:\DataProjects\MyBIProject\data_warehouse\medication.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', NULL '');
    
    v_end_time := clock_timestamp();
    RAISE NOTICE '>> Load Duration: % seconds', ROUND(EXTRACT(EPOCH FROM (v_end_time - v_start_time))::numeric, 2);
    RAISE NOTICE '>> -------------';

    --------------------------------------------------------
    -- 7. Laboratory
    --------------------------------------------------------
    v_start_time := clock_timestamp();
    RAISE NOTICE '>> Truncating Table: bronze.laboratory';
    TRUNCATE TABLE bronze.laboratory;
    
    RAISE NOTICE '>> Inserting Data Into: bronze.laboratory';
    COPY bronze.laboratory FROM 'C:\DataProjects\MyBIProject\data_warehouse\laboratory.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', NULL '');
    
    v_end_time := clock_timestamp();
    RAISE NOTICE '>> Load Duration: % seconds', ROUND(EXTRACT(EPOCH FROM (v_end_time - v_start_time))::numeric, 2);
    RAISE NOTICE '>> -------------';

    --------------------------------------------------------
    -- 8. Mutuelle
    --------------------------------------------------------
    v_start_time := clock_timestamp();
    RAISE NOTICE '>> Truncating Table: bronze.mutuelle';
    TRUNCATE TABLE bronze.mutuelle;
    
    RAISE NOTICE '>> Inserting Data Into: bronze.mutuelle';
    COPY bronze.mutuelle FROM 'C:\DataProjects\MyBIProject\data_warehouse\mutuelle.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', NULL '');
    
    v_end_time := clock_timestamp();
    RAISE NOTICE '>> Load Duration: % seconds', ROUND(EXTRACT(EPOCH FROM (v_end_time - v_start_time))::numeric, 2);
    RAISE NOTICE '>> -------------';

    --------------------------------------------------------
    -- 9. Prescription
    --------------------------------------------------------
    v_start_time := clock_timestamp();
    RAISE NOTICE '>> Truncating Table: bronze.prescription';
    TRUNCATE TABLE bronze.prescription;
    
    RAISE NOTICE '>> Inserting Data Into: bronze.prescription';
    COPY bronze.prescription FROM 'C:\DataProjects\MyBIProject\data_warehouse\prescription.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', NULL '');
    
    v_end_time := clock_timestamp();
    RAISE NOTICE '>> Load Duration: % seconds', ROUND(EXTRACT(EPOCH FROM (v_end_time - v_start_time))::numeric, 2);
    RAISE NOTICE '>> -------------';

    --------------------------------------------------------
    -- 10. Room
    --------------------------------------------------------
    v_start_time := clock_timestamp();
    RAISE NOTICE '>> Truncating Table: bronze.room';
    TRUNCATE TABLE bronze.room;
    
    RAISE NOTICE '>> Inserting Data Into: bronze.room';
    COPY bronze.room FROM 'C:\DataProjects\MyBIProject\data_warehouse\room.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', NULL '');
    
    v_end_time := clock_timestamp();
    RAISE NOTICE '>> Load Duration: % seconds', ROUND(EXTRACT(EPOCH FROM (v_end_time - v_start_time))::numeric, 2);
    RAISE NOTICE '>> -------------';

    --------------------------------------------------------
    -- 11. Date Lookup
    --------------------------------------------------------
    v_start_time := clock_timestamp();
    RAISE NOTICE '>> Truncating Table: bronze.date_lookup';
    TRUNCATE TABLE bronze.date_lookup;
    
    RAISE NOTICE '>> Inserting Data Into: bronze.date_lookup';
    COPY bronze.date_lookup FROM 'C:\DataProjects\MyBIProject\data_warehouse\date.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', NULL '');
    
    v_end_time := clock_timestamp();
    RAISE NOTICE '>> Load Duration: % seconds', ROUND(EXTRACT(EPOCH FROM (v_end_time - v_start_time))::numeric, 2);
    RAISE NOTICE '>> -------------';

	--------------------------------------------------------
    -- 12. Death Data
    --------------------------------------------------------
    v_start_time := clock_timestamp();
    RAISE NOTICE '>> Truncating Table: bronze.death';
    TRUNCATE TABLE bronze.death;
    
    RAISE NOTICE '>> Inserting Data Into: bronze.death';
    COPY bronze.death FROM 'C:\DataProjects\MyBIProject\data_warehouse\DECES EN FRANCE\deces.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', NULL '');
    
    v_end_time := clock_timestamp();
    RAISE NOTICE '>> Load Duration: % seconds', ROUND(EXTRACT(EPOCH FROM (v_end_time - v_start_time))::numeric, 2);
    RAISE NOTICE '>> -------------';

    --------------------------------------------------------
    -- 13. Professional Activity (Semicolon Fix)
    --------------------------------------------------------
    v_start_time := clock_timestamp();
    RAISE NOTICE '>> Truncating Table: bronze.professional_activity';
    TRUNCATE TABLE bronze.professional_activity;
    
    RAISE NOTICE '>> Inserting Data Into: bronze.professional_activity';
    
    -- Changed DELIMITER to ';'
    -- Added ENCODING 'latin1' for French characters
    -- Added NULL '' for the empty cases
    COPY bronze.professional_activity 
    FROM 'C:\DataProjects\MyBIProject\data_warehouse\Etablissement de SANTE\activite_professionnel_sante.csv' 
    WITH (
        FORMAT csv, 
        HEADER true, 
        DELIMITER ';', 
        NULL '',
        ENCODING 'latin1'
    );
    
    v_end_time := clock_timestamp();
    RAISE NOTICE '>> Load Duration: % seconds', ROUND(EXTRACT(EPOCH FROM (v_end_time - v_start_time))::numeric, 2);
    RAISE NOTICE '>> -------------';
    --------------------------------------------------------
    -- 14. Healthcare Facility
    --------------------------------------------------------
    v_start_time := clock_timestamp();
    RAISE NOTICE '>> Truncating Table: bronze.healthcare_facility';
    TRUNCATE TABLE bronze.healthcare_facility;
    
    RAISE NOTICE '>> Inserting Data Into: bronze.healthcare_facility';
    COPY bronze.healthcare_facility FROM 'C:\DataProjects\MyBIProject\data_warehouse\Etablissement de SANTE\etablissement_sante.csv' 
	WITH (
        FORMAT csv, 
        HEADER true, 
        DELIMITER ';', 
        NULL '',
        ENCODING 'latin1'
    );
    
    v_end_time := clock_timestamp();
    RAISE NOTICE '>> Load Duration: % seconds', ROUND(EXTRACT(EPOCH FROM (v_end_time - v_start_time))::numeric, 2);
    RAISE NOTICE '>> -------------';

    --------------------------------------------------------
    -- 15. Professional Details
    --------------------------------------------------------
    v_start_time := clock_timestamp();
    RAISE NOTICE '>> Truncating Table: bronze.professional_details';
    TRUNCATE TABLE bronze.professional_details;
    
    RAISE NOTICE '>> Inserting Data Into: bronze.professional_details';
    COPY bronze.professional_details FROM 'C:\DataProjects\MyBIProject\data_warehouse\Etablissement de SANTE\professionnel_sante.csv' 
	WITH (
        FORMAT csv, 
        HEADER true, 
        DELIMITER ';', 
        NULL '',
        ENCODING 'latin1'
    );
    
    v_end_time := clock_timestamp();
    RAISE NOTICE '>> Load Duration: % seconds', ROUND(EXTRACT(EPOCH FROM (v_end_time - v_start_time))::numeric, 2);
    RAISE NOTICE '>> -------------';

    --------------------------------------------------------
    -- 16. Hospitalization
    --------------------------------------------------------
    v_start_time := clock_timestamp();
    RAISE NOTICE '>> Truncating Table: bronze.hospitalization';
    TRUNCATE TABLE bronze.hospitalization;
    
    RAISE NOTICE '>> Inserting Data Into: bronze.hospitalization';
    COPY bronze.hospitalization FROM 'C:\DataProjects\MyBIProject\data_warehouse\Hospitalisation\Hospitalisations 02-03-2023.csv'
	WITH (
        FORMAT csv, 
        HEADER true, 
        DELIMITER ';', 
        NULL '',
        ENCODING 'latin1'
    );
    
    v_end_time := clock_timestamp();
    RAISE NOTICE '>> Load Duration: % seconds', ROUND(EXTRACT(EPOCH FROM (v_end_time - v_start_time))::numeric, 2);
    RAISE NOTICE '>> -------------';

    -- End Batch Timing
    v_batch_end_time := clock_timestamp();
    RAISE NOTICE '==========================================';
    RAISE NOTICE 'Loading Bronze Layer is Completed';
    RAISE NOTICE '   - Total Load Duration: % seconds', ROUND(EXTRACT(EPOCH FROM (v_batch_end_time - v_batch_start_time))::numeric, 2);
    RAISE NOTICE '==========================================';

EXCEPTION WHEN OTHERS THEN
    RAISE NOTICE '==========================================';
    RAISE NOTICE 'ERROR OCCURED DURING LOADING BRONZE LAYER';
    RAISE NOTICE 'Error Message: %', SQLERRM;
    RAISE NOTICE 'Error Code: %', SQLSTATE;
    RAISE NOTICE '==========================================';
END;
$$;


