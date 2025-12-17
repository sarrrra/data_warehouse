# 🏥 Healthcare Data Warehouse - Medallion Architecture

## 📌 Project Overview
This project demonstrates the design and implementation of a professional-grade Data Warehouse using **PostgreSQL**. It follows the **Medallion Architecture** to transform raw healthcare data into a structured Star Schema, providing a reliable foundation for BI reporting and clinical analysis.

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

## 🛠️ Tech Stack
The project utilizes a modern data stack to ensure scalability and maintainability:

* **Database:** PostgreSQL 18 (Relational Database Management System).
* **Database Management:** pgAdmin 4 (GUI) and Command Line Interface using `pg_restore`.
* **Languages:** SQL (PostgreSQL Dialect).
* **Visualization:** Power BI (Phase: Planned).
* **Version Control:** Git & GitHub for repository management and documentation.
