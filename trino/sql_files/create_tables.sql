create schema minio.raw with ( LOCATION = 's3://sample-lakehouse/raw')

CREATE TABLE minio.raw.taxi_trips223 (
   trip_duration varchar,
   start_time varchar,
   stop_time varchar,
   start_station_id varchar,
   start_station_name varchar,
   start_station_latitude varchar,
   start_station_lonitude varchar,
   end_station_id varchar,
   end_station_name varchar,
   end_station_latitude varchar,
   end_station_lonitude varchar,
   bike_id varchar,
   user_type varchar,
   birth_year varchar,
   gender varchar,
   trip_duration_in_s varchar
)
WITH (
   external_location = 's3a://sample-lakehouse/raw/',
   format = 'csv'
);

CREATE TABLE iceberg.raw.ice_taxi
AS select * from minio.raw.taxi_trips22


