WITH source_data AS (
    SELECT * 
    FROM {{ source('raw', 'APPOINTMENTS') }}
)

SELECT
    APPOINTMENT_ID,
    PATIENT_ID,
    DOCTOR_ID,
    APPOINTMENT_DATE,
    APPOINTMENT_TIME,
    STATUS AS APPOINTMENT_STATUS,
    CREATED_AT
FROM source_data