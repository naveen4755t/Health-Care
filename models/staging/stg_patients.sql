WITH source_data AS (
    SELECT * 
    FROM {{ source('raw', 'PATIENTS') }}
)

SELECT
    PATIENT_ID,
    PATIENT_NAME,
    GENDER,
    DOB,
    CITY,
    CREATED_AT
FROM source_data