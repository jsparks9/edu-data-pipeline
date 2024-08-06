SET search_path TO data_schema;

CREATE TABLE saipe_ussd17 (
    state VARCHAR(2),
    state_FIPS VARCHAR(2),
    DistrictID VARCHAR(5),
    NameSchoolDistrict VARCHAR(81),
    TotalPopulation VARCHAR(7),
    Population5_17 VARCHAR(7),
    Population5_17InPoverty VARCHAR(6)
);
COPY saipe_ussd17 FROM '/home/Data/ussd17.csv' DELIMITER ',' CSV HEADER ENCODING 'windows-1251';
