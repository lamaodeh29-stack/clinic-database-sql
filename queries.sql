-- ==========================================
-- 1. Basic Data Retrieval
-- ==========================================

-- Display all patients
SELECT *
FROM patients;

-- Display selected patient information
SELECT
    first_name,
    last_name,
    email,
    phone
FROM patients;

-- Find patients by name
SELECT
    first_name,
    last_name
FROM patients
WHERE first_name = 'Omar';

-- Find doctors by specialty
SELECT
    first_name,
    last_name
FROM doctors
WHERE specialty = 'Dermatology';

-- Display all medicines
SELECT *
FROM medicines;

-- Display all prescriptions
SELECT *
FROM prescriptions;


-- ==========================================
-- 2. Sorting & Filtering
-- ==========================================

-- Sort patients alphabetically by last name
SELECT *
FROM patients
ORDER BY last_name ASC;

-- Sort appointments by date
SELECT *
FROM appointments
ORDER BY appointment_date ASC;

-- Find appointments within a specific date range
SELECT *
FROM appointments
WHERE appointment_date >= '2026-09-21'
  AND appointment_date < '2026-09-27';

-- Find female patients
SELECT *
FROM patients
WHERE gender = 'Female';

-- Find doctors with a specific specialty
SELECT
    first_name,
    last_name
FROM doctors
WHERE specialty = 'Dermatology';

-- Find medicines below a specific stock quantity
SELECT *
FROM medicines
WHERE stock_quantity < 90;

-- Display completed appointments
SELECT *
FROM appointments
WHERE status = 'Completed';


-- ==========================================
-- 3. Aggregation & Statistics
-- ==========================================

-- Count the total number of patients
SELECT COUNT(*) AS patients_count
FROM patients;

-- Count the total number of doctors
SELECT COUNT(*) AS doctors_count
FROM doctors;

-- Count the total number of appointments
SELECT COUNT(*) AS total_appointments
FROM appointments;

-- Count the total number of medicines
SELECT COUNT(*) AS total_medicines
FROM medicines;

-- Calculate the average medicine price
SELECT AVG(price) AS average_price
FROM medicines;

-- Find the highest medicine price
SELECT MAX(price) AS highest_price
FROM medicines;

-- Find the lowest medicine price
SELECT MIN(price) AS lowest_price
FROM medicines;

-- Calculate the total stock quantity of all medicines
SELECT SUM(stock_quantity) AS total_stock
FROM medicines;

-- Count the total number of prescriptions
SELECT COUNT(*) AS total_prescriptions
FROM prescriptions;


-- ==========================================
-- 4. JOIN Queries
-- ==========================================

-- Display appointments with patient names
SELECT
    appointment_id,
    first_name,
    last_name
FROM appointments
INNER JOIN patients
    ON appointments.patient_id = patients.patient_id;

-- Display appointments with doctor names
SELECT
    appointment_id,
    first_name,
    last_name
FROM appointments
INNER JOIN doctors
    ON appointments.doctor_id = doctors.doctor_id;

-- Display appointments with both patient and doctor names
SELECT
    appointment_id,
    doctors.first_name || ' ' || doctors.last_name AS doctor_name,
    patients.first_name || ' ' || patients.last_name AS patient_name
FROM appointments
INNER JOIN doctors
    ON appointments.doctor_id = doctors.doctor_id
INNER JOIN patients
    ON appointments.patient_id = patients.patient_id;

-- Display prescriptions with patient names
SELECT
    patients.first_name || ' ' || patients.last_name AS patient_name,
    prescription_id
FROM patients
INNER JOIN prescriptions
    ON prescriptions.patient_id = patients.patient_id;

-- Display prescriptions with doctor names
SELECT
    doctors.first_name || ' ' || doctors.last_name AS doctor_name,
    prescription_id
FROM doctors
INNER JOIN prescriptions
    ON prescriptions.doctor_id = doctors.doctor_id;

-- Display prescription items with medicine names
SELECT
    item_id,
    medicine_name,
    dosage,
    frequency,
    duration_days
FROM prescription_items
INNER JOIN medicines
    ON prescription_items.medicine_id = medicines.medicine_id;

-- Display prescription details with patient and medicine names
SELECT
    prescription_items.prescription_id,
    patients.first_name || ' ' || patients.last_name AS patient_name,
    medicines.medicine_name,
    prescription_items.dosage,
    prescription_items.frequency,
    prescription_items.duration_days
FROM prescription_items
INNER JOIN prescriptions
    ON prescription_items.prescription_id = prescriptions.prescription_id
INNER JOIN patients
    ON prescriptions.patient_id = patients.patient_id
INNER JOIN medicines
    ON prescription_items.medicine_id = medicines.medicine_id;

-- Display complete prescription information
-- with patient, doctor, and medicine names
SELECT
    prescription_items.prescription_id,
    patients.first_name || ' ' || patients.last_name AS patient_name,
    doctors.first_name || ' ' || doctors.last_name AS doctor_name,
    medicines.medicine_name,
    prescription_items.dosage,
    prescription_items.frequency,
    prescription_items.duration_days
FROM prescription_items
INNER JOIN prescriptions
    ON prescription_items.prescription_id = prescriptions.prescription_id
INNER JOIN patients
    ON prescriptions.patient_id = patients.patient_id
INNER JOIN medicines
    ON prescription_items.medicine_id = medicines.medicine_id
INNER JOIN doctors
    ON prescriptions.doctor_id = doctors.doctor_id;


-- ==========================================
-- 5. GROUP BY & HAVING
-- ==========================================

-- Count the number of patients by gender
SELECT
    gender,
    COUNT(*) AS patient_count
FROM patients
GROUP BY gender;

-- Count the number of appointments by status
SELECT
    status,
    COUNT(*) AS appointments_count
FROM appointments
GROUP BY status;

-- Count the number of doctors by specialty
SELECT
    specialty,
    COUNT(*) AS doctors_count
FROM doctors
GROUP BY specialty;

-- Count the number of appointments for each doctor
SELECT
    doctor_id,
    COUNT(*) AS appointments_count
FROM appointments
GROUP BY doctor_id;

-- Count the number of prescriptions for each patient
SELECT
    patient_id,
    COUNT(*) AS prescription_count
FROM prescriptions
GROUP BY patient_id;

-- Find doctors with more than one appointment
SELECT
    doctor_id,
    COUNT(*) AS appointments_count
FROM appointments
GROUP BY doctor_id
HAVING COUNT(*) > 1;

-- Find patients with more than one prescription
SELECT
    patient_id,
    COUNT(*) AS prescription_count
FROM prescriptions
GROUP BY patient_id
HAVING COUNT(*) > 1;

-- Calculate the average medicine price by stock availability
SELECT
    stock_quantity,
    AVG(price) AS average_price
FROM medicines
GROUP BY stock_quantity;


-- ==========================================
-- 6. Subqueries
-- ==========================================

-- Find medicines with a price higher than the average medicine price
SELECT
    medicine_id,
    medicine_name,
    price
FROM medicines
WHERE price > (
    SELECT AVG(price)
    FROM medicines
);

-- Find patients who have at least one prescription
SELECT
    patient_id,
    first_name,
    last_name
FROM patients
WHERE patient_id IN (
    SELECT patient_id
    FROM prescriptions
);

-- Find doctors who have at least one appointment
SELECT
    doctor_id,
    first_name || ' ' || last_name AS doctor_name
FROM doctors
WHERE doctor_id IN (
    SELECT doctor_id
    FROM appointments
);

-- Find medicines with the highest price
SELECT
    medicine_id,
    medicine_name,
    price
FROM medicines
WHERE price = (
    SELECT MAX(price)
    FROM medicines
);

-- Find patients who have more prescriptions
-- than the average number of prescriptions per patient
SELECT
    patient_id,
    COUNT(*) AS prescription_count
FROM prescriptions
GROUP BY patient_id
HAVING COUNT(*) > (
    SELECT AVG(prescription_count)
    FROM (
        SELECT
            patient_id,
            COUNT(*) AS prescription_count
        FROM prescriptions
        GROUP BY patient_id
    ) AS patient_counts
);


-- ==========================================
-- 7. Data Quality Checks
-- ==========================================

-- Skipped because the project dataset was intentionally created
-- with valid, complete, and constraint-compliant data.


-- ==========================================
-- 8. Date & Time Analysis
-- ==========================================

-- Find appointments scheduled for a specific date
SELECT
    appointment_id,
    appointment_date
FROM appointments
WHERE appointment_date >= '2026-09-21'
  AND appointment_date < '2026-09-22';

-- Find appointments scheduled after a specific date
SELECT
    appointment_id,
    appointment_date
FROM appointments
WHERE appointment_date > '2026-09-21';

-- Count appointments by date
SELECT
    appointment_date::DATE AS appointment_date,
    COUNT(*) AS appointment_count
FROM appointments
GROUP BY appointment_date::DATE
ORDER BY appointment_date;

-- Find the earliest appointment
SELECT
    appointment_id,
    appointment_date
FROM appointments
ORDER BY appointment_date ASC
LIMIT 1;

-- Find the latest appointment
SELECT
    appointment_id,
    appointment_date
FROM appointments
ORDER BY appointment_date DESC
LIMIT 1;

-- Find prescriptions created within a specific date range
SELECT
    prescription_id,
    prescription_date
FROM prescriptions
WHERE prescription_date >= '2026-09-21'
  AND prescription_date < '2026-09-26';

-- Find appointments scheduled in September 2026
SELECT
    appointment_id,
    appointment_date
FROM appointments
WHERE appointment_date >= '2026-09-01'
  AND appointment_date < '2026-10-01';


-- ==========================================
-- 9. Advanced Queries & Real-World Scenarios
-- ==========================================

-- Find doctors with the highest number of completed appointments
SELECT
    doctor_id,
    COUNT(*) AS completed_appointments
FROM appointments
WHERE status = 'Completed'
GROUP BY doctor_id
HAVING COUNT(*) = (
    SELECT MAX(completed_count)
    FROM (
        SELECT
            doctor_id,
            COUNT(*) AS completed_count
        FROM appointments
        WHERE status = 'Completed'
        GROUP BY doctor_id
    ) AS doctor_counts
);

-- Find patients with the highest number of prescriptions
SELECT
    patient_id,
    COUNT(*) AS prescription_count
FROM prescriptions
GROUP BY patient_id
HAVING COUNT(*) = (
    SELECT MAX(prescription_count)
    FROM (
        SELECT
            patient_id,
            COUNT(*) AS prescription_count
        FROM prescriptions
        GROUP BY patient_id
    ) AS patient_counts
);

-- Find the most frequently prescribed medicines
SELECT
    m.medicine_id,
    m.medicine_name,
    COUNT(pi.prescription_id) AS prescription_count
FROM prescription_items pi
INNER JOIN medicines m
    ON pi.medicine_id = m.medicine_id
GROUP BY
    m.medicine_id,
    m.medicine_name
HAVING COUNT(pi.prescription_id) = (
    SELECT MAX(prescription_count)
    FROM (
        SELECT
            medicine_id,
            COUNT(prescription_id) AS prescription_count
        FROM prescription_items
        GROUP BY medicine_id
    ) AS medicine_counts
);

-- Find doctors with more appointments than the average doctor
SELECT
    doctor_id,
    COUNT(*) AS appointment_count
FROM appointments
GROUP BY doctor_id
HAVING COUNT(*) > (
    SELECT AVG(appointment_count)
    FROM (
        SELECT
            doctor_id,
            COUNT(*) AS appointment_count
        FROM appointments
        GROUP BY doctor_id
    ) AS doctor_counts
);

-- Find patients who have appointments with multiple doctors
SELECT
    patient_id,
    COUNT(DISTINCT doctor_id) AS doctor_count
FROM appointments
GROUP BY patient_id
HAVING COUNT(DISTINCT doctor_id) > 1;

-- Find medicines with stock below the average stock quantity
SELECT
    medicine_id,
    medicine_name,
    stock_quantity
FROM medicines
WHERE stock_quantity < (
    SELECT AVG(stock_quantity)
    FROM medicines
);

-- Find patients who have never had an appointment
SELECT
    p.patient_id,
    p.first_name || ' ' || p.last_name AS patient_name
FROM patients p
LEFT JOIN appointments a
    ON p.patient_id = a.patient_id
WHERE a.appointment_id IS NULL;

-- Find doctors who have never had an appointment
SELECT
    d.doctor_id,
    d.first_name || ' ' || d.last_name AS doctor_name
FROM doctors d
LEFT JOIN appointments a
    ON d.doctor_id = a.doctor_id
WHERE a.appointment_id IS NULL;

-- Find medicines that have never been prescribed
SELECT
    m.medicine_id,
    m.medicine_name
FROM medicines m
LEFT JOIN prescription_items pi
    ON m.medicine_id = pi.medicine_id
WHERE pi.medicine_id IS NULL;


-- =====================================================
-- Section 10: CASE Expressions
-- =====================================================

-- Categorize medicines based on their stock quantity
SELECT
    medicine_name,
    stock_quantity,
    CASE
        WHEN stock_quantity < 55 THEN 'Low Stock'
        WHEN stock_quantity >= 55
             AND stock_quantity <= 80 THEN 'Medium Stock'
        ELSE 'High Stock'
    END AS stock_status
FROM medicines;

-- Categorize appointments based on their status
SELECT
    appointment_id,
    CASE
        WHEN status = 'Completed' THEN 'Completed_appointments'
        WHEN status = 'Scheduled' THEN 'Scheduled_appointments'
        ELSE 'Cancelled_appointments'
    END AS appointment_status
FROM appointments;

-- Categorize patients based on their age
SELECT
    patient_id,
    first_name,
    EXTRACT(YEAR FROM AGE(date_of_birth)) AS age,
    CASE
        WHEN EXTRACT(YEAR FROM AGE(date_of_birth)) < 18 THEN 'Under 18'
        WHEN EXTRACT(YEAR FROM AGE(date_of_birth)) BETWEEN 18 AND 59 THEN 'Adult'
        ELSE 'Senior'
    END AS age_category
FROM patients;

-- Categorize medicines based on their price
SELECT
    medicine_id,
    medicine_name,
    CASE
        WHEN price <= 3.5 THEN 'Low Price'
        WHEN price > 3.5
             AND price < 5 THEN 'Medium Price'
        ELSE 'High Price'
    END AS medicine_price
FROM medicines;



-- =====================================================
-- Section 11: Common Table Expressions (CTEs)
-- =====================================================

-- Find doctors with more appointments than the average doctor
WITH doctors_appointments AS (
    SELECT
        doctor_id,
        COUNT(appointment_id) AS appointments_count
    FROM appointments
    GROUP BY doctor_id
)
SELECT
    doctor_id,
    appointments_count
FROM doctors_appointments
WHERE appointments_count > (
    SELECT AVG(appointments_count)
    FROM doctors_appointments
);

-- Find patients with more prescriptions than the average patient
WITH patient_prescriptions AS (
    SELECT
        patient_id,
        COUNT(prescription_id) AS prescription_count
    FROM prescriptions
    GROUP BY patient_id
)
SELECT
    patient_id,
    prescription_count
FROM patient_prescriptions
WHERE prescription_count > (
    SELECT AVG(prescription_count)
    FROM patient_prescriptions
);

-- Calculate the total number of appointments for each doctor
-- and display only doctors with more than 2 appointments
WITH doctors_appointments AS (
    SELECT
        doctor_id,
        COUNT(appointment_id) AS appointment_count
    FROM appointments
    GROUP BY doctor_id
    HAVING COUNT(appointment_id) > 2
)
SELECT *
FROM doctors_appointments;

-- Find patients who have appointments with more than one doctor
WITH patients_appointments AS (
    SELECT
        patient_id,
        COUNT(DISTINCT doctor_id) AS doctor_count
    FROM appointments
    GROUP BY patient_id
    HAVING COUNT(DISTINCT doctor_id) > 1
)
SELECT *
FROM patients_appointments;

-- Find patients who have received prescriptions from more than one doctor
WITH patients_prescriptions AS (
    SELECT
        patient_id,
        COUNT(DISTINCT doctor_id) AS doctor_count
    FROM prescriptions
    GROUP BY patient_id
    HAVING COUNT(DISTINCT doctor_id) > 1
)
SELECT *
FROM patients_prescriptions;
-- Find medicines that have been prescribed more than the average medicine
WITH medicine_counts AS (
    SELECT
        medicine_id,
        COUNT(DISTINCT prescription_id) AS prescription_count
    FROM prescription_items
    GROUP BY medicine_id
)
SELECT
    medicine_id,
    prescription_count
FROM medicine_counts
WHERE prescription_count > (
    SELECT AVG(prescription_count)
    FROM medicine_counts
);
-- =====================================================
-- Section 12: Window Functions
-- =====================================================

-- Rank medicines by price from highest to lowest
SELECT
	medicine_id,
	medicine_name,
	price,
	RANK() OVER (
		ORDER BY
			price DESC
	) AS price_rank
FROM
	medicines ;

-- Dense rank medicines by price from highest to lowest
SELECT
	medicine_id,
	medicine_name,
	price,
    DENSE_RANK() OVER (
		ORDER BY
			price DESC
	) AS price_rank
FROM
	medicines ;



-- Which doctors rank highest based on their total number of appointments?
WITH DOCTOR_APPOINTMENTS AS (
    SELECT
        DOCTOR_ID,
        COUNT(APPOINTMENT_ID) AS APPOINTMENT_COUNT
    FROM APPOINTMENTS
    GROUP BY DOCTOR_ID
)
SELECT
    DOCTOR_ID,
    APPOINTMENT_COUNT,
    RANK() OVER (
        ORDER BY APPOINTMENT_COUNT DESC
    ) AS DOCTOR_RANK
FROM DOCTOR_APPOINTMENTS;

-- Which patients have the most appointments compared with other patients?
SELECT
    PATIENT_ID,
    COUNT(APPOINTMENT_ID) AS APPOINTMENT_COUNT,
    RANK() OVER (
        ORDER BY COUNT(APPOINTMENT_ID) DESC
    ) AS PATIENT_RANK
FROM APPOINTMENTS
GROUP BY PATIENT_ID;

-- What is the appointment ranking of each patient within their own appointments?
SELECT
    PATIENT_ID,
    APPOINTMENT_ID,
    APPOINTMENT_DATE,
    ROW_NUMBER() OVER (
        PARTITION BY PATIENT_ID
        ORDER BY APPOINTMENT_DATE DESC
    ) AS APPOINTMENT_RANK
FROM APPOINTMENTS;

-- Which medicines have the same price and what is their dense price ranking?
SELECT
    MEDICINE_ID,
    MEDICINE_NAME,
    PRICE,
    DENSE_RANK() OVER (
        ORDER BY PRICE DESC
    ) AS PRICE_RANK
FROM MEDICINES;