-- =====================================================
-- Views
-- =====================================================

-- Create a view that displays appointments with patient and doctor names
CREATE VIEW patient_appointments AS
SELECT
    a.appointment_id,
    d.first_name || ' ' || d.last_name AS doctor_name,
    p.first_name || ' ' || p.last_name AS patient_name,
    a.appointment_date,
    a.status
FROM appointments a
INNER JOIN patients p
    ON a.patient_id = p.patient_id
INNER JOIN doctors d
    ON d.doctor_id = a.doctor_id;


-- Create a view that displays prescription details
-- with patient, doctor, and medicine information
CREATE VIEW patient_prescription AS
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
INNER JOIN doctors
    ON prescriptions.doctor_id = doctors.doctor_id
INNER JOIN medicines
    ON prescription_items.medicine_id = medicines.medicine_id;


-- Create a view that displays medicines with their stock status
CREATE VIEW medicine_stock AS
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