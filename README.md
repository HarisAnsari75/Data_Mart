# Data Mart Sales Analysis Project

## Overview
This project analyzes sales data from Data Mart, focusing on Shopify and retail channel performance from 2018 to 2020. The analysis provides insights into sales trends, channel performance, and business metrics to support data-driven decision making.

## Project Description
Data Mart is a multi-channel retail organization that operates through both online (Shopify) and physical retail stores. This SQL-based project examines sales patterns, customer behavior, and revenue trends across different platforms and time periods.

## Dataset Information
- *Time Period*: 2018 - 2020
- *Sales Channels*: 
  - Shopify (Online)
  - Retail (Physical Stores)
- *Data Granularity*: Transaction-level sales data

## Database Schema
The project utilizes the following key tables:

### Main Tables
- sales_data: Core sales transactions
- customers: Customer information
- segmesnts: C=Couple(1,2,3,4), F=Family(1,2,3,4)
- regions: Geographic sales regions
- platforms: Sales channel details

### Key Fields
- Transaction ID, Date, Amount
- Customer demographics
- Product categories
- Sales platform (Shopify/Retail)
- Geographic location

## Analysis Goals
1. *Sales Performance Analysis*
   - Year-over-year growth comparison
   - Monthly and quarterly trends
   - Channel-wise performance metrics

2. *Platform Comparison*
   - Shopify vs Retail sales volume
   - Revenue contribution by platform
   - Customer acquisition by channel

3. *Product Analysis*
   - Top-performing products
   - Category-wise revenue breakdown
   - Product trends over time

4. *Geographic Insights*
   - Regional sales distribution
   - High-performing markets
   - Growth opportunities by region

## SQL Queries Included
- Sales aggregation and trending
- Channel performance metrics
- Customer segmentation analysis
- Product ranking and analysis
- Regional sales comparison
- Time-series analysis

## Key Metrics Tracked
- Total Revenue
- Average Transaction Value
- Customer Count
- Transaction Volume
- Year-over-Year Growth Rate
- Channel Conversion Rates
- Regional Market Share

## Technologies Used
- *Database*: MySQL / PostgreSQL / SQL Server
- *Query Language*: SQL
- *Tools*: 
  - Database Management System
  - SQL IDE (e.g., MySQL Workbench, pgAdmin, SSMS)
  - Data visualization tools (optional)

## Installation & Setup

### Prerequisites
- SQL database installed (MySQL 5.7+, PostgreSQL 10+, or SQL Server 2016+)
- Database management tool
- Access to the data mart database

### Steps
1. Clone or download the repository
2. Connect to your SQL database
3. Run the schema creation scripts
4. Import the sales data
5. Execute analysis queries
```sql
-- Example connection
-- mysql -u username -p database_name
-- \i schema.sql
-- \i import_data.sql
