-- Patients Table

CREATE TABLE patients
(
    patient_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    date_of_birth DATE NOT NULL,
    gender VARCHAR(10),
    phone VARCHAR(20) UNIQUE,
    email VARCHAR(100) UNIQUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT patients_gender_check
        CHECK (gender IN ('Male', 'Female'))
);

-- Doctors Table

CREATE TABLE doctors
(
    doctor_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    specialty VARCHAR(50) NOT NULL,
    phone VARCHAR(50) UNIQUE,
    email VARCHAR(50) UNIQUE
);

-- Medicines Table

CREATE TABLE medicines
(
    medicine_id SERIAL PRIMARY KEY,
    medicine_name VARCHAR(50) NOT NULL UNIQUE,
    description VARCHAR(50) NOT NULL,
    price NUMERIC(10,2) NOT NULL,
    stock_quantity INT NOT NULL,
    CONSTRAINT medicines_price_check
        CHECK (price >= 0),
    CONSTRAINT medicines_stock_quantity_check
        CHECK (stock_quantity >= 0)
);

-- Prescriptions Table

CREATE TABLE prescriptions
(
    prescription_id SERIAL PRIMARY KEY,
    patient_id INT NOT NULL,
    doctor_id INT NOT NULL,
    prescription_date TIMESTAMP NOT NULL,
    notes TEXT,
    CONSTRAINT fk_prescriptions_doctor
        FOREIGN KEY (doctor_id)
        REFERENCES doctors (doctor_id),
    CONSTRAINT fk_prescriptions_patient
        FOREIGN KEY (patient_id)
        REFERENCES patients (patient_id)
);

-- Prescription Items Table

CREATE TABLE prescription_items
(
    item_id SERIAL PRIMARY KEY,
    prescription_id INT NOT NULL,
    medicine_id INT NOT NULL,
    dosage VARCHAR(50) NOT NULL,
    frequency VARCHAR(50) NOT NULL,
    duration_days INT NOT NULL,
    CONSTRAINT fk_prescription_items_medicine
        FOREIGN KEY (medicine_id)
        REFERENCES medicines (medicine_id),
    CONSTRAINT fk_prescription_items_prescription
        FOREIGN KEY (prescription_id)
        REFERENCES prescriptions (prescription_id),
    CONSTRAINT prescription_items_duration_days_check
        CHECK (duration_days > 0)
);

-- Appointments Table

CREATE TABLE appointments
(
    appointment_id SERIAL PRIMARY KEY,
    doctor_id INT NOT NULL,
    patient_id INT NOT NULL,
    appointment_date TIMESTAMP NOT NULL,
    status VARCHAR(20),
    reason TEXT,
    CONSTRAINT fk_appointment_doctor
        FOREIGN KEY (doctor_id)
        REFERENCES doctors (doctor_id),
    CONSTRAINT fk_appointment_patient
        FOREIGN KEY (patient_id)
        REFERENCES patients (patient_id),
    CONSTRAINT appointments_status_check
        CHECK (status IN ('Scheduled', 'Completed', 'Cancelled'))
);