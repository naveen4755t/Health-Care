SELECT
    PATIENT_ID,
    PATIENT_NAME,
    GENDER,
    DOB,
    CITY
FROM {{ ref('stg_patients') }}
