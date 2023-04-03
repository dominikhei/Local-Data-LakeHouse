CREATE SCHEMA iceberg.raw with (LOCATION = 's3a://sample-lakehouse/raw/');


create table iceberg.raw.personal_loans(
    loan_id VARCHAR,
    funded_amount DOUBLE,
    funded_date VARCHAR, 
    duration_years DOUBLE, 
    duration_months DOUBLE, 
    ten_yr_treasury_index_date_funded DOUBLE, 
    interest_rate_percent DOUBLE, 
    interest_rate DOUBLE, 
    payments DOUBLE, 
    total_past_payments INTEGER, 
    loan_balance DOUBLE, 
    property_value DOUBLE, 
    purpose VARCHAR, 
    firstname VARCHAR, 
    middlename VARCHAR, 
    lastname VARCHAR, 
    social VARCHAR,
    phone VARCHAR, 
    title VARCHAR, 
    employment_length INTEGER,
    building_class_category VARCHAR, 
    tax_class_present VARCHAR, 
    building_class_present VARCHAR, 
    adress1 VARCHAR, 
    adress2 VARCHAR, 
    zip_code INTEGER, 
    city VARCHAR, 
    state VARCHAR, 
    total_units INTEGER, 
    land_sqf DOUBLE, 
    gross_sqf DOUBLE, 
    tax_class_at_sale INTEGER
);

create table hive.raw.personal_loans_hive(
    loan_id VARCHAR,
    funded_amount DOUBLE,
    funded_date VARCHAR, 
    duration_years INTEGER, 
    duration_months INTEGER, 
    ten_yr_treasury_index_date_funded DOUBLE, 
    interest_rate_percent DOUBLE, 
    interest_rate DOUBLE, 
    payments DOUBLE, 
    total_past_payments INTEGER, 
    loan_balance DOUBLE, 
    property_value DOUBLE, 
    purpose VARCHAR, 
    firstname VARCHAR, 
    middlename VARCHAR, 
    lastname VARCHAR, 
    social VARCHAR,
    phone VARCHAR, 
    title VARCHAR, 
    employment_length INTEGER,
    building_class_category VARCHAR, 
    tax_class_present VARCHAR, 
    building_class_present VARCHAR, 
    adress1 VARCHAR, 
    adress2 VARCHAR, 
    zip_code INTEGER, 
    city VARCHAR, 
    state VARCHAR, 
    total_units INTEGER, 
    land_sqf DOUBLE, 
    gross_sqf DOUBLE, 
    tax_class_at_sale INTEGER
)
WITH (external_location='s3a://sample-lakehouse/raw/loan_data/private_loans/',
      format = 'Parquet');

INSERT INTO iceberg.raw.personal_loans
SELECT *
FROM hive.raw.personal_loans_hive;

drop table hive.raw.personal_loans_hive;