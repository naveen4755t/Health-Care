WITH source_data AS (
    SELECT * 
    FROM {{ source('raw', 'BILLING') }}
)

SELECT
    BILL_ID,
    APPOINTMENT_ID,
    BILL_AMOUNT,
    PAYMENT_STATUS,
    PAYMENT_DATE
FROM source_data