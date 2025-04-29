# Urgoods
Data Base Final Project (SQL database for a fictional retail company)

UrGoods Inventory Management System
A SQL database solution for a fictional retail company specializing in kitchen and home products.

# 📋 Executive Summary

UrGoods currently operates with an outdated paper-based system, leading to various operational inefficiencies. The most pressing challenges faced by the company include:

  ❌ Ineffective inventory management
  
  📦 Inventory surplus and overstocking

  👤 Poor customer tracking

  📉 Inability to generate reliable analytical reports


# ✅ Proposed Solution

To address these issues, this project proposes the design and implementation of a Relational Database Management System (RDBMS). This system will:

🔄 Improve inventory management through real-time stock tracking

📊 Enable effective customer data collection and management

🛒 Store detailed purchase histories

📈 Generate accurate reports for decision-making and forecasting

# 🛠️ Tech Stack
Database: MariaDB / MySQL  

Tools: SQL, ERD diagrams

Environment: Local development (DataGrip), compatible MySQL Workbench

# 🖥️ How to run:
# Option 1: Run via Command Line or SQL Client

Clone the Repository

git clone https://github.com/your-username/urgoods-inventory-system.git

cd urgoods-inventory-system

Set Up the Database

Make sure MariaDB or MySQL is installed. Then:

sql
Copy
Edit

-- Create the database
CREATE DATABASE UrGoods;

-- Select the database
USE UrGoods;

-- Create tables
SOURCE schema/create_tables.sql;

-- Insert sample data
SOURCE schema/insert_sample_data.sql;
Run Queries

Run any script from the queries/ folder to view reports, track inventory, or analyze customer activity:

# Option 2: Run via JetBrains DataGrip
Open the Project in DataGrip

Launch DataGrip.

Open the cloned repository or manually load SQL files from the schema/ and queries/ folders.

Connect to the Database

Click the + button in the Database pane.

Select MariaDB or MySQL as the data source.

Enter your server details (host, port, user, password) and Test Connection.

Click OK to save.

Set Up the Schema

In a new SQL Console:

CREATE DATABASE UrGoods;

USE UrGoods;

Run schema/create_tables.sql and schema/insert_sample_data.sql by opening each file and pressing Ctrl+Enter or right-click → Run.


