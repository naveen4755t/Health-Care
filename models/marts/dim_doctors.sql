SELECT
    DOCTOR_ID,
    DOCTOR_NAME,
    SPECIALIZATION,
    DEPARTMENT
FROM {{ ref('stg_doctors') }}