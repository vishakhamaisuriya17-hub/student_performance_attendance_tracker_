create table departments(
	department_id int primary key,
	department_name varchar(50)
);

INSERT INTO Departments VALUES
(1, 'Computer Science'),
(2, 'Information Technology'),
(3, 'Commerce'),
(4, 'Science'),
(5, 'Management'),
(6, 'Arts'),
(7, 'Mathematics'),
(8, 'Physics'),
(9, 'Chemistry'),
(10, 'Biotechnology');


create table students(
	student_id int primary key,
	name varchar(50),
	dob date,
	gender varchar(50),
	email varchar(100),
	phone_number VARCHAR(15),
	address varchar(150),
	admission_date date,
	department_id int,
	foreign key (department_id) references departments(department_id)
	
);

INSERT INTO Students VALUES
(1, '  Rahul Sharma  ', '2003-05-12', 'Male', 'rahul@gmail.com', '9876543210', 'Ahmedabad', '2022-06-15', 1),
(2, 'Priya Patel', '2004-08-20', 'Female', 'priya@gmail.com', '9876543211', 'Surat', '2023-07-10', 2),
(3, 'Amit Shah', '2002-03-15', 'Male', 'amit@gmail.com', '9876543212', 'Vadodara', '2021-06-20', 1),
(4, 'Neha Mehta', '2003-11-25', 'Female', NULL, '9876543213', 'Rajkot', '2022-07-05', 3),
(5, 'Rohan Desai', '2004-01-18', 'Male', 'rohan@gmail.com', '9876543214', 'Ahmedabad', '2023-06-12', 2),
(6, 'Kavya Joshi', '2003-09-10', 'Female', 'kavya@gmail.com', '9876543215', 'Surat', '2022-06-18', 4),
(7, 'Vishal Patel', '2002-12-30', 'Male', 'vishal@gmail.com', '9876543216', 'Bhavnagar', '2021-07-15', 1),
(8, 'Anjali Trivedi', '2004-06-22', 'Female', 'anjali@gmail.com', '9876543217', 'Ahmedabad', '2023-07-20', 5),
(9, 'Karan Shah', '2003-02-14', 'Male', 'karan@gmail.com', '9876543218', 'Rajkot', '2022-06-25', 2),
(10, 'Meera Patel', '2004-10-05', 'Female', 'meera@gmail.com', '9876543219', 'Vadodara', '2023-06-30', 3);


create table faculty(
	faculty_id int primary key,
	name varchar(50),
	email varchar(100),
	phone_number varchar(15),
	experience_years INT,
	department_id int,
	foreign key (department_id) references departments(department_id)
);

INSERT INTO Faculty VALUES
(1, 'Dr. Rajesh Kumar', 'rajesh@gmail.com', '9000000001', 10, 1),
(2, 'Dr. Sneha Patel', 'sneha@gmail.com', '9000000002', 7, 2),
(3, 'Prof. Amit Shah', 'amit.faculty@gmail.com', '9000000003', 3, 3),
(4, 'Dr. Priya Mehta', 'priya.faculty@gmail.com', '9000000004', 12, 4),
(5, 'Prof. Kiran Joshi', 'kiran@gmail.com', '9000000005', 6, 5),
(6, 'Dr. Neel Desai', 'neel@gmail.com', '9000000006', 4, 1),
(7, 'Prof. Rina Shah', 'rina@gmail.com', '9000000007', 8, 2),
(8, 'Dr. Vijay Patel', 'vijay@gmail.com', '9000000008', 2, 3),
(9, 'Prof. Mona Trivedi', 'mona@gmail.com', '9000000009', 15, 4),
(10, 'Dr. Anil Joshi', 'anil@gmail.com', '9000000010', 9, 5);

create table courses(
	course_id int primary key,
	course_name  varchar(50),
	faculty_id int,
	foreign key (faculty_id) references faculty(faculty_id)
);

INSERT INTO Courses VALUES
(101, 'Python Programming', 1),
(102, 'Database Management', 2),
(103, 'Web Development', 3),
(104, 'Data Structures', 1),
(105, 'Computer Networks', 4),
(106, 'Operating Systems', 5),
(107, 'Machine Learning', 6),
(108, 'Software Engineering', 7),
(109, 'Mathematics', NULL),
(110, 'Physics', NULL);


create table enrollments(
	enrollment_id int primary key,
	student_id int,
	course_id int,
	enrollment_date date,
	UNIQUE (student_id, course_id),
	foreign key (student_id) references students(student_id),
	foreign key (course_id) references courses(course_id)
);

INSERT INTO Enrollments VALUES
(1, 1, 101, '2023-06-15'),
(2, 2, 102, '2023-07-10'),
(3, 3, 101, '2023-06-20'),
(4, 4, 103, '2023-07-05'),
(5, 5, 102, '2023-06-12'),
(6, 6, 104, '2023-06-18'),
(7, 7, 101, '2023-07-15'),
(8, 8, 106, '2023-07-20'),
(9, 9, 107, '2023-06-25'),
(10, 10, 108, '2023-06-30');

create table attendance(
	attendance_id int primary key,
	student_id int,
	course_id int,
	attendance_date DATE,
	status varchar(10),
	foreign key (student_id) references students(student_id),
	foreign key (course_id) references courses(course_id)

);

INSERT INTO Attendance VALUES
(1, 1, 101, '2026-01-05', 'Present'),
(2, 1, 101, '2026-01-06', 'Present'),
(3, 1, 101, '2026-01-07', 'Late'),
(4, 1, 101, '2026-01-08', 'Absent'),
(5, 2, 102, '2026-01-05', 'Present'),
(6, 2, 102, '2026-01-06', 'Present'),
(7, 2, 102, '2026-01-07', 'Absent'),
(8, 2, 102, '2026-01-08', 'Absent'),
(9, 3, 101, '2026-01-05', 'Present'),
(10, 3, 101, '2026-01-06', 'Present'),
(11, 3, 101, '2026-01-07', 'Present'),
(12, 3, 101, '2026-01-08', 'Present'),
(13, 4, 103, '2026-01-05', 'Absent'),
(14, 4, 103, '2026-01-06', 'Absent'),
(15, 5, 102, '2026-01-05', 'Present'),
(16, 5, 102, '2026-01-06', 'Late'),
(17, 6, 104, '2026-01-05', 'Present'),
(18, 7, 101, '2026-01-05', 'Absent'),
(19, 8, 106, '2026-01-05', 'Present'),
(20, 9, 107, '2026-01-05', 'Present');

create table grades(
	grade_id int primary key,
	student_id int,
	course_id int,
	marks_obtained DECIMAL(5,2),
	grade varchar(10),
	foreign key (student_id) references students(student_id),
	foreign key (course_id) references courses(course_id)
	
);

INSERT INTO Grades VALUES
(1, 1, 101, 95, 'A'),
(2, 2, 102, 82, 'B'),
(3, 3, 101, 91, 'A'),
(4, 4, 103, 68, 'C'),
(5, 5, 102, 76, 'B'),
(6, 6, 104, 88, 'B'),
(7, 7, 101, 94, 'A'),
(8, 8, 106, 72, 'C'),
(9, 9, 107, 98, 'A'),
(10, 10, 108, 65, 'C');

--SHOW TABLES

SELECT * FROM Departments;
SELECT * FROM Students;
SELECT * FROM Faculty;
SELECT * FROM Courses;
SELECT * FROM Enrollments;
SELECT * FROM Attendance;
SELECT * FROM Grades;


-- 1. CRUD OPERATIONS

INSERT INTO Students values
(11, 'Pooja Shah', '2004-04-12', 'Female', 'pooja@gmail.com', '9876543220', 'Ahmedabad', '2024-06-15', 1);

UPDATE Students
SET address = 'Mumbai',
    email = 'rahul.new@gmail.com'
WHERE student_id = 1;

DELETE FROM Students
WHERE student_id = 11;

SELECT * FROM Students;

-- 2. SQL CLAUSES

SELECT s.*
FROM Students s
JOIN Departments d
ON s.department_id = d.department_id
WHERE d.department_name = 'Computer Science';

SELECT s.student_id, s.name, g.marks_obtained
FROM Students s
JOIN Grades g
ON s.student_id = g.student_id
ORDER BY g.marks_obtained DESC
LIMIT 10;

SELECT student_id,
       ROUND(
           100.0 * COUNT(*) FILTER (WHERE status = 'Present') / COUNT(*),
           2
       ) AS attendance_percentage
FROM Attendance
GROUP BY student_id
HAVING 100.0 * COUNT(*) FILTER (WHERE status = 'Present') / COUNT(*) < 75;

-- 3. SQL OPERATORS

SELECT s.student_id, s.name, g.marks_obtained
FROM Students s
JOIN Grades g
    ON s.student_id = g.student_id
WHERE g.marks_obtained < 40
AND s.student_id IN (
    SELECT student_id
    FROM Attendance
    GROUP BY student_id
    HAVING 100.0 * COUNT(*) FILTER (WHERE status = 'Present') / COUNT(*) < 50
);

SELECT DISTINCT s.student_id, s.name
FROM Students s
LEFT JOIN Grades g
    ON s.student_id = g.student_id
WHERE g.marks_obtained > 90
OR s.student_id IN (
    SELECT student_id
    FROM Attendance
    GROUP BY student_id
    HAVING COUNT(*) FILTER (WHERE status = 'Present') = COUNT(*)
);

SELECT f.faculty_id, f.name
FROM Faculty f
LEFT JOIN Courses c
ON f.faculty_id = c.faculty_id
WHERE c.course_id IS NULL;

-- 4. SORTING & GROUPING

SELECT *
FROM Students
ORDER BY name ASC;

SELECT d.department_name,
COUNT(s.student_id) AS total_students
FROM Departments d
LEFT JOIN Students s
ON d.department_id = s.department_id
GROUP BY d.department_id, d.department_name;

SELECT c.course_name,
AVG(g.marks_obtained) AS average_marks
FROM Courses c
JOIN Grades g
ON c.course_id = g.course_id
GROUP BY c.course_id, c.course_name;

-- 5. AGGREGATE FUNCTIONS

SELECT ROUND(
    100.0 * COUNT(*) FILTER (WHERE status = 'Present') / COUNT(*),
    2
) AS average_attendance_percentage
FROM Attendance;

SELECT c.course_name,
MAX(g.marks_obtained) AS highest_marks,
MIN(g.marks_obtained) AS lowest_marks
FROM Courses c
JOIN Grades g
ON c.course_id = g.course_id
GROUP BY c.course_id, c.course_name;

SELECT d.department_name,
COUNT(s.student_id) AS total_students
FROM Departments d
LEFT JOIN Students s
ON d.department_id = s.department_id
GROUP BY d.department_id, d.department_name;

-- 6. PRIMARY & FOREIGN KEY

SELECT s.name AS student_name,
d.department_name
FROM Students s
JOIN Departments d
ON s.department_id = d.department_id;

-- 7. JOINS

SELECT s.student_id, s.name, d.department_name
FROM Students s
INNER JOIN Departments d
ON s.department_id = d.department_id;

SELECT s.student_id, s.name
FROM Students s
LEFT JOIN Enrollments e
ON s.student_id = e.student_id
WHERE e.enrollment_id IS NULL;

SELECT c.course_id, c.course_name,
f.name AS faculty_name
FROM Faculty f
RIGHT JOIN Courses c
ON f.faculty_id = c.faculty_id
WHERE f.faculty_id IS NULL;

SELECT s.student_id, s.name, e.course_id
FROM Students s
LEFT JOIN Enrollments e
ON s.student_id = e.student_id

UNION

SELECT s.student_id, s.name, e.course_id
FROM Students s
RIGHT JOIN Enrollments e
ON s.student_id = e.student_id;

-- 8. SUBQUERIES

SELECT s.student_id, s.name,
g.marks_obtained
FROM Students s
JOIN Grades g
ON s.student_id = g.student_id
WHERE g.marks_obtained > (
    SELECT AVG(marks_obtained)
    FROM Grades
);

SELECT c.course_id, c.course_name,
f.name AS faculty_name
FROM Courses c
JOIN Faculty f
ON c.faculty_id = f.faculty_id
WHERE f.experience_years >= 5;

SELECT s.student_id, s.name
FROM Students s
JOIN Attendance a
ON s.student_id = a.student_id
WHERE a.status = 'Absent'
GROUP BY s.student_id, s.name
HAVING COUNT(*) > 10;

-- 9. DATE & TIME FUNCTIONS

SELECT attendance_id,
attendance_date,
extract (MONTH from attendance_date) AS attendance_month
FROM Attendance;

SELECT student_id,
       name,
       admission_date,
       EXTRACT(YEAR FROM AGE(CURRENT_DATE, admission_date)) AS years_since_admission
FROM Students;

SELECT attendance_id,
to_char(attendance_date, 'dd-mm-YYYY')
AS formatted_date
FROM Attendance;

-- 10. STRING FUNCTIONS

SELECT faculty_id, UPPER(name) AS faculty_name
FROM Faculty;

SELECT student_id, TRIM(name) AS student_name
FROM Students;

SELECT student_id,
       name,
       REPLACE(email, 'gmail.com', 'example.com') AS email
FROM Students;

-- 11. WINDOW FUNCTIONS

SELECT s.student_id, s.name,
g.marks_obtained,
RANK() OVER (
    ORDER BY g.marks_obtained DESC
) AS student_rank
FROM Students s
JOIN Grades g
ON s.student_id = g.student_id;

SELECT course_id,
       attendance_date,
       status,
       ROUND(
           100.0 * COUNT(*) FILTER (WHERE status = 'Present') OVER (
               PARTITION BY course_id
               ORDER BY attendance_date, attendance_id
               ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
           )
           /
           COUNT(*) OVER (
               PARTITION BY course_id
               ORDER BY attendance_date, attendance_id
               ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
           ),
           2
       ) AS cumulative_attendance_percentage
FROM Attendance
ORDER BY course_id, attendance_date, attendance_id;

SELECT enrollment_month,
       monthly_students,
       SUM(monthly_students) OVER (
           ORDER BY enrollment_month
       ) AS cumulative_students
FROM (
    SELECT TO_CHAR(enrollment_date, 'YYYY-MM') AS enrollment_month,
           COUNT(*) AS monthly_students
    FROM Enrollments
    GROUP BY TO_CHAR(enrollment_date, 'YYYY-MM')
) AS monthly_data
ORDER BY enrollment_month;

-- 12. CASE EXPRESSIONS

SELECT student_id, marks_obtained,
CASE
    WHEN marks_obtained > 90 THEN 'Excellent'
    WHEN marks_obtained BETWEEN 75 AND 90 THEN 'Good'
    ELSE 'Needs Improvement'
END AS performance_level
FROM Grades;

SELECT student_id,
       ROUND(
           100.0 * COUNT(*) FILTER (WHERE status = 'Present') / COUNT(*),
           2
       ) AS attendance_percentage,

       CASE
           WHEN 100.0 * COUNT(*) FILTER (WHERE status = 'Present') / COUNT(*) > 80
               THEN 'Regular'

           WHEN 100.0 * COUNT(*) FILTER (WHERE status = 'Present') / COUNT(*) BETWEEN 50 AND 80
               THEN 'Irregular'

           ELSE 'Defaulter'
       END AS attendance_category

FROM Attendance
GROUP BY student_id;