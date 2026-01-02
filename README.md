# 🚀 Hevo Postgres → Snowflake → dbt Pipeline
An **end-to-end data pipeline** demonstrating **real-time logical replication** from **PostgreSQL to Snowflake using Hevo**, with **data modeling, testing, and transformations implemented using dbt**.

## 🌟 Project Highlights


✨ **Hevo Data Replication**  
Real-time logical replication from PostgreSQL to Snowflake using Hevo.

🧱 **Snowflake Data Warehouse**  
Centralized, scalable cloud data warehouse for analytics.

🔧 **dbt Transformations & Testing**  
Clean, analytics-ready models with tests and documentation using dbt.

🔄 **End-to-End Pipeline**  
Covers the complete data lifecycle: **source → ingestion → transformation → testing**.





## 🧰 Tech Stack & Dependencies

| Component | Version / Details |
|---------|------------------|
| 🐘 PostgreSQL | v15 (Docker-based) |
| ❄️ Snowflake | Cloud Data Warehouse |
| 🔁 Hevo Data | Logical replication |
| 🧪 dbt | 1.11.2 |
| 🐍 Python | v3.12 |
| 🐳 Docker | PostgreSQL container |
| 🔧 Git | Version control |



## 🏗️ Architecture Overview

```text
CSV Files
   ↓
PostgreSQL (Docker on EC2)
   ↓
Hevo Data (Logical Replication)
   ↓
Snowflake (Raw Tables)
   ↓
dbt Models & Tests
   ↓
Analytics-Ready Tables
```

## 🚀 Setup Instructions

Follow the steps below to get the project up and running.

## ✅ Prerequisites

- 🔑 **Hevo Account**
- ❄️ **Snowflake Account**
- 🐘 **PostgreSQL 15** (Docker recommended)
- 🧪 **dbt CLI**
- 🐍 **Python 3.12**
- 🧰 **Git**

### Installation

1.  **Clone the repository**
    ```bash
    git clone https://github.com/Jay-Pathar/hevo-postgres-snowflake-dbt-pipeline.git

    cd hevo-postgres-snowflake-dbt-pipeline
    ```

2.  **Create and activate a Python virtual environment**
    ```bash
    python3 -m venv .env

    source .env/bin/activate
    ```

3.  **Install Dependencies**
    ```bash
    pip install --upgrade pip

    pip install -r requirements.txt
    ```

4.  **Configure Environment Variables:**
    Source the `set_snowflake_env.sh` file to set up your Snowflake connection environment variables.
    ```bash
    source set_snowflake_env.sh
    ```

5. **Create set_snowflake_env.sh:**
    ```bash
    touch set_snowflake_env.sh
    ```
6. **Add the following Environment Variables:**
    ```bash
    #!/bin/bash

    export SNOWFLAKE_ACCOUNT="<your_account_id>"
    export SNOWFLAKE_USER="<your_username>"
    export SNOWFLAKE_PASSWORD="<your_password>"
    export SNOWFLAKE_ROLE="ACCOUNTADMIN"
    export SNOWFLAKE_WAREHOUSE="PC_HEVODATA_WH"
    ```
7. **Make it executable and source it:**
    ```bash
    chmod +x set_snowflake_env.sh
    source set_snowflake_env.sh
    ```


### Running dbt

1. **Configure dbt profile (Snowflake connection):**:
    ```bash
    vi ~/.dbt/profiles.yml
    ```
    Add the following configuration, which references Snowflake credentials via environment variables:
    ```bash
    hevo_dbt:
        target: dev
        outputs:
            dev:
            type: snowflake
            account: "{{ env_var('SNOWFLAKE_ACCOUNT') }}"
            user: "{{ env_var('SNOWFLAKE_USER') }}"
            password: "{{ env_var('SNOWFLAKE_PASSWORD') }}"
            role: "{{ env_var('SNOWFLAKE_ROLE') }}"
            database: PC_HEVODATA_DB
            warehouse: "{{ env_var('SNOWFLAKE_WAREHOUSE') }}"
            schema: PUBLIC
            threads: 4
    ```
2. **Navigate to the `dbt/hevo_dbt/hevo_dbt` directory:**
3.  **Check dbt connection:**
    ```bash
    dbt debug
    ```

4.  **Run dbt models:**
    ```bash
    dbt run
    ```

5.  **Run dbt tests:**
    ```bash
    dbt test
    ```

## 🔗 Useful Links

- [🎥 Loom Video: End-to-End Project Completion Demonstration](https://www.loom.com/share/58f4a1897dbf4dae80389cfe06571f47)  
  A walkthrough video demonstrating the entire project setup and execution.

- [📄 End-to-End Project Documentation (Divided into Subtasks)](https://docs.google.com/document/d/1duRgDzMUEzgBDeOx29fna5N6wGQTZSe974jI9_zEFvg/edit?usp=sharing)  
  Detailed documentation breaking down the project into manageable subtasks.



## 🎯 What This Project Demonstrates

- Real-time logical replication using Hevo
- Secure Snowflake connectivity via environment variables
- Production-grade dbt modeling & testing
- Clean, scalable analytics pipeline design

## 📌 Notes & Best Practices

- 🔐 Never commit credentials or `.env` files
- 🧪 Always run `dbt test` after `dbt run`
- 📊 Use Snowflake views/materialized views for analytics