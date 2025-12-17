# 🏥 Healthcare Data Warehouse - Medallion Architecture

## 📌 Project Overview
This project demonstrates the design and implementation of a professional-grade Data Warehouse using **PostgreSQL**. It follows the **Medallion Architecture** to transform raw healthcare data into a structured Star Schema, providing a reliable foundation for BI reporting and clinical analysis.

## 🚀 Project Requirements

### 🏗️ Building the Data Warehouse (Data Engineering)

**Objective**
Develop a modern data warehouse using **PostgreSQL** to consolidate healthcare consultation data, enabling clinical analytical reporting and informed operational decision-making.

**Specifications**
* **Data Sources:** Import and restore raw medical datasets from PostgreSQL binary backups (`DATA2023`).
* **Data Quality:** Cleanse records, handle null values, and resolve data quality issues (e.g., deduplication using `ROW_NUMBER()`) within the Silver layer.
* **Integration:** Combine disparate source tables (Patients, Professionals, Specialties, and Consultations) into a unified **Star Schema** designed for high-performance analytical queries.
* **Scope:** Focus on the 2023 dataset; historization (SCD Type 2) is not required for this phase.
* **Documentation:** Maintain a strict naming convention and provide a detailed data dictionary to support both medical stakeholders and BI teams.

## 🏗️ Data Architecture
The pipeline is organized into three distinct layers to ensure data quality and traceability:

1.  **🥉 Bronze (Raw):** Original source data restored from SQL backups. Includes raw naming conventions and uncleaned records.
2.  **🥈 Silver (Cleaned):** Data standardized using `snake_case` and `lowercase` naming conventions. This layer hosts the **Star Schema** (Fact and Dimension tables).
3.  **🥇 Gold (Curated):** Business-ready views and aggregated tables optimized for Power BI and analytical performance.

## 📊 Data Model (Star Schema)
The **Silver Layer** is specifically modeled into a Star Schema to optimize performance for analytical querying and reporting.

* **Fact Table:**
    * `fact_consultation`: Contains the quantitative measurements of the business process, including metrics such as **Duration** and **Count of Visits**.
* **Dimension Tables:**
    * `dim_patient`: Contains descriptive attributes regarding patient demographics and medical history.
    * `dim_professional`: Provides healthcare provider details, including their specific medical specialties.
    * `dim_diagnostic`: Stores clinical information related to ICD-10 or other clinical diagnostic codes.
    * `dim_date`: A custom time dimension designed to support advanced trend analysis and time-intelligence calculations.


---

### 📊 BI: Analytics & Reporting (Data Analysis)

**Objective**
Develop SQL-based analytics and Power BI visualizations to deliver detailed insights into:
* **Patient Demographics:** Analysis of age groups, gender distribution, and geographic trends.
* **Professional Performance:** Insights into consultation volumes by specialty and healthcare provider.
* **Operational Trends:** Sales and consultation trends over time to identify peak periods and facility utilization.

These insights empower healthcare administrators with key business metrics, enabling strategic resource allocation and improved patient care.


---

## 🛠️ Tech Stack
The project utilizes a modern data stack to ensure scalability and maintainability:

* **Database:** PostgreSQL 18 (Relational Database Management System).
* **Database Management:** pgAdmin 4 (GUI) and Command Line Interface using `pg_restore`.
* **Languages:** SQL (PostgreSQL Dialect).
* **Visualization:** Power BI (Phase: Planned).
* **Version Control:** Git & GitHub for repository management and documentation.
