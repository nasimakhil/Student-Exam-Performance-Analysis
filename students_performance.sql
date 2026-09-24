create database students_exam_performance;
use students_exam_performance;
CREATE TABLE dim_students (
    student_id VARCHAR(20) PRIMARY KEY,
    age INT,
    gender VARCHAR(20),
    education_level VARCHAR(30),
    school_type VARCHAR(20),
    family_income VARCHAR(20),
    parent_education VARCHAR(30),
    urban_rural VARCHAR(20)
);
CREATE TABLE dim_study_habits (
    student_id VARCHAR(20) PRIMARY KEY,
    study_hours_per_day DECIMAL(4,2),
    self_study_hours DECIMAL(4,2),
    private_tuition TINYINT,
    online_learning_hours DECIMAL(4,2),
    study_consistency VARCHAR(20),
    study_environment VARCHAR(20),
    study_method VARCHAR(30),
    revision_frequency VARCHAR(20),
    practice_tests_completed INT,
    notes_quality VARCHAR(20),
    online_course_hours DECIMAL(4,2),
    educational_app_usage VARCHAR(20),
    FOREIGN KEY (student_id) REFERENCES dim_students(student_id)
);
CREATE TABLE dim_lifestyle (
    student_id VARCHAR(20) PRIMARY KEY,
    sleep_hours DECIMAL(4,2),
    sleep_quality VARCHAR(20),
    daily_screen_time DECIMAL(4,2),
    physical_activity_hours DECIMAL(4,2),
    break_frequency VARCHAR(20),
    stress_level INT,
    motivation_level VARCHAR(20),
    internet_access TINYINT,
    device_availability VARCHAR(20),
    FOREIGN KEY (student_id) REFERENCES dim_students(student_id)
);
CREATE TABLE fact_exam_performance (
    student_id VARCHAR(20) PRIMARY KEY,
    previous_exam_score DECIMAL(5,2),
    previous_gpa DECIMAL(3,2),
    attendance_percentage DECIMAL(5,2),
    assignment_completion_rate DECIMAL(5,2),
    class_participation VARCHAR(20),
    exam_difficulty VARCHAR(20),
    exam_preparation_days INT,
    questions_attempted INT,
    questions_correct INT,
    time_management_score DECIMAL(5,2),
    exam_anxiety_level DECIMAL(5,2),
    exam_score DECIMAL(5,2),
    performance_grade VARCHAR(5),
    pass_status VARCHAR(10),
    performance_level VARCHAR(20),
    FOREIGN KEY (student_id) REFERENCES dim_students(student_id)
);
INSERT INTO dim_students
SELECT DISTINCT student_id, age, gender, education_level, school_type,
       family_income, parent_education, urban_rural
FROM students_raw;
INSERT INTO dim_study_habits
SELECT student_id, study_hours_per_day, self_study_hours, private_tuition,
       online_learning_hours, study_consistency, study_environment, study_method,
       revision_frequency, practice_tests_completed, notes_quality,
       online_course_hours, educational_app_usage
FROM students_raw;
INSERT INTO dim_lifestyle
SELECT student_id, sleep_hours, sleep_quality, daily_screen_time,
       physical_activity_hours, break_frequency, stress_level, motivation_level,
       internet_access, device_availability
FROM students_raw;
INSERT INTO fact_exam_performance
SELECT student_id, previous_exam_score, previous_gpa, attendance_percentage,
       assignment_completion_rate, class_participation, exam_difficulty,
       exam_preparation_days, questions_attempted, questions_correct,
       time_management_score, exam_anxiety_level, exam_score, performance_grade,
       pass_status, performance_level
FROM students_raw;
SELECT COUNT(*) FROM dim_students;
SELECT COUNT(*) FROM fact_exam_performance;
SELECT s.gender, s.school_type, AVG(f.exam_score) AS avg_score
FROM dim_students s
JOIN fact_exam_performance f ON s.student_id = f.student_id
GROUP BY s.gender, s.school_type;
SELECT
  (SELECT COUNT(*) FROM dim_students) AS dim_students,
  (SELECT COUNT(*) FROM dim_study_habits) AS dim_study_habits,
  (SELECT COUNT(*) FROM dim_lifestyle) AS dim_lifestyle,
  (SELECT COUNT(*) FROM fact_exam_performance) AS fact_exam_performance;
  SELECT s.gender, s.school_type, AVG(f.exam_score) AS avg_score
FROM dim_students s
JOIN fact_exam_performance f ON s.student_id = f.student_id
GROUP BY s.gender, s.school_type;