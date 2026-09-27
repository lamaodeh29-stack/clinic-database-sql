-- Patients Data

INSERT INTO patients
    (patient_id, first_name, last_name, date_of_birth, gender, phone, email, created_at)
VALUES
    (1, 'Sara', 'Ahmad', '1998-05-12', 'Female', '0791000001', 'sara.ahmad@email.com', '2026-09-19 01:20:02.92368'),
    (2, 'Omar', 'Khalil', '1992-08-23', 'Male', '0791000002', 'omar.khalil@email.com', '2026-09-19 01:20:02.92368'),
    (3, 'Lina', 'Hassan', '2001-03-17', 'Female', '0791000003', 'lina.hassan@email.com', '2026-09-19 01:20:02.92368'),
    (4, 'Yousef', 'Ali', '1987-11-05', 'Male', '0791000004', 'yousef.ali@email.com', '2026-09-19 01:20:02.92368'),
    (5, 'Noor', 'Saleh', '1995-07-29', 'Female', '0791000005', 'noor.saleh@email.com', '2026-09-19 01:20:02.92368'),
    (6, 'Ahmad', 'Nasser', '1989-01-14', 'Male', '0791000006', 'ahmad.nasser@email.com', '2026-09-19 01:20:02.92368'),
    (7, 'Rana', 'Mahmoud', '1997-09-08', 'Female', '0791000007', 'rana.mahmoud@email.com', '2026-09-19 01:20:02.92368'),
    (8, 'Kareem', 'Odeh', '1990-06-21', 'Male', '0791000008', 'kareem.odeh@email.com', '2026-09-19 01:20:02.92368'),
    (9, 'Dina', 'Sami', '2003-12-02', 'Female', '0791000009', 'dina.sami@email.com', '2026-09-19 01:20:02.92368'),
    (10, 'Tareq', 'Yasin', '1985-04-19', 'Male', '0791000010', 'tareq.yasin@email.com', '2026-09-19 01:20:02.92368'),
    (11, 'Maya', 'Ibrahim', '1999-10-11', 'Female', '0791000011', 'maya.ibrahim@email.com', '2026-09-19 01:20:02.92368'),
    (12, 'Zaid', 'Farah', '1993-02-27', 'Male', '0791000012', 'zaid.farah@email.com', '2026-09-19 01:20:02.92368'),
    (13, 'Hala', 'Fawzi', '1988-08-16', 'Female', '0791000013', 'hala.fawzi@email.com', '2026-09-19 01:20:02.92368'),
    (14, 'Samer', 'Qasem', '1996-05-30', 'Male', '0791000014', 'samer.qasem@email.com', '2026-09-19 01:20:02.92368'),
    (15, 'Reem', 'Adnan', '1991-11-22', 'Female', '0791000015', 'reem.adnan@email.com', '2026-09-19 01:20:02.92368'),
    (16, 'Bilal', 'Taha', '1984-03-09', 'Male', '0791000016', 'bilal.taha@email.com', '2026-09-19 01:20:02.92368'),
    (17, 'Jana', 'Rami', '2000-06-13', 'Female', '0791000017', 'jana.rami@email.com', '2026-09-19 01:20:02.92368'),
    (18, 'Fadi', 'Hamed', '1994-12-25', 'Male', '0791000018', 'fadi.hamed@email.com', '2026-09-19 01:20:02.92368'),
    (19, 'Aya', 'Khaled', '1998-01-31', 'Female', '0791000019', 'aya.khaled@email.com', '2026-09-19 01:20:02.92368'),
    (20, 'Laith', 'Musa', '1986-09-04', 'Male', '0791000020', 'laith.musa@email.com', '2026-09-19 01:20:02.92368');

    -- Doctors Data

INSERT INTO doctors
    (doctor_id, first_name, last_name, specialty, phone, email)
VALUES
    (1, 'Omar', 'Haddad', 'Cardiology', '0792000001', 'omar.haddad@clinic.com'),
    (2, 'Laila', 'Mansour', 'Dermatology', '0792000002', 'laila.mansour@clinic.com'),
    (3, 'Khaled', 'Saleh', 'Pediatrics', '0792000003', 'khaled.saleh@clinic.com'),
    (4, 'Mona', 'Nasser', 'Neurology', '0792000004', 'mona.nasser@clinic.com'),
    (5, 'Tamer', 'Yousef', 'General Medicine', '0792000005', 'tamer.yousef@clinic.com'),
    (6, 'Rania', 'Khalil', 'Orthopedics', '0792000006', 'rania.khalil@clinic.com'),
    (7, 'Fadi', 'Ahmad', 'ENT', '0792000007', 'fadi.ahmad@clinic.com'),
    (8, 'Nour', 'Samir', 'Gynecology', '0792000008', 'nour.samir@clinic.com'),
    (9, 'Hani', 'Qasem', 'Ophthalmology', '0792000009', 'hani.qasem@clinic.com'),
    (10, 'Dalia', 'Ibrahim', 'Dentistry', '0792000010', 'dalia.ibrahim@clinic.com');

    -- Medicines Data

INSERT INTO medicines
    (medicine_id, medicine_name, description, price, stock_quantity)
VALUES
    (1, 'Paracetamol', 'Pain reliever and fever reducer', 2.50, 100),
    (2, 'Amoxicillin', 'Antibiotic used for bacterial infections', 5.75, 80),
    (3, 'Ibuprofen', 'Pain reliever and anti-inflammatory', 3.25, 120),
    (4, 'Cetirizine', 'Antihistamine for allergies', 2.00, 90),
    (5, 'Omeprazole', 'Reduces stomach acid', 4.50, 70),
    (6, 'Azithromycin', 'Antibiotic for bacterial infections', 6.50, 60),
    (7, 'Metformin', 'Used to control blood sugar', 3.75, 100),
    (8, 'Amlodipine', 'Used to treat high blood pressure', 2.25, 85),
    (9, 'Atorvastatin', 'Used to lower cholesterol', 5.00, 75),
    (10, 'Salbutamol', 'Used to relieve asthma symptoms', 4.25, 50),
    (11, 'Loratadine', 'Antihistamine for allergy symptoms', 2.75, 95),
    (12, 'Diclofenac', 'Pain reliever and anti-inflammatory', 3.50, 65),
    (13, 'Vitamin D', 'Vitamin supplement for vitamin D deficiency', 4.00, 110),
    (14, 'Cough Syrup', 'Relieves cough and throat irritation', 3.25, 55),
    (15, 'Hydrocortisone', 'Topical treatment for skin inflammation', 2.50, 45),
    (16, 'Aspirin', 'Pain reliever and blood thinner', 1.75, 130),
    (17, 'Folic Acid', 'Vitamin supplement', 1.50, 100),
    (18, 'Clotrimazole', 'Antifungal medication', 3.00, 60),
    (19, 'Loperamide', 'Used to treat diarrhea', 2.25, 40),
    (20, 'Iron Supplement', 'Used to treat iron deficiency', 3.50, 90);

    -- Appointments Data

INSERT INTO appointments
    (appointment_id, doctor_id, patient_id, appointment_date, status, reason)
VALUES
    (31, 1, 1, '2026-09-20 09:00:00', 'Completed', 'Regular checkup'),
    (32, 3, 2, '2026-09-20 10:00:00', 'Completed', 'Skin allergy'),
    (33, 5, 3, '2026-09-20 11:00:00', 'Scheduled', 'Child health checkup'),
    (34, 2, 4, '2026-09-21 09:30:00', 'Completed', 'Headache'),
    (35, 4, 5, '2026-09-21 11:00:00', 'Scheduled', 'General consultation'),
    (36, 1, 6, '2026-09-21 13:00:00', 'Cancelled', 'Chest pain'),
    (37, 6, 7, '2026-09-22 09:00:00', 'Completed', 'Back pain'),
    (38, 7, 8, '2026-09-22 10:30:00', 'Scheduled', 'Ear infection'),
    (39, 8, 9, '2026-09-22 12:00:00', 'Completed', 'Eye examination'),
    (40, 10, 10, '2026-09-23 09:00:00', 'Scheduled', 'Dental checkup'),
    (41, 1, 11, '2026-09-23 10:00:00', 'Completed', 'Follow-up'),
    (42, 5, 12, '2026-09-23 11:30:00', 'Completed', 'Blood pressure check'),
    (43, 3, 13, '2026-09-24 09:00:00', 'Cancelled', 'Allergy symptoms'),
    (44, 2, 14, '2026-09-24 10:00:00', 'Scheduled', 'General consultation'),
    (45, 9, 15, '2026-09-24 11:00:00', 'Completed', 'Routine examination'),
    (46, 4, 16, '2026-09-25 09:30:00', 'Scheduled', 'Knee pain'),
    (47, 6, 17, '2026-09-25 11:00:00', 'Completed', 'Follow-up'),
    (48, 8, 18, '2026-09-25 13:00:00', 'Scheduled', 'Vision problem'),
    (49, 10, 19, '2026-09-26 09:00:00', 'Completed', 'Dental pain'),
    (50, 5, 20, '2026-09-26 10:30:00', 'Scheduled', 'General checkup'),
    (51, 2, 1, '2026-09-27 09:00:00', 'Scheduled', 'Follow-up'),
    (52, 5, 2, '2026-09-27 10:00:00', 'Completed', 'Skin examination'),
    (53, 3, 3, '2026-09-27 11:00:00', 'Scheduled', 'Child consultation'),
    (54, 1, 4, '2026-09-28 09:30:00', 'Completed', 'Neurology follow-up'),
    (55, 4, 5, '2026-09-28 11:00:00', 'Scheduled', 'Routine checkup'),
    (56, 6, 6, '2026-09-28 12:00:00', 'Completed', 'Joint pain'),
    (57, 7, 7, '2026-09-29 09:00:00', 'Scheduled', 'ENT follow-up'),
    (58, 8, 8, '2026-09-29 10:30:00', 'Completed', 'Eye follow-up'),
    (59, 9, 9, '2026-09-29 12:00:00', 'Scheduled', 'General examination'),
    (60, 10, 10, '2026-09-30 09:00:00', 'Completed', 'Dental follow-up');

    -- Prescriptions Data

INSERT INTO prescriptions
    (prescription_id, patient_id, doctor_id, prescription_date, notes)
VALUES
    (1, 1, 1, '2026-09-20 09:30:00', 'Take medication as prescribed'),
    (2, 2, 3, '2026-09-20 10:30:00', 'Follow up after one week'),
    (3, 3, 5, '2026-09-20 11:30:00', 'Take after meals'),
    (4, 4, 2, '2026-09-21 10:00:00', 'Avoid strenuous activity'),
    (5, 5, 4, '2026-09-21 11:30:00', 'Continue treatment for 7 days'),
    (6, 6, 1, '2026-09-22 09:30:00', 'Take with plenty of water'),
    (7, 7, 6, '2026-09-22 10:00:00', 'Rest and avoid heavy lifting'),
    (8, 8, 7, '2026-09-22 11:00:00', 'Use medication twice daily'),
    (9, 9, 8, '2026-09-22 12:30:00', 'Follow up in two weeks'),
    (10, 10, 10, '2026-09-23 09:30:00', 'Return for dental checkup'),
    (11, 11, 1, '2026-09-23 10:30:00', 'Continue current medication'),
    (12, 12, 5, '2026-09-23 12:00:00', 'Monitor blood pressure'),
    (13, 13, 3, '2026-09-24 09:30:00', 'Avoid known allergens'),
    (14, 14, 2, '2026-09-24 10:30:00', 'Take medication before bedtime'),
    (15, 15, 9, '2026-09-24 11:30:00', 'Follow up if symptoms continue'),
    (16, 16, 4, '2026-09-25 10:00:00', 'Apply treatment daily'),
    (17, 17, 6, '2026-09-25 11:30:00', 'Continue treatment for 5 days'),
    (18, 18, 8, '2026-09-25 13:30:00', 'Use medication as directed'),
    (19, 19, 10, '2026-09-26 09:30:00', 'Return if pain persists'),
    (20, 20, 5, '2026-09-26 11:00:00', 'Follow up after treatment');

    -- Prescription Items Data

INSERT INTO prescription_items
    (item_id, prescription_id, medicine_id, dosage, frequency, duration_days)
VALUES
    (1, 1, 1, '500 mg', 'Twice daily', 7),
    (2, 1, 2, '250 mg', 'Three times daily', 5),
    (3, 2, 4, '10 mg', 'Once daily', 10),
    (4, 3, 1, '500 mg', 'Twice daily', 5),
    (5, 3, 11, '10 mg', 'Once daily', 7),
    (6, 4, 3, '400 mg', 'Twice daily', 5),
    (7, 5, 5, '20 mg', 'Once daily', 14),
    (8, 6, 6, '500 mg', 'Once daily', 5),
    (9, 7, 12, '50 mg', 'Twice daily', 7),
    (10, 8, 7, '500 mg', 'Once daily', 30),
    (11, 9, 13, '1000 IU', 'Once daily', 30),
    (12, 10, 1, '500 mg', 'Twice daily', 5),
    (13, 11, 8, '5 mg', 'Once daily', 30),
    (14, 12, 14, '10 ml', 'Three times daily', 7),
    (15, 13, 4, '10 mg', 'Once daily', 10),
    (16, 14, 9, '20 mg', 'Once daily', 30),
    (17, 15, 15, '1% cream', 'Twice daily', 14),
    (18, 16, 3, '50 mg', 'Twice daily', 7),
    (19, 17, 18, '1% cream', 'Twice daily', 10),
    (20, 18, 10, '2 mg', 'As needed', 7),
    (21, 19, 16, '81 mg', 'Once daily', 30),
    (22, 20, 17, '5 mg', 'Once daily', 30),
    (23, 2, 2, '500 mg', 'Twice daily', 7),
    (24, 5, 1, '500 mg', 'Three times daily', 5),
    (25, 8, 3, '400 mg', 'Twice daily', 7),
    (26, 10, 20, '1 tablet', 'Once daily', 30),
    (27, 12, 8, '5 mg', 'Once daily', 30),
    (28, 15, 19, '2 mg', 'As needed', 5),
    (29, 20, 1, '500 mg', 'Twice daily', 7);