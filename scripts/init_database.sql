/*
===============================================================================
  Project:    Data Warehouse Schema Setup
  Database:   DataWareHouse
  Author:     Okiki Elo-oghene Joanna
  Date:       23/09/25

  Purpose:
    This script sets up the core schemas for a layered Data Warehouse model:
      - bronze : Raw data layer (data loaded directly from source systems, 
                 no transformations applied).
      - silver : Cleaned and standardized data layer (deduplicated, conformed, 
                 transformed for consistency).
      - gold   : Curated and aggregated data layer (ready for reporting, 
                 dashboards, and advanced analytics).

  Warnings:
    - These schemas are intended for Data Warehouse / Analytics purposes only.
    - Dropping or altering schemas without caution may result in data loss.
    - Ensure you are connected to the correct database before running this script.

  Usage:
    1. Connect to your SQL Server instance in Azure Data Studio (or SSMS).
    2. Switch to your target Data Warehouse database.
    3. Run this script once to create the bronze, silver, and gold schemas.
===============================================================================
*/

-- Switch to your Data Warehouse database
USE DataWareHouse;
GO

-- Create bronze schema (Raw Data Layer)
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'bronze')
BEGIN
    EXEC('CREATE SCHEMA bronze');
    PRINT 'Schema [bronze] created successfully.';
END
ELSE
    PRINT 'Schema [bronze] already exists.';
GO

-- Create silver schema (Cleaned Data Layer)
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'silver')
BEGIN
    EXEC('CREATE SCHEMA silver');
    PRINT 'Schema [silver] created successfully.';
END
ELSE
    PRINT 'Schema [silver] already exists.';
GO

-- Create gold schema (Curated Data Layer)
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'gold')
BEGIN
    EXEC('CREATE SCHEMA gold');
    PRINT 'Schema [gold] created successfully.';
END
ELSE
    PRINT 'Schema [gold] already exists.';
GO
