-- 1. Departments table
CREATE TABLE departments (
    department_id NUMBER PRIMARY KEY,
    department_name VARCHAR2(100),
    location VARCHAR2(100),
    head_doctor_id NUMBER,
    description VARCHAR2(200)
);

-- 2. Doctors table
CREATE TABLE doctors (
    doctor_id NUMBER PRIMARY KEY,
    first_name VARCHAR2(50) NOT NULL,
    last_name VARCHAR2(50) ,
    gender VARCHAR2(10),
    birth_date DATE,
    phone_number VARCHAR2(20),
    email VARCHAR2(100),
    specialty VARCHAR2(100) ,
    department_id NUMBER ,
    hire_date DATE ,
    salary NUMBER(10,2),
    address VARCHAR2(200),
    city VARCHAR2(50) DEFAULT 'Mogadishu'
);

-- 3. Patients table
CREATE TABLE patients (
    patient_id NUMBER PRIMARY KEY,
    first_name VARCHAR2(50) ,
    last_name VARCHAR2(50) ,
    gender VARCHAR2(10),
    birth_date DATE,
    phone_number VARCHAR2(20),
    address VARCHAR2(200),
    city VARCHAR2(50) DEFAULT 'Mogadishu',
    blood_type VARCHAR2(5),
    emergency_contact VARCHAR2(100),
    emergency_phone VARCHAR2(20),
    registration_date DATE DEFAULT SYSDATE
);

-- 4. Rooms table
CREATE TABLE rooms (
    room_id NUMBER PRIMARY KEY,
    room_number VARCHAR2(10) NOT NULL,
    room_type VARCHAR2(50) ,
    department_id NUMBER ,
    capacity NUMBER DEFAULT 1,
    status VARCHAR2(20) DEFAULT 'Available'
);

-- 5. Appointments table
CREATE TABLE appointments (
    appointment_id NUMBER PRIMARY KEY,
    patient_id NUMBER ,
    doctor_id NUMBER ,
    appointment_date TIMESTAMP ,
    purpose VARCHAR2(200),
    status VARCHAR2(20) DEFAULT 'Scheduled',
    notes VARCHAR2(500)
);

-- 6. Admissions table
CREATE TABLE admissions (
    admission_id NUMBER PRIMARY KEY,
    patient_id NUMBER ,
    admitting_doctor_id NUMBER ,
    room_id NUMBER NOT NULL,
    admission_date TIMESTAMP ,
    discharge_date TIMESTAMP,
    diagnosis VARCHAR2(200),
    treatment_plan VARCHAR2(500),
    status VARCHAR2(20) DEFAULT 'Admitted'
);

-- 7. Employees table
CREATE TABLE employees (
    employee_id NUMBER PRIMARY KEY,
    first_name VARCHAR2(50) NOT NULL,
    last_name VARCHAR2(50) ,
    gender VARCHAR2(10),
    birth_date DATE,
    phone_number VARCHAR2(20),
    email VARCHAR2(100),
    job_title VARCHAR2(100) ,
    department_id NUMBER,
    hire_date DATE ,
    salary NUMBER(10,2),
    address VARCHAR2(200),
    city VARCHAR2(50) DEFAULT 'Mogadishu'
);

ALTER TABLE employees ADD (
  commission_pct NUMBER(5,2),
  manager_id NUMBER
);

-- 8. Medical_records table
CREATE TABLE medical_records (
    record_id NUMBER PRIMARY KEY,
    patient_id NUMBER ,
    doctor_id NUMBER ,
    record_date TIMESTAMP DEFAULT SYSTIMESTAMP,
    diagnosis VARCHAR2(200) ,
    treatment VARCHAR2(500),
    prescription VARCHAR2(500),
    notes VARCHAR2(1000)
);

-- 9. Medications table
CREATE TABLE medications (
    medication_id NUMBER PRIMARY KEY,
    name VARCHAR2(100) ,
    description VARCHAR2(200),
    dosage VARCHAR2(50),
    cost_per_unit NUMBER(10,2) ,
    stock_quantity NUMBER ,
    supplier VARCHAR2(100)
);

-- 10. Prescriptions table
CREATE TABLE prescriptions (
    prescription_id NUMBER PRIMARY KEY,
    record_id NUMBER ,
    medication_id NUMBER ,
    dosage VARCHAR2(50) ,
    frequency VARCHAR2(100) ,
    duration VARCHAR2(100) ,
    instructions VARCHAR2(200)
);

-- Additional tables
CREATE TABLE job_grades (
    grade_level VARCHAR2(2) PRIMARY KEY,
    lowest_sal NUMBER(10,2) ,
    highest_sal NUMBER(10,2) ,
    description VARCHAR2(100)
);

CREATE TABLE job_history (
    employee_id NUMBER ,
    start_date DATE ,
    end_date DATE ,
    job_title VARCHAR2(10) ,
    department_id NUMBER
);

--***************************************************************
--                        All inserts
--***************************************************************
-- Departments
INSERT INTO departments VALUES (dept_seq.nextval, 'Emergency', 'Building A, Ground Floor', NULL, '24/7 emergency care');
INSERT INTO departments VALUES (dept_seq.nextval, 'Cardiology', 'Building B, 1st Floor', NULL, 'Heart care');
INSERT INTO departments VALUES (dept_seq.nextval, 'Pediatrics', 'Building A, 2nd Floor', NULL, 'Child healthcare');
INSERT INTO departments VALUES (dept_seq.nextval, 'Maternity', 'Building C, Ground Floor', NULL, 'Prenatal care');
INSERT INTO departments VALUES (dept_seq.nextval, 'Surgery', 'Building B, 2nd Floor', NULL, 'General surgeries');
INSERT INTO departments VALUES (dept_seq.nextval, 'Internal Medicine', 'Building A, 1st Floor', NULL, 'Adult medicine');
INSERT INTO departments VALUES (dept_seq.nextval, 'Orthopedics', 'Building D, 1st Floor', NULL, 'Bone care');
INSERT INTO departments VALUES (dept_seq.nextval, 'Radiology', 'Building E, Ground Floor', NULL, 'Diagnostic imaging');

-- Doctors
INSERT INTO doctors VALUES (doctor_seq.nextval, 'Ahmed', 'Mohamed', 'Male', TO_DATE('1975-03-15', 'YYYY-MM-DD'), '+252612345678', 'ahmed.m@hospital.so', 'Cardiology', 2, TO_DATE('2010-05-10', 'YYYY-MM-DD'), 5000, '123 Hodan', 'Mogadishu');
INSERT INTO doctors VALUES (doctor_seq.nextval, 'Aisha', 'Abdi', 'Female', TO_DATE('1980-07-22', 'YYYY-MM-DD'), '+252612345679', 'aisha.a@hospital.so', 'Pediatrics', 3, TO_DATE('2012-08-15', 'YYYY-MM-DD'), 4500, '456 Howlwadaag', 'Mogadishu');
INSERT INTO doctors VALUES (doctor_seq.nextval, 'Omar', 'Hassan', 'Male', TO_DATE('1978-11-05', 'YYYY-MM-DD'), '+252612345680', 'omar.h@hospital.so', 'Emergency', 1, TO_DATE('2008-03-20', 'YYYY-MM-DD'), 4800, '789 Wadajir', 'Mogadishu');
INSERT INTO doctors VALUES (doctor_seq.nextval, 'Fadumo', 'Ali', 'Female', TO_DATE('1985-02-18', 'YYYY-MM-DD'), '+252612345681', 'fadumo.a@hospital.so', 'Obstetrics', 4, TO_DATE('2015-06-10', 'YYYY-MM-DD'), 4700, '321 Yaqshid', 'Mogadishu');
INSERT INTO doctors VALUES (doctor_seq.nextval, 'Mohamed', 'Farah', 'Male', TO_DATE('1972-09-30', 'YYYY-MM-DD'), '+252612345682', 'mohamed.f@hospital.so', 'Surgery', 5, TO_DATE('2005-01-15', 'YYYY-MM-DD'), 5200, '654 Hamar', 'Mogadishu');
INSERT INTO doctors VALUES (doctor_seq.nextval, 'Hawa', 'Isse', 'Female', TO_DATE('1983-04-25', 'YYYY-MM-DD'), '+252612345683', 'hawa.i@hospital.so', 'Medicine', 6, TO_DATE('2014-09-05', 'YYYY-MM-DD'), 4600, '987 Shibis', 'Mogadishu');
INSERT INTO doctors VALUES (doctor_seq.nextval, 'Abdi', 'Nur', 'Male', TO_DATE('1970-12-12', 'YYYY-MM-DD'), '+252612345684', 'abdi.n@hospital.so', 'Orthopedics', 7, TO_DATE('2003-07-22', 'YYYY-MM-DD'), 5100, '147 Karan', 'Mogadishu');
INSERT INTO doctors VALUES (doctor_seq.nextval, 'Sahra', 'Mohamud', 'Female', TO_DATE('1982-06-08', 'YYYY-MM-DD'), '+252612345685', 'sahra.m@hospital.so', 'Radiology', 8, TO_DATE('2013-04-18', 'YYYY-MM-DD'), 4900, '258 Daynile', 'Mogadishu');

-- Update department heads
UPDATE departments SET head_doctor_id = 1 WHERE department_id = 2;
UPDATE departments SET head_doctor_id = 2 WHERE department_id = 3;
UPDATE departments SET head_doctor_id = 3 WHERE department_id = 1;
UPDATE departments SET head_doctor_id = 4 WHERE department_id = 4;
UPDATE departments SET head_doctor_id = 5 WHERE department_id = 5;
UPDATE departments SET head_doctor_id = 6 WHERE department_id = 6;
UPDATE departments SET head_doctor_id = 7 WHERE department_id = 7;
UPDATE departments SET head_doctor_id = 8 WHERE department_id = 8;

-- Patients
INSERT INTO patients VALUES (patient_seq.nextval, 'Hassan', 'Ali', 'Male', TO_DATE('1980-05-15', 'YYYY-MM-DD'), '+252611234567', '123 Hodan', 'Mogadishu', 'A+', 'Amina Ali', '+252611234568', SYSDATE-30);
INSERT INTO patients VALUES (patient_seq.nextval, 'Fatima', 'Mohamed', 'Female', TO_DATE('1992-08-22', 'YYYY-MM-DD'), '+252611234569', '456 Howlwadaag', 'Mogadishu', 'B-', 'Omar Mohamud', '+252611234570', SYSDATE-25);
INSERT INTO patients VALUES (patient_seq.nextval, 'Abdi', 'Hussein', 'Male', TO_DATE('1975-11-10', 'YYYY-MM-DD'), '+252611234571', '789 Wadajir', 'Mogadishu', 'O+', 'Halima Abdi', '+252611234572', SYSDATE-20);
INSERT INTO patients VALUES (patient_seq.nextval, 'Amina', 'Ahmed', 'Female', TO_DATE('1988-03-30', 'YYYY-MM-DD'), '+252611234573', '321 Yaqshid', 'Mogadishu', 'AB+', 'Mohamed Ahmed', '+252611234574', SYSDATE-18);
INSERT INTO patients VALUES (patient_seq.nextval, 'Mohamed', 'Abdi', 'Male', TO_DATE('1965-07-12', 'YYYY-MM-DD'), '+252611234575', '654 Hamar', 'Mogadishu', 'A-', 'Fadumo Mohamed', '+252611234576', SYSDATE-15);
INSERT INTO patients VALUES (patient_seq.nextval, 'Halima', 'Omar', 'Female', TO_DATE('1995-01-25', 'YYYY-MM-DD'), '+252611234577', '987 Shibis', 'Mogadishu', 'B+', 'Ali Omar', '+252611234578', SYSDATE-12);
INSERT INTO patients VALUES (patient_seq.nextval, 'Omar', 'Farah', 'Male', TO_DATE('1982-09-08', 'YYYY-MM-DD'), '+252611234579', '147 Karan', 'Mogadishu', 'O-', 'Asha Farah', '+252611234580', SYSDATE-10);
INSERT INTO patients VALUES (patient_seq.nextval, 'Fadumo', 'Nur', 'Female', TO_DATE('1978-12-17', 'YYYY-MM-DD'), '+252611234581', '258 Daynile', 'Mogadishu', 'A+', 'Yusuf Nur', '+252611234582', SYSDATE-8);

-- Rooms
INSERT INTO rooms VALUES (room_seq.nextval, 'A101', 'Emergency Room', 1, 4, 'Available');
INSERT INTO rooms VALUES (room_seq.nextval, 'A102', 'Emergency Room', 1, 4, 'Available');
INSERT INTO rooms VALUES (room_seq.nextval, 'B201', 'Cardiology Ward', 2, 2, 'Available');
INSERT INTO rooms VALUES (room_seq.nextval, 'B202', 'Cardiology Ward', 2, 2, 'Available');
INSERT INTO rooms VALUES (room_seq.nextval, 'A301', 'Pediatric Ward', 3, 3, 'Available');
INSERT INTO rooms VALUES (room_seq.nextval, 'C101', 'Delivery Room', 4, 1, 'Available');
INSERT INTO rooms VALUES (room_seq.nextval, 'B301', 'Operating Room', 5, 1, 'Available');
INSERT INTO rooms VALUES (room_seq.nextval, 'A201', 'Exam Room', 6, 1, 'Available');

-- Employees
INSERT INTO employees VALUES (emp_seq.nextval, 'Abdullahi', 'Hassan', 'Male', TO_DATE('1985-04-12', 'YYYY-MM-DD'), '+252612345700', 'abdullahi.h@hospital.so', 'Nurse', 1, TO_DATE('2015-03-10', 'YYYY-MM-DD'), 2500, '123 Hodan', 'Mogadishu', 0.07, NULL);
INSERT INTO employees VALUES (emp_seq.nextval, 'Hodan', 'Mohamed', 'Female', TO_DATE('1990-07-25', 'YYYY-MM-DD'), '+252612345701', 'hodan.m@hospital.so', 'Nurse', 2, TO_DATE('2016-05-15', 'YYYY-MM-DD'), 2400, '456 Howlwadaag', 'Mogadishu', 0.07, 1);
INSERT INTO employees VALUES (emp_seq.nextval, 'Mohamud', 'Abdi', 'Male', TO_DATE('1982-11-08', 'YYYY-MM-DD'), '+252612345702', 'mohamud.a@hospital.so', 'Lab Tech', 8, TO_DATE('2014-08-20', 'YYYY-MM-DD'), 2600, '789 Wadajir', 'Mogadishu', NULL, 1);
INSERT INTO employees VALUES (emp_seq.nextval, 'Fartun', 'Ali', 'Female', TO_DATE('1988-02-14', 'YYYY-MM-DD'), '+252612345703', 'fartun.a@hospital.so', 'Radiology Tech', 8, TO_DATE('2017-06-12', 'YYYY-MM-DD'), 2700, '321 Yaqshid', 'Mogadishu', NULL, 1);
INSERT INTO employees VALUES (emp_seq.nextval, 'Ahmed', 'Osman', 'Male', TO_DATE('1975-09-30', 'YYYY-MM-DD'), '+252612345704', 'ahmed.o@hospital.so', 'Pharmacist', 5, TO_DATE('2010-04-05', 'YYYY-MM-DD'), 3000, '654 Hamar', 'Mogadishu', 0.10, NULL);
INSERT INTO employees VALUES (emp_seq.nextval, 'Amina', 'Farah', 'Female', TO_DATE('1992-12-18', 'YYYY-MM-DD'), '+252612345705', 'amina.f@hospital.so', 'Receptionist', NULL, TO_DATE('2018-09-10', 'YYYY-MM-DD'), 1800, '987 Shibis', 'Mogadishu', 0.05, 5);
INSERT INTO employees VALUES (emp_seq.nextval, 'Yasin', 'Nur', 'Male', TO_DATE('1980-06-22', 'YYYY-MM-DD'), '+252612345706', 'yasin.n@hospital.so', 'Janitor', NULL, TO_DATE('2012-11-15', 'YYYY-MM-DD'), 1500, '147 Karan', 'Mogadishu', NULL, 5);
INSERT INTO employees VALUES (emp_seq.nextval, 'Habibo', 'Isse', 'Female', TO_DATE('1987-03-05', 'YYYY-MM-DD'), '+252612345707', 'habibo.i@hospital.so', 'Nurse', 3, TO_DATE('2016-07-20', 'YYYY-MM-DD'), 2400, '258 Daynile', 'Mogadishu', 0.07, 1);
INSERT INTO employees VALUES (emp_seq.nextval, 'Abdirashid', 'Adan', 'Male', TO_DATE('1978-08-19', 'YYYY-MM-DD'), '+252612345708', 'abdirashid.adan@hospital.so', 'ICU Nurse', 7, TO_DATE('2013-05-12', 'YYYY-MM-DD'), 2800, '369 Waberi District', 'Mogadishu',0.03, NULL);
INSERT INTO employees VALUES (emp_seq.nextval, 'Zahra', 'Ibrahim', 'Female', TO_DATE('1991-01-28', 'YYYY-MM-DD'), '+252612345709', 'zahra.ibrahim@hospital.so', 'Midwife', 4, TO_DATE('2017-10-05', 'YYYY-MM-DD'), 2500, '753 Hiliwaa District', 'Mogadishu',0.07, 2);
INSERT INTO employees VALUES (emp_seq.nextval, 'Mukhtar', 'Hussein', 'Male', TO_DATE('1983-07-15', 'YYYY-MM-DD'), '+252612345710', 'mukhtar.hussein@hospital.so', 'Surgical Technician', 5, TO_DATE('2015-12-18', 'YYYY-MM-DD'), 2900, '852 Karaan District', 'Mogadishu',0.15, NULL);
INSERT INTO employees VALUES (emp_seq.nextval, 'Fowsiya', 'Mohamud', 'Female', TO_DATE('1989-10-10', 'YYYY-MM-DD'), '+252612345711', 'fowsiya.mohamud@hospital.so', 'Physical Therapist', 7, TO_DATE('2018-04-22', 'YYYY-MM-DD'), 2600, '963 Bondhere District', 'Mogadishu',null, NULL);
INSERT INTO employees VALUES (emp_seq.nextval, 'Abdiwali', 'Ahmed', 'Male', TO_DATE('1970-04-30', 'YYYY-MM-DD'), '+252612345712', 'abdiwali.ahmed@hospital.so', 'IT Specialist', NULL, TO_DATE('2011-08-15', 'YYYY-MM-DD'), 3200, '147 Hodan District', 'Mogadishu',0.07, 3);
INSERT INTO employees VALUES (emp_seq.nextval, 'Hamdi', 'Yusuf', 'Female', TO_DATE('1993-05-17', 'YYYY-MM-DD'), '+252612345713', 'hamdi.yusuf@hospital.so', 'Medical Records Clerk', NULL, TO_DATE('2019-02-10', 'YYYY-MM-DD'), 2000, '258 Howlwadaag', 'Mogadishu',0.09, NULL);
INSERT INTO employees VALUES (emp_seq.nextval, 'Jama', 'Abukar', 'Male', TO_DATE('1981-12-24', 'YYYY-MM-DD'), '+252612345714', 'jama.abukar@hospital.so', 'Security Officer', NULL, TO_DATE('2014-06-30', 'YYYY-MM-DD'), 1700, '369 Wadajir District', 'Mogadishu',0.11, 6);
INSERT INTO employees VALUES (emp_seq.nextval, 'Ali', 'Geedi', 'Male', TO_DATE('1970-04-30', 'YYYY-MM-DD'), '+252615778899', 'ali.geedi@hospital.so', 'IT Specialist', 3, TO_DATE('2011-08-15', 'YYYY-MM-DD'), 4000, '147 Hodan District', 'Mogadishu',0.07, 3);

-- Appointments
INSERT INTO appointments VALUES (appt_seq.nextval, 1, 3, TO_TIMESTAMP('2023-06-01 09:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Chest pain', 'Completed', 'Patient complained of chest pain');
INSERT INTO appointments VALUES (appt_seq.nextval, 2, 2, TO_TIMESTAMP('2023-06-01 10:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'Child checkup', 'Completed', 'Routine pediatric checkup');
INSERT INTO appointments VALUES (appt_seq.nextval, 3, 6, TO_TIMESTAMP('2023-06-02 11:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Diabetes', 'Completed', 'Adjusting insulin');
INSERT INTO appointments VALUES (appt_seq.nextval, 4, 4, TO_TIMESTAMP('2023-06-02 14:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Prenatal', 'Completed', '28 weeks pregnant');
INSERT INTO appointments VALUES (appt_seq.nextval, 5, 1, TO_TIMESTAMP('2023-06-03 08:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'Heart palpitations', 'Completed', 'EKG scheduled');
INSERT INTO appointments VALUES (appt_seq.nextval, 6, 7, TO_TIMESTAMP('2023-06-03 13:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Knee pain', 'Completed', 'Possible meniscus tear');
INSERT INTO appointments VALUES (appt_seq.nextval, 7, 8, TO_TIMESTAMP('2023-06-04 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'X-ray', 'Completed', 'X-ray completed');
INSERT INTO appointments VALUES (appt_seq.nextval, 8, 5, TO_TIMESTAMP('2023-06-04 15:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'Surgery consult', 'Scheduled', NULL);

-- Admissions
INSERT INTO admissions VALUES (admit_seq.nextval, 1, 3, 1, TO_TIMESTAMP('2023-05-15 08:30:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2023-05-17 14:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Heart attack', 'Angioplasty performed', 'Discharged');
INSERT INTO admissions VALUES (admit_seq.nextval, 4, 4, 6, TO_TIMESTAMP('2023-05-20 03:15:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2023-05-22 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Delivery', 'Healthy baby', 'Discharged');
INSERT INTO admissions VALUES (admit_seq.nextval, 6, 7, 7, TO_TIMESTAMP('2023-05-22 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2023-05-24 16:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Knee surgery', 'Arthroscopic repair', 'Discharged');
INSERT INTO admissions VALUES (admit_seq.nextval, 2, 2, 5, TO_TIMESTAMP('2023-05-18 08:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2023-05-20 12:00:00', 'YYYY-MM-DD HH24:MI:SS'),'Pneumonia', 'Antibiotics', 'Discharged');
INSERT INTO admissions VALUES (admit_seq.nextval, 8, 5, 7, TO_TIMESTAMP('2023-06-01 14:30:00', 'YYYY-MM-DD HH24:MI:SS'), NULL, 'Appendicitis', 'Scheduled for surgery', 'Admitted');
INSERT INTO admissions VALUES (admit_seq.nextval, 3, 6, 3, TO_TIMESTAMP('2023-06-03 11:30:00', 'YYYY-MM-DD HH24:MI:SS'), NULL, 'Diabetes', 'Monitoring', 'Admitted');
INSERT INTO admissions VALUES (admit_seq.nextval, 5, 1, 4, TO_TIMESTAMP('2023-06-02 09:00:00', 'YYYY-MM-DD HH24:MI:SS'), NULL, 'Heart condition', 'Monitoring', 'Admitted');
INSERT INTO admissions VALUES (admit_seq.nextval, 7, 8, 8, TO_TIMESTAMP('2023-06-04 18:20:00', 'YYYY-MM-DD HH24:MI:SS'), NULL, 'Fracture', 'X-ray completed', 'Admitted');

-- Medications
INSERT INTO medications VALUES (med_seq.nextval, 'Paracetamol', 'Pain relief', '500mg', 0.50, 1000, 'Somali Pharma');
INSERT INTO medications VALUES (med_seq.nextval, 'Ibuprofen', 'Anti-inflammatory', '400mg', 0.75, 800, 'Somali Pharma');
INSERT INTO medications VALUES (med_seq.nextval, 'Amoxicillin', 'Antibiotic', '500mg', 1.20, 600, 'Hormuud Pharma');
INSERT INTO medications VALUES (med_seq.nextval, 'Insulin', 'Diabetes', '100 units/ml', 5.00, 200, 'International');
INSERT INTO medications VALUES (med_seq.nextval, 'Atorvastatin', 'Cholesterol', '20mg', 2.50, 400, 'Hormuud Pharma');
INSERT INTO medications VALUES (med_seq.nextval, 'Metformin', 'Diabetes', '850mg', 1.80, 500, 'Somali Pharma');
INSERT INTO medications VALUES (med_seq.nextval, 'Salbutamol', 'Asthma', '100mcg/dose', 3.50, 300, 'International');
INSERT INTO medications VALUES (med_seq.nextval, 'Ciprofloxacin', 'Antibiotic', '500mg', 2.00, 400, 'Hormuud Pharma');

-- Medical records
INSERT INTO medical_records VALUES (record_seq.nextval, 1, 3, TO_TIMESTAMP('2023-05-15 09:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Heart attack', 'Angioplasty', 'Aspirin 81mg daily', 'Stable');
INSERT INTO medical_records VALUES (record_seq.nextval, 4, 4, TO_TIMESTAMP('2023-05-20 04:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Delivery', 'Baby delivered', 'Iron supplements', 'Mother well');
INSERT INTO medical_records VALUES (record_seq.nextval, 6, 7, TO_TIMESTAMP('2023-05-22 11:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'Meniscus tear', 'Surgery', 'Ibuprofen', 'Recovering');
INSERT INTO medical_records VALUES (record_seq.nextval, 2, 2, TO_TIMESTAMP('2023-05-18 09:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Pneumonia', 'Antibiotics', 'Amoxicillin', 'Improving');
INSERT INTO medical_records VALUES (record_seq.nextval, 8, 5, TO_TIMESTAMP('2023-06-01 15:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Appendicitis', 'Scheduled surgery', 'Ciprofloxacin', 'Pre-op');
INSERT INTO medical_records VALUES (record_seq.nextval, 3, 6, TO_TIMESTAMP('2023-06-03 12:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'Diabetes', 'Monitoring', 'Insulin adjustment', 'Stable');
INSERT INTO medical_records VALUES (record_seq.nextval, 5, 1, TO_TIMESTAMP('2023-06-02 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Heart condition', 'Monitoring', 'Atorvastatin', 'Stable');
INSERT INTO medical_records VALUES (record_seq.nextval, 7, 8, TO_TIMESTAMP('2023-06-04 19:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Fracture', 'X-ray done', 'Paracetamol', 'Pain managed');

-- Prescriptions
INSERT INTO prescriptions VALUES (presc_seq.nextval, 7, 8, '81mg', 'Daily', 'Indefinite', 'With food');
INSERT INTO prescriptions VALUES (presc_seq.nextval, 8, 7, '325mg', '3x daily', '3 months', 'With juice');
INSERT INTO prescriptions VALUES (presc_seq.nextval, 6, 1, '400mg', '6 hourly', '7 days', 'With food');
INSERT INTO prescriptions VALUES (presc_seq.nextval, 4, 2, '45mg/kg', '2x daily', '10 days', 'Full course');
INSERT INTO prescriptions VALUES (presc_seq.nextval, 1, 3, '500mg', '2x daily', '7 days', 'With water');
INSERT INTO prescriptions VALUES (presc_seq.nextval, 2, 4, 'Adjust', 'As directed', 'Indefinite', 'Monitor sugar');
INSERT INTO prescriptions VALUES (presc_seq.nextval, 3, 5, '40mg', 'Nightly', 'Indefinite', 'For cholesterol');
INSERT INTO prescriptions VALUES (presc_seq.nextval, 5, 6, '15mg/kg', '6 hourly', 'As needed', 'Pain relief');

-- Job grades
INSERT INTO job_grades VALUES ('A', 1500, 1999, 'Entry-level');
INSERT INTO job_grades VALUES ('B', 2000, 2499, 'Junior staff');
INSERT INTO job_grades VALUES ('C', 2500, 2999, 'Mid-level');
INSERT INTO job_grades VALUES ('D', 3000, 3499, 'Senior staff');
INSERT INTO job_grades VALUES ('E', 3500, 3999, 'Department heads');
INSERT INTO job_grades VALUES ('F', 4000, 4999, 'Senior management');
INSERT INTO job_grades VALUES ('G', 5000, 9999, 'Executive');

-- Job history
INSERT INTO job_history VALUES (1, TO_DATE('2015-03-10', 'YYYY-MM-DD'), TO_DATE('2017-05-15', 'YYYY-MM-DD'), 'NURSE', 1);
INSERT INTO job_history VALUES (1, TO_DATE('2017-05-16', 'YYYY-MM-DD'), TO_DATE('2020-06-14', 'YYYY-MM-DD'), 'SR_NURSE', 1);
INSERT INTO job_history VALUES (3, TO_DATE('2014-08-20', 'YYYY-MM-DD'), TO_DATE('2016-12-31', 'YYYY-MM-DD'), 'LAB_ASST', 9);
INSERT INTO job_history VALUES (5, TO_DATE('2010-04-05', 'YYYY-MM-DD'), TO_DATE('2015-08-20', 'YYYY-MM-DD'), 'PHARM_ASST', 10);
INSERT INTO job_history VALUES (8, TO_DATE('2016-07-20', 'YYYY-MM-DD'), TO_DATE('2018-12-31', 'YYYY-MM-DD'), 'NURSE', 3);
INSERT INTO job_history VALUES (2, TO_DATE('2016-05-15', 'YYYY-MM-DD'), TO_DATE('2018-06-20', 'YYYY-MM-DD'), 'NURSE', 2);
INSERT INTO job_history VALUES (4, TO_DATE('2017-06-12', 'YYYY-MM-DD'), TO_DATE('2019-07-15', 'YYYY-MM-DD'), 'RAD_TECH', 8);
INSERT INTO job_history VALUES (7, TO_DATE('2018-09-10', 'YYYY-MM-DD'), TO_DATE('2020-10-12', 'YYYY-MM-DD'), 'RECEPTION', NULL);

COMMIT;

--***************************************************************
--                        about tables
--***************************************************************
SELECT * FROM departments;
SELECT * FROM doctors;
SELECT * FROM job_history;
SELECT * FROM job_grades;
SELECT * FROM medications;
SELECT * FROM rooms;
SELECT * FROM patients;
SELECT * FROM employees;
SELECT * FROM medical_records;
SELECT * FROM prescriptions;
SELECT * FROM admissions;
SELECT * FROM appointments;

drop table departments;
drop table job_history;
drop table job_grades;
drop table prescriptions;
drop table medications;
drop table medical_records;
drop table employees;
drop table admissions;
drop table appointments;
drop table rooms;
drop table patients;
drop table doctors;

select * from tabs;


--***************************************************************
--                        constraints
--***************************************************************
-- Add constraints after tables are created
ALTER TABLE departments ADD CONSTRAINT fk_head_doctor 
FOREIGN KEY (head_doctor_id) REFERENCES doctors(doctor_id);

ALTER TABLE doctors ADD CONSTRAINT fk_dept 
FOREIGN KEY (department_id) REFERENCES departments(department_id);

ALTER TABLE rooms ADD CONSTRAINT fk_room_dept 
FOREIGN KEY (department_id) REFERENCES departments(department_id);

ALTER TABLE appointments ADD CONSTRAINT fk_appt_patient 
FOREIGN KEY (patient_id) REFERENCES patients(patient_id);

ALTER TABLE appointments ADD CONSTRAINT fk_appt_doctor 
FOREIGN KEY (doctor_id) REFERENCES doctors(doctor_id);

ALTER TABLE admissions ADD CONSTRAINT fk_admit_patient 
FOREIGN KEY (patient_id) REFERENCES patients(patient_id);

ALTER TABLE admissions ADD CONSTRAINT fk_admit_doctor 
FOREIGN KEY (admitting_doctor_id) REFERENCES doctors(doctor_id);

ALTER TABLE admissions ADD CONSTRAINT fk_admit_room 
FOREIGN KEY (room_id) REFERENCES rooms(room_id);

ALTER TABLE employees ADD CONSTRAINT fk_emp_dept 
FOREIGN KEY (department_id) REFERENCES departments(department_id);

ALTER TABLE medical_records ADD CONSTRAINT fk_record_patient 
FOREIGN KEY (patient_id) REFERENCES patients(patient_id);

ALTER TABLE medical_records ADD CONSTRAINT fk_record_doctor 
FOREIGN KEY (doctor_id) REFERENCES doctors(doctor_id);

ALTER TABLE prescriptions ADD CONSTRAINT fk_prescription_record 
FOREIGN KEY (record_id) REFERENCES medical_records(record_id);

ALTER TABLE prescriptions ADD CONSTRAINT fk_prescription_med 
FOREIGN KEY (medication_id) REFERENCES medications(medication_id);

ALTER TABLE job_history ADD CONSTRAINT fk_jh_employee 
FOREIGN KEY (employee_id) REFERENCES employees(employee_id);

ALTER TABLE job_history ADD CONSTRAINT fk_jh_department 
FOREIGN KEY (department_id) REFERENCES departments(department_id);

-- Check constraints
ALTER TABLE doctors ADD CONSTRAINT ck_doctor_gender 
CHECK (gender IN ('Male', 'Female'));

ALTER TABLE patients ADD CONSTRAINT ck_patient_gender 
CHECK (gender IN ('Male', 'Female'));

ALTER TABLE employees ADD CONSTRAINT ck_employee_gender 
CHECK (gender IN ('Male', 'Female'));

ALTER TABLE rooms ADD CONSTRAINT ck_room_status 
CHECK (status IN ('Available', 'Occupied', 'Maintenance'));

ALTER TABLE appointments ADD CONSTRAINT ck_appt_status 
CHECK (status IN ('Scheduled', 'Completed', 'Cancelled', 'No-Show'));

ALTER TABLE admissions ADD CONSTRAINT ck_admit_status 
CHECK (status IN ('Admitted', 'Discharged', 'Transferred'));

ALTER TABLE job_history ADD CONSTRAINT chk_jh_dates 
CHECK (end_date > start_date);

-- Unique constraints
ALTER TABLE departments ADD CONSTRAINT dept_name_unique 
UNIQUE (department_name);

ALTER TABLE rooms ADD CONSTRAINT room_num_unique 
UNIQUE (room_number);

--***************************************************************
--                        sequence and indexes
--***************************************************************
-- Sequences for auto-incrementing IDs
CREATE SEQUENCE dept_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE doctor_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE patient_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE room_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE appt_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE admit_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE emp_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE record_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE med_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE presc_seq START WITH 1 INCREMENT BY 1;

-- Indexes for performance
CREATE INDEX idx_doctor_dept ON doctors(department_id);
CREATE INDEX idx_patient_name ON patients(last_name, first_name);
CREATE INDEX idx_appt_date ON appointments(appointment_date);
CREATE INDEX idx_admit_patient ON admissions(patient_id);
CREATE INDEX idx_admit_date ON admissions(admission_date);
CREATE INDEX idx_emp_dept ON employees(department_id);
CREATE INDEX idx_record_patient ON medical_records(patient_id);
CREATE INDEX idx_med_name ON medications(name);

--***************************************************************
--                        droping constraints
--***************************************************************
-- Drop Foreign Key Constraints
ALTER TABLE departments DROP CONSTRAINT fk_head_doctor;
ALTER TABLE doctors DROP CONSTRAINT fk_dept;

ALTER TABLE rooms DROP CONSTRAINT fk_room_dept;
ALTER TABLE rooms DISABLE CONSTRAINT room_num_unique;

ALTER TABLE appointments DROP CONSTRAINT fk_appt_patient;
ALTER TABLE appointments DROP CONSTRAINT fk_appt_doctor;
ALTER TABLE admissions DROP CONSTRAINT fk_admit_patient;
ALTER TABLE admissions DROP CONSTRAINT fk_admit_doctor;
ALTER TABLE admissions DROP CONSTRAINT fk_admit_room;
ALTER TABLE employees DROP CONSTRAINT fk_emp_dept;
ALTER TABLE medical_records DROP CONSTRAINT fk_record_patient;
ALTER TABLE medical_records DROP CONSTRAINT fk_record_doctor;
ALTER TABLE prescriptions DROP CONSTRAINT fk_prescription_record;
ALTER TABLE prescriptions DROP CONSTRAINT fk_prescription_med;
ALTER TABLE job_history DROP CONSTRAINT fk_jh_employee;
ALTER TABLE job_history DROP CONSTRAINT fk_jh_department;

-- Drop Check Constraints
ALTER TABLE doctors DROP CONSTRAINT ck_doctor_gender;
ALTER TABLE patients DROP CONSTRAINT ck_patient_gender;
ALTER TABLE employees DROP CONSTRAINT ck_employee_gender;
ALTER TABLE rooms DROP CONSTRAINT ck_room_status;
ALTER TABLE appointments DROP CONSTRAINT ck_appt_status;
ALTER TABLE admissions DROP CONSTRAINT ck_admit_status;
ALTER TABLE job_history DROP CONSTRAINT chk_jh_dates;

-- Drop Unique Constraints
ALTER TABLE departments DROP CONSTRAINT dept_name_unique;
ALTER TABLE rooms DROP CONSTRAINT room_num_unique;


-- From table: ADMISSIONS
ALTER TABLE ADMISSIONS DROP CONSTRAINT SYS_C007770;
ALTER TABLE ADMISSIONS DROP CONSTRAINT SYS_C007771;

-- From table: APPOINTMENTS
ALTER TABLE APPOINTMENTS DROP CONSTRAINT SYS_C007769;

-- From table: DEPARTMENTS
ALTER TABLE DEPARTMENTS DROP CONSTRAINT SYS_C007727;

-- From table: DOCTORS
ALTER TABLE DOCTORS DROP CONSTRAINT SYS_C007728;
ALTER TABLE DOCTORS DROP CONSTRAINT SYS_C007729;

-- From table: EMPLOYEES
ALTER TABLE EMPLOYEES DROP CONSTRAINT SYS_C007772;
ALTER TABLE EMPLOYEES DROP CONSTRAINT SYS_C007773;

-- From table: MEDICAL_RECORDS
ALTER TABLE MEDICAL_RECORDS DROP CONSTRAINT SYS_C007774;

-- From table: PATIENTS
ALTER TABLE PATIENTS DROP CONSTRAINT SYS_C007766;

-- From table: PRESCRIPTIONS
ALTER TABLE PRESCRIPTIONS DROP CONSTRAINT SYS_C007776;

-- From table: ROOMS
ALTER TABLE ROOMS DROP CONSTRAINT SYS_C007767;
ALTER TABLE ROOMS DROP CONSTRAINT SYS_C007768;
















CREATE TABLE copy_emps (
    employee_id NUMBER PRIMARY KEY,
    first_name VARCHAR2(50) NOT NULL,
    last_name VARCHAR2(50) NOT NULL,
    gender VARCHAR2(10) CHECK (gender IN ('Male', 'Female')),
    birth_date DATE,
    phone_number VARCHAR2(20),
    email VARCHAR2(100),
    job_title VARCHAR2(100) NOT NULL,
    department_id NUMBER,
    hire_date DATE NOT NULL,
    salary NUMBER(10,2),
    address VARCHAR2(200),
    city VARCHAR2(50) DEFAULT 'Mogadishu'
);
INSERT INTO copy_emps (
  employee_id, first_name, last_name, gender, birth_date,
  phone_number, email, job_title, department_id, hire_date,
  salary, address, city
)
SELECT
  employee_id, first_name, last_name, gender, birth_date,
  phone_number, email, job_title, department_id, hire_date,
  salary, address, city
FROM employees;

drop table copy_emps
