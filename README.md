# Student Exam Performance Analysis

An end-to-end data analytics project analyzing student exam performance using **Python, MySQL, and Power BI**.

The project covers the complete analytics workflow, starting with raw student data, followed by data cleaning and preparation in Python, database modeling in MySQL, and interactive dashboard development in Power BI.

## Project Overview

This project analyzes student demographic information, study habits, lifestyle factors, academic performance, and exam-related factors to understand patterns associated with student exam performance.

The dataset contains **100,000 student records and 44 columns** covering areas such as demographics, academic history, study habits, lifestyle, exam preparation, and final performance.

## Tools & Technologies

* **Python**
* **Pandas**
* **Jupyter Notebook**
* **MySQL**
* **SQLAlchemy**
* **Power BI**
* **Microsoft Excel / CSV**

## Project Workflow

```text
Raw CSV Dataset
       ↓
Python / Pandas
       ↓
Data Cleaning & Transformation
       ↓
Cleaned CSV Dataset
       ↓
MySQL Database
       ↓
Data Modeling & SQL Analysis
       ↓
Power BI
       ↓
Interactive Dashboard
```

## 1. Data Preparation & Cleaning

The raw student performance dataset was loaded into Python using Pandas.

The data was inspected for:

* Missing values
* Duplicate student records
* Incorrect data types
* Data consistency

The following cleaning operations were performed:

* Missing `parent_education` values were replaced with `Unknown`
* Missing `attendance_percentage` values were replaced using the median
* Missing `time_management_score` values were replaced using the median
* `private_tuition` and `internet_access` were converted to Boolean values
* Duplicate records based on `student_id` were removed
* The cleaned dataset was exported as `students_cleaned.csv`

The cleaned dataset was then used for the database and Power BI analysis.

## 2. MySQL Database

The cleaned data was loaded into MySQL for structured storage and analysis.

The database was organized into separate tables:

### dim_students

Contains student demographic information such as:

* Student ID
* Age
* Gender
* Education level
* School type
* Family income
* Parent education
* Urban/Rural location

### dim_study_habits

Contains study-related information such as:

* Study hours per day
* Self-study hours
* Private tuition
* Online learning hours
* Study consistency
* Study environment
* Study method
* Revision frequency
* Practice tests
* Notes quality
* Online course hours
* Educational app usage

### dim_lifestyle

Contains lifestyle-related information such as:

* Sleep hours
* Sleep quality
* Daily screen time
* Physical activity
* Break frequency
* Stress level
* Motivation level
* Internet access
* Device availability

### fact_exam_performance

Contains academic and examination information such as:

* Previous exam score
* Previous GPA
* Attendance percentage
* Assignment completion rate
* Class participation
* Exam difficulty
* Exam preparation days
* Questions attempted
* Questions answered correctly
* Time management score
* Exam anxiety level
* Exam score
* Performance grade
* Pass status
* Performance level

The database follows a dimensional structure with student information, study habits, lifestyle information, and exam performance separated into related tables.

## 3. SQL Analysis

SQL queries were used to validate the database and perform basic analysis.

Examples include:

* Counting students in the database
* Checking fact table record counts
* Joining student information with exam performance
* Calculating average exam scores by gender and school type
* Validating table record counts

Example:

```sql
SELECT 
    s.gender,
    s.school_type,
    AVG(f.exam_score) AS avg_score
FROM dim_students s
JOIN fact_exam_performance f
    ON s.student_id = f.student_id
GROUP BY s.gender, s.school_type;
```

## 4. Power BI Dashboard

The cleaned and structured data was connected to Power BI to create an interactive student exam performance dashboard.

The dashboard is designed to explore areas such as:

* Student demographics
* Academic performance
* Study habits
* Lifestyle factors
* Exam preparation
* Pass status
* Performance levels
* Exam scores

Interactive filters and visualizations allow users to explore the dataset from different perspectives.

## Key Areas Analyzed

### Student Demographics

Analysis of:

* Gender
* Age
* Education level
* School type
* Family income
* Parent education
* Urban/Rural location

### Study Habits

Analysis of:

* Study hours
* Self-study hours
* Study consistency
* Study methods
* Revision frequency
* Practice tests
* Private tuition
* Online learning

### Lifestyle

Analysis of:

* Sleep duration
* Sleep quality
* Screen time
* Physical activity
* Stress level
* Motivation
* Internet and device availability

### Exam Performance

Analysis of:

* Previous exam score
* Previous GPA
* Attendance
* Assignment completion
* Exam preparation
* Questions attempted
* Questions answered correctly
* Exam score
* Performance grade
* Pass status
* Performance level

## Project Files

```text
data/
├── student_exam_performance.csv
└── students_cleaned.csv

python/
└── students_exam_performance.ipynb

mysql/
└── students_performance.sql

powerbi/
└── students_performance.pbix

screenshots/
└── Power BI dashboard screenshots

README.md
```

## Skills Demonstrated

* Data Cleaning
* Data Preparation
* Exploratory Data Analysis
* Python
* Pandas
* SQL
* MySQL
* Database Design
* Relational Data Modeling
* Data Validation
* Power BI
* Data Visualization
* Dashboard Development
* End-to-End Data Analytics Workflow

## What I Learned

Through this project, I practiced the complete process of taking a raw dataset and transforming it into a structured analytics solution.

Key learning areas included:

* Cleaning and preparing real-world style datasets using Pandas
* Handling missing values and duplicate records
* Working with Boolean and numerical data types
* Loading cleaned data into MySQL
* Designing related database tables
* Writing SQL queries for analysis and validation
* Connecting structured data to Power BI
* Building interactive dashboards
* Presenting analytical information through visualizations

## Project Outcome

This project demonstrates an end-to-end data analytics workflow:

**Python → MySQL → Power BI**

It combines data cleaning, database management, SQL analysis, and dashboard development into a single portfolio project.

## Author

**Akhil Nasim N**

B.Sc. Computer Science | Aspiring Data Analyst

Skills: Python | Pandas | SQL | MySQL | Power BI | Excel | Data Analysis | Data Visualization
