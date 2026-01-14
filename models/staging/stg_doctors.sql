WITH source_data AS (
    SELECT * 
    FROM {{ source('raw', 'DOCTORS') }}
)

SELECT
    DOCTOR_ID,
    DOCTOR_NAME,
    SPECIALIZATION,
    DEPARTMENT
FROM source_data