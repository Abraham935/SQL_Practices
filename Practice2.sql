COPY us_counties_pop_est_2019.csv
FROM '/tmp/us_counties_pop_est_2019.csv'
WITH (FORMAT CSV, HEADER);

1.- Importing data

1) Created a table where we'll copy the data if it doesn't exist
2) Make the data file available for postgres user
3) Run the copy query using the new path
 
  
COPY us_counties_pop_est_2019
TO 'C:\YourDirectory\us_counties_export.txt'
WITH (FORMAT CSV, HEADER, DELIMITER '|');

2.- Exporting data
1) Run the query with the desired path and delimiter


CREATE TABLE percent_change (
    department text,
    spend_2019 numeric(10,2),
    spend_2022 numeric(10,2)
);

-Numeric represents 10 digits before decimal point and 2 after

SELECT department,
       spend_2019,
       spend_2022,
       round( (spend_2022 - spend_2019) /
                    spend_2019 * 100, 1) AS pct_change
FROM percent_change;

- Round function does math operation and allows us to add it to the database as a col of numeric type with one decimal digit

SELECT
    percentile_cont(.5)
    WITHIN GROUP (ORDER BY numbers),
    percentile_disc(.5)
    WITHIN GROUP (ORDER BY numbers)
FROM percentile_test;

- Change percentile we want with functions percentile_cont & percentile_disc
- Percentille_cont makes sure that any number below the result is within the percentil
- Must be arranged for it to work
