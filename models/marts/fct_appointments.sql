WITH appointments AS (
    SELECT *
    FROM {{ ref('stg_appointments') }}
),

billing AS (
    SELECT *
    FROM {{ ref('stg_billing') }}
),

patients AS (
    SELECT *
    FROM {{ ref('stg_patients') }}
),

doctors AS (
    SELECT *
    FROM {{ ref('stg_doctors') }}
)

SELECT
    a.APPOINTMENT_ID,
    a.APPOINTMENT_DATE,
    a.APPOINTMENT_TIME,
    a.APPOINTMENT_STATUS,
    a.PATIENT_ID,
    a.DOCTOR_ID,
    p.PATIENT_NAME,
    p.GENDER,
    p.CITY,
    d.DOCTOR_NAME,
    d.SPECIALIZATION,
    d.DEPARTMENT,
    b.BILL_ID,
    b.BILL_AMOUNT,
    b.PAYMENT_STATUS,
    b.PAYMENT_DATE,
    CASE WHEN a.APPOINTMENT_STATUS = 'Completed' THEN 1 ELSE 0 END AS IS_COMPLETED,
    CASE WHEN a.APPOINTMENT_STATUS = 'Cancelled' THEN 1 ELSE 0 END AS IS_CANCELLED,
    CASE WHEN a.APPOINTMENT_STATUS = 'No-Show' THEN 1 ELSE 0 END AS IS_NO_SHOW,
    CASE WHEN a.APPOINTMENT_STATUS = 'Pending' THEN 1 ELSE 0 END AS IS_PENDING

FROM appointments a
LEFT JOIN billing b
    ON a.APPOINTMENT_ID = b.APPOINTMENT_ID

LEFT JOIN patients p
    ON a.PATIENT_ID = p.PATIENT_ID

LEFT JOIN doctors d
    ON a.DOCTOR_ID = d.DOCTOR_ID
