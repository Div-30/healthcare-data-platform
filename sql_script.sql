mysql> CREATE DATABASE bericlinic_db; 

Query OK, 1 row affected (0.01 sec) 

mysql> CREATE TABLE Patient (PatientCode INT PRIMARY KEY AUTO_INCREMENT, firstname VARCHAR(20) NOT NULL, lastname VARCHAR(20), PhoneNumber INT UNIQUE, Date_Of_Birth DATE, GENDER VARCHAR(1), ADDRESS VARCHAR(30) DEFAULT 'ENTER YOUR HOME ADDRESS'); 

Query OK, 0 rows affected (0.05 sec) 

mysql> CREATE TABLE Doctor (DoctorCode INT PRIMARY KEY AUTO_INCREMENT, firstname VARCHAR(20) NOT NULL, lastname VARCHAR(20), Specialization VARCHAR(30) DEFAULT 'Enter your specialization'); 

Query OK, 0 rows affected (0.02 sec) 

mysql> CREATE TABLE Appointment (AppointmentCode INT PRIMARY KEY AUTO_INCREMENT, PatientCode INT, AppointmentDate DATE, AppointmentTime TIME, DoctorCode INT, 

    -> FOREIGN KEY (PatientCode) REFERENCES patient(PatientCode) ON DELETE SET NULL, 

    -> FOREIGN KEY (DoctorCode) REFERENCES Doctor(DoctorCode) ON DELETE SET NULL); 

Query OK, 0 rows affected (0.06 sec) 

mysql> CREATE TABLE Medication (MedicationCode INT PRIMARY KEY AUTO_INCREMENT, MedicationName VARCHAR(30), Dosage VARCHAR(10)         NOT NULL,Notes VARCHAR(40) Default 'Enter Medical Notes'); 

Query OK, 0 rows affected (0.03 sec) 

mysql> CREATE TABLE Prescription (PrescriptionCode INT PRIMARY KEY AUTO_INCREMENT, AppointmentCode INT, MedicationCode INT, Instructions VARCHAR(40) Default 'Enter Instructions'); 

Query OK, 0 rows affected (0.03 sec)
 
mysql> INSERT INTO Patients( firstname, lastname, PhoneNumber, Date_Of_Birth, GENDER, ADDRESS) VALUES  
->( ‘Mugisha’,  ‘Kent’,  788234593,  ‘1997-05-02', ‘M’,  ‘Kigali-Rwanda’), 
->(‘Uwineza’, ‘Chanise’, 792345932, ‘1999-10-29', ‘F’, ‘Muhanga-Rwanda’), 
->(‘Ndengeye’, ‘Pascal’, 793749320, ‘2000-06-15', ‘M’, ‘Musanze-Rwanda’), 
->(‘Maniraguha’, ’Eric’, 787208407, ‘2001-10-09', ‘M’, ‘Kigali-Rwanda’), 
 -> (‘Shimwa’, ‘Teddy’, 792837420, ‘1998-12-10', ‘F’, ‘Kigali-Rwanda’); 
 Query OK, 5 rows affected (0.04 sec) 
Records: 5  Duplicates: 0  Warnings: 0
 
 mysql> INSERT INTO Doctor( firstname, lastname, Specialization) VALUES  
 ->( ‘Muhire’,  ‘Kevin’, ‘DENTIST’), 
 ->(‘Dusenge’, ‘Gisele’, ‘OPTHAMOLOGIST’), 
 ->(‘Musonera’, ‘Regis’, ‘Dermatologist’), 
 ->(‘Marius’, ’Martin’, ‘Cardiologist’), 
 -> (‘Sangwa’, ‘Gladis’, ‘Pediatrician’); 
Query OK, 5 rows affected (0.03 sec) 
 Records: 5  Duplicates: 0  Warnings: 0 

mysql> INSERT INTO Appointment( PatientCode, AppointmentDate, AppointmentTime, DoctorCode) VALUES  
 ->( 3, ‘2024-03-01’, ‘10:30:45’, 1), 
->(1, ‘2024-03-02’, ‘09:10:50’, 2), 
->(2, ‘2024-04-05’, ‘15:03:30’, 3), 
->(4, ‘2024-03-15’, ’13:14:45’, 5), 
 -> (5, ‘2024-05-20’, ‘17:25:35’, 4); 
 Query OK, 5 rows affected (0.02 sec) 
 Records: 5  Duplicates: 0  Warnings: 0 

mysql> INSERT INTO Medication ( MedicationName, Dosage, Notes) VALUES  
->( ‘Parcetamol’, ‘2-2-2’,  ‘Take a medecine for a month’), 
->(‘Ibuprofen’, ‘1-1-1', ‘Take a medecine for a week’), 
->(‘Amoxicillin’, ‘1-1-1', ‘Take this medecine for a month’), 
->(‘Ascoril’, ’1-1-1', ‘Take this medecine for two month’), 
-> (‘Ciprofloxacin’, ‘1-1-1', ‘Take this medecine for a month); 
  Query OK, 5 rows affected (0.02 sec) 
  Records: 5  Duplicates: 0  Warnings: 0 

mysql> INSERT INTO Prescription ( AppointmentCode, MedicationCode, Instructions) VALUES  
->( 2, 4,  ‘Rest for a week and do sports’), 
->(2, 4, ‘Drink 2 liters of water everyday’), 
->(1,  3,  ‘Limit your screen time’), 
->(5, 5,  ‘Stop drinking alcohol’), 
-> (6, 2, ‘Take prescribed medecines on time’); 
   Query OK, 5 rows affected (0.05 sec) 
   Records: 5  Duplicates: 0  Warnings: 0 

mysql> CREATE VIEW DOCTOR_SCHEDULE AS 
-> SELECT CONCAT(d.fname,' ',d.lname) AS `Doctor's Names`,a.AppointmentDate AS `Appointment Date`,a.AppointmentTime AS `Appointment Time`,CONCAT(p.fname,' ',p.lname) AS `Patient's Names` 
-> FROM DOCTOR d 
-> JOIN Appointment a ON d.DoctorID = a.DoctorID 
-> JOIN Patient p ON p.PatientID = a.PatientID; 

Query OK, 0 rows affected (0.01 sec)  

mysql> CREATE VIEW PATIENTS_PRESCRIPTIONS AS 
-> SELECT CONCAT(p.fname,' ',p.lname) AS `Patient's Names`,a.AppointmentDate AS `Appointment Date`,a.AppointmentTime AS `Appointment Time`,m.MedicationName AS `Medication Name`,s.Instructions AS `Doctor's Instructions` 
-> FROM Patient p 
-> JOIN Appointment a ON p.PatientID = a.PatientID 
-> JOIN Prescription s ON s.AppointmentID = a.AppointmentID 
-> JOIN Medication m ON m.MedicationID = s.MedicationID; 

Query OK, 0 rows affected (0.01 sec) 

 

 