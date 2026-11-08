-- Generic educational schema; contains no real people or records.
CREATE TABLE Users (
    UserID INTEGER PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(255) NOT NULL UNIQUE,
    PasswordHash VARCHAR(255) NOT NULL
);

CREATE TABLE Doctors (
    DoctorID INTEGER PRIMARY KEY,
    UserID INTEGER NOT NULL UNIQUE REFERENCES Users(UserID),
    Specialty VARCHAR(100)
);

CREATE TABLE Patients (
    PatientID INTEGER PRIMARY KEY,
    UserID INTEGER NOT NULL UNIQUE REFERENCES Users(UserID),
    Phone VARCHAR(30)
);

CREATE TABLE Appointments (
    AppointmentID INTEGER PRIMARY KEY,
    PatientID INTEGER NOT NULL REFERENCES Patients(PatientID),
    DoctorID INTEGER NOT NULL REFERENCES Doctors(DoctorID),
    StartsAt TIMESTAMP NOT NULL,
    Status VARCHAR(20) NOT NULL
);
