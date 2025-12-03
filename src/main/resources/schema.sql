CREATE TABLE IF NOT EXISTS doctor (
    id BIGSERIAL PRIMARY KEY,
    name VARCHAR(255),
    surname VARCHAR(255),
    proficiency VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS nurse (
    id BIGSERIAL PRIMARY KEY,
    name VARCHAR(255),
    surname VARCHAR(255),
    proficiency VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS patient (
    id BIGSERIAL PRIMARY KEY,
    name VARCHAR(255),
    surname VARCHAR(255),
    email VARCHAR(255),
    complaint TEXT
);

CREATE TABLE IF NOT EXISTS surgery (
    id BIGSERIAL PRIMARY KEY,
    nurse_id BIGINT NOT NULL,
    patient_id BIGINT NOT NULL,
    doctor_id BIGINT NOT NULL,
    CONSTRAINT fk_surgery_nurse   FOREIGN KEY (nurse_id)   REFERENCES nurse(id),
    CONSTRAINT fk_surgery_patient FOREIGN KEY (patient_id) REFERENCES patient(id),
    CONSTRAINT fk_surgery_doctor  FOREIGN KEY (doctor_id)  REFERENCES doctor(id)
);

CREATE TABLE IF NOT EXISTS operation (
    id BIGSERIAL PRIMARY KEY,
    patient_id BIGINT NOT NULL,
    doctor_id BIGINT NOT NULL,
    CONSTRAINT fk_operation_patient FOREIGN KEY (patient_id) REFERENCES patient(id),
    CONSTRAINT fk_operation_doctor  FOREIGN KEY (doctor_id)  REFERENCES doctor(id)
);
