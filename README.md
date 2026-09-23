# 🎓 Student Performance & Attendance Tracker

A comprehensive **SQL (PostgreSQL)** database project that models a college's complete academic ecosystem — students, faculty, courses, enrollments, attendance, and grades. Built to demonstrate strong relational database design and advanced SQL querying skills for real-world academic performance and attendance analysis.

---

## 📌 Table of Contents

- [Overview](#-overview)
- [Database Schema](#️-database-schema)
- [Entity Relationship Design](#-entity-relationship-design)
- [Features & SQL Concepts Covered](#-features--sql-concepts-covered)
- [Key Queries & Use Cases](#-key-queries--use-cases)
- [Tech Stack](#️-tech-stack)
- [Project Structure](#-project-structure)
- [How to Run](#️-how-to-run)
- [Sample Data](#-sample-data)
- [Query Highlights (Detailed)](#-query-highlights-detailed)
- [Future Enhancements](#-future-enhancements)
- [Author](#-author)
- [License](#-license)

---

## 📖 Overview

This project simulates a real-world **College Management System**, designed to help administrators, faculty, and analysts track:

- 🧑‍🎓 Student enrollment and personal details across departments
- 📅 Daily attendance records and attendance percentage trends over time
- 📊 Academic performance through marks and grade analysis
- 🧑‍🏫 Faculty workload, experience, and department-wise distribution
- 🚩 Early identification of at-risk students (low attendance and/or low marks)

The database is built using **PostgreSQL**, following normalized relational design principles with proper primary and foreign key constraints. The accompanying SQL script is organized into 12 progressively advanced sections — from basic CRUD to window functions — making it a strong reference for SQL learners and a practical showcase for recruiters.

---

## 🗂️ Database Schema

The system consists of **7 relational tables**, described in detail below.

### 1. `Departments`
| Column | Type | Description |
|---|---|---|
| `department_id` | INT (PK) | Unique identifier for each department |
| `department_name` | VARCHAR(50) | Name of the department (e.g., Computer Science) |

### 2. `Students`
| Column | Type | Description |
|---|---|---|
| `student_id` | INT (PK) | Unique identifier for each student |
| `name` | VARCHAR(50) | Full name of the student |
| `dob` | DATE | Date of birth |
| `gender` | VARCHAR(50) | Gender of the student |
| `email` | VARCHAR(100) | Contact email (nullable) |
| `phone_number` | VARCHAR(15) | Contact number |
| `address` | VARCHAR(150) | City/residential address |
| `admission_date` | DATE | Date the student was admitted |
| `department_id` | INT (FK) | References `Departments.department_id` |

### 3. `Faculty`
| Column | Type | Description |
|---|---|---|
| `faculty_id` | INT (PK) | Unique identifier for each faculty member |
| `name` | VARCHAR(50) | Full name of the faculty member |
| `email` | VARCHAR(100) | Contact email |
| `phone_number` | VARCHAR(15) | Contact number |
| `experience_years` | INT | Years of teaching experience |
| `department_id` | INT (FK) | References `Departments.department_id` |

### 4. `Courses`
| Column | Type | Description |
|---|---|---|
| `course_id` | INT (PK) | Unique identifier for each course |
| `course_name` | VARCHAR(50) | Name of the course |
| `faculty_id` | INT (FK, nullable) | References `Faculty.faculty_id`; NULL if unassigned |

### 5. `Enrollments`
| Column | Type | Description |
|---|---|---|
| `enrollment_id` | INT (PK) | Unique identifier for each enrollment record |
| `student_id` | INT (FK) | References `Students.student_id` |
| `course_id` | INT (FK) | References `Courses.course_id` |
| `enrollment_date` | DATE | Date the student enrolled in the course |
| — | UNIQUE | `(student_id, course_id)` — prevents duplicate enrollment |

### 6. `Attendance`
| Column | Type | Description |
|---|---|---|
| `attendance_id` | INT (PK) | Unique identifier for each attendance record |
| `student_id` | INT (FK) | References `Students.student_id` |
| `course_id` | INT (FK) | References `Courses.course_id` |
| `attendance_date` | DATE | Date of the attendance entry |
| `status` | VARCHAR(10) | `Present`, `Absent`, or `Late` |

### 7. `Grades`
| Column | Type | Description |
|---|---|---|
| `grade_id` | INT (PK) | Unique identifier for each grade record |
| `student_id` | INT (FK) | References `Students.student_id` |
| `course_id` | INT (FK) | References `Courses.course_id` |
| `marks_obtained` | DECIMAL(5,2) | Numeric marks scored |
| `grade` | VARCHAR(10) | Letter grade (A, B, C, etc.) |

---

## 🔗 Entity Relationship Design

```
Departments (1) ────< (M) Students
Departments (1) ────< (M) Faculty
Faculty     (1) ────< (M) Courses
Students    (M) ────< Enrollments >──── (M) Courses
Students    (1) ────< (M) Attendance >──── (M) Courses
Students    (1) ────< (M) Grades >──── (M) Courses
```

- A **Department** can have many Students and many Faculty members.
- A **Faculty member** can teach many Courses (or none, if unassigned).
- **Enrollments** acts as a bridge table resolving the many-to-many relationship between Students and Courses.
- **Attendance** and **Grades** are both transactional tables tied to a specific student-course pair, enabling time-series and performance analysis.

---

## ✨ Features & SQL Concepts Covered

The SQL script is organized into **12 structured sections**, each demonstrating a core relational database concept:

| # | Section | Concepts Demonstrated |
|---|---|---|
| 1 | **CRUD Operations** | `INSERT`, `UPDATE`, `DELETE` on the `Students` table |
| 2 | **SQL Clauses** | `WHERE`, `ORDER BY`, `LIMIT`, `GROUP BY`, `HAVING` |
| 3 | **SQL Operators** | `AND`, `OR`, `IN`, correlated & nested subqueries |
| 4 | **Sorting & Grouping** | Alphabetical sorting, department/course-wise grouping |
| 5 | **Aggregate Functions** | `COUNT`, `AVG`, `MAX`, `MIN`, `FILTER` clause |
| 6 | **Primary & Foreign Keys** | Referential integrity across all 7 tables |
| 7 | **Joins** | `INNER JOIN`, `LEFT JOIN`, `RIGHT JOIN`, `UNION` |
| 8 | **Subqueries** | Scalar subqueries, `IN`-based filtering, `HAVING` with aggregates |
| 9 | **Date & Time Functions** | `EXTRACT`, `AGE`, `TO_CHAR` for date formatting & calculations |
| 10 | **String Functions** | `UPPER`, `TRIM`, `REPLACE` for text cleaning/transformation |
| 11 | **Window Functions** | `RANK() OVER()`, running/cumulative aggregates with `ROWS BETWEEN` |
| 12 | **CASE Expressions** | Conditional labeling for performance & attendance categories |

---

## 🚀 Key Queries & Use Cases

- 📊 **Attendance risk detection** — Find students with attendance below 75%
- 🏆 **Performance ranking** — Rank all students by marks using `RANK() OVER()`
- 📉 **Cumulative attendance trend** — Running attendance % per course over time using window functions
- 📈 **Enrollment growth trend** — Month-wise cumulative student enrollment
- ⚠️ **At-risk student flagging** — Students with marks < 40 *and* attendance < 50%
- 🥇 **Top performer detection** — Students with marks > 90 *or* 100% attendance
- 🧑‍🏫 **Unassigned faculty check** — Faculty members not currently teaching any course
- 🧑‍🎓 **Unassigned course check** — Courses without any faculty assigned
- 🚫 **Non-enrolled students** — Students who haven't enrolled in any course (`LEFT JOIN ... IS NULL`)
- 🏷️ **Performance labeling** — `CASE`-based classification: "Excellent" / "Good" / "Needs Improvement"
- 🏷️ **Attendance labeling** — `CASE`-based classification: "Regular" / "Irregular" / "Defaulter"
- 🧹 **Data cleaning** — Trimming whitespace from names, masking/replacing email domains

---

## 🛠️ Tech Stack

- **Language:** SQL
- **Database Engine:** PostgreSQL
- **Recommended Tools:** pgAdmin 4, `psql` CLI, DBeaver, or any PostgreSQL-compatible client
- **Concepts:** Relational schema design, normalization, joins, subqueries, window functions

---

## 📁 Project Structure

```
student_performance_attendance_tracker/
│
├── README.md                                      # Project documentation (this file)
└── student_performance_attendance_tracker.sql     # Full schema, seed data & queries
└── student_performance_attendance_tracker_outputs  #outputs of all query 

```

---

## ⚙️ How to Run

1. **Clone the repository**
   ```bash
   git clone https://github.com/vishakhamaisuriya17-hub/student_performance_attendance_tracker_.git
   cd student_performance_attendance_tracker_
   ```

2. **Set up a PostgreSQL database**
   ```bash
   createdb student_tracker
   ```

3. **Run the SQL script**
   - Using `psql`:
     ```bash
     psql -d student_tracker -f student_performance_attendance_tracker.sql
     ```
   - Or open the `.sql` file directly in **pgAdmin** / **DBeaver** and execute it.

4. **Execution order** (handled automatically by the script):
   - Creates all 7 tables with primary/foreign key constraints
   - Inserts realistic seed data (departments, students, faculty, courses, enrollments, attendance, grades)
   - Runs all 12 sections of analytical queries sequentially

5. **Review results** — Each query section is labeled with a comment header (e.g., `-- 5. AGGREGATE FUNCTIONS`) so you can run them individually to explore specific insights.

---

## 📊 Sample Data

The script ships with realistic, ready-to-query seed data:

| Table | Records |
|---|---|
| Departments | 10 (Computer Science, IT, Commerce, Science, Management, Arts, Mathematics, Physics, Chemistry, Biotechnology) |
| Students | 10 students with full profile details |
| Faculty | 10 faculty members with varying experience (2–15 years) |
| Courses | 10 courses (2 unassigned, to test NULL handling) |
| Enrollments | 10 enrollment records |
| Attendance | 20 daily attendance entries across Jan 2026 |
| Grades | 10 grade records with marks and letter grades |

This intentionally includes edge cases — `NULL` emails, unassigned courses/faculty, and varying attendance patterns — to make the analytical queries meaningful and testable.

---

## 🔍 Query Highlights (Detailed)

**Attendance percentage per student**
```sql
SELECT student_id,
       ROUND(100.0 * COUNT(*) FILTER (WHERE status = 'Present') / COUNT(*), 2) AS attendance_percentage
FROM Attendance
GROUP BY student_id
HAVING 100.0 * COUNT(*) FILTER (WHERE status = 'Present') / COUNT(*) < 75;
```
Uses the `FILTER` clause to conditionally count "Present" records, then flags students below a 75% threshold.

**Student rank by marks**
```sql
SELECT s.student_id, s.name, g.marks_obtained,
       RANK() OVER (ORDER BY g.marks_obtained DESC) AS student_rank
FROM Students s
JOIN Grades g ON s.student_id = g.student_id;
```
Demonstrates window functions for competitive ranking without collapsing rows via `GROUP BY`.

**Cumulative attendance trend per course**
```sql
ROUND(
  100.0 * COUNT(*) FILTER (WHERE status = 'Present') OVER (
      PARTITION BY course_id ORDER BY attendance_date, attendance_id
      ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
  ) / COUNT(*) OVER (
      PARTITION BY course_id ORDER BY attendance_date, attendance_id
      ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
  ), 2
) AS cumulative_attendance_percentage
```
A running (cumulative) attendance percentage calculated per course as records progress chronologically.

**Performance categorization**
```sql
CASE
    WHEN marks_obtained > 90 THEN 'Excellent'
    WHEN marks_obtained BETWEEN 75 AND 90 THEN 'Good'
    ELSE 'Needs Improvement'
END AS performance_level
```
Converts raw numeric marks into human-readable performance tiers.

---

## 🔮 Future Enhancements

- 🔁 Add **stored procedures/triggers** to auto-update attendance percentage and grades
- 📊 Build a **dashboard** (Power BI / Python + Streamlit) to visualize query outputs
- 🗓️ Extend schema to support **semesters/academic years** for multi-term tracking
- 🔐 Add **role-based views** (admin, faculty, student) for controlled data access
- 📩 Add **notification logic** (e.g., auto-flag defaulters via a scheduled query/cron job)
- 🧪 Add **unit tests** for data integrity using pgTAP or similar

---

## 👩‍💻 Author

**Vishakha Maisuriya**
📎 GitHub: [@vishakhamaisuriya17-hub](https://github.com/vishakhamaisuriya17-hub)
🔗 Project Repository: [student_performance_attendance_tracker](https://github.com/vishakhamaisuriya17-hub/student_performance_attendance_tracker_.git)

---

## 📄 License

This project is open-source and shared for learning and educational purposes. Feel free to fork, explore, and build upon it.

---

⭐ **If you found this project useful, consider giving it a star on GitHub!**
