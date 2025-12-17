/*
===============================================================================
Create Schemas (Medallion Architecture)
===============================================================================
Script Purpose:
    This script initializes the logical layers of the Data Warehouse using 
    the Medallion Architecture pattern. It creates three distinct schemas:
    
    1. Bronze: For raw data ingestion (Source-to-Target).
    2. Silver: For cleaned, standardized, and modeled data (Star Schema).
    3. Gold:   For business-ready aggregates and reporting views.

Database Name: 
    data_warehouse (Created manually via pgAdmin)

Note:
    PostgreSQL schemas allow for better data governance and security 
    boundaries between the different stages of the ETL/ELT pipeline.
===============================================================================
*/

-- 1. Initialize the Bronze Layer (Raw Data)
CREATE SCHEMA IF NOT EXISTS bronze;

-- 2. Initialize the Silver Layer (Cleaned & Modeled Data)
CREATE SCHEMA IF NOT EXISTS silver;

-- 3. Initialize the Gold Layer (Curated & Aggregated Data)
CREATE SCHEMA IF NOT EXISTS gold;

/*
Verification:
Run the following query to confirm schemas were created:
SELECT schema_name FROM information_schema.schemata WHERE schema_name IN ('bronze', 'silver', 'gold');
*/
