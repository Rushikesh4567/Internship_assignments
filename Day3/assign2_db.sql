CREATE DATABASE mydb;
use mydb;
show tables;
show databases;

CREATE TABLE users (
    email VARCHAR(100) PRIMARY KEY,
    password VARCHAR(255) NOT NULL,
    role ENUM('admin', 'student', 'teacher') NOT NULL DEFAULT 'student'
);

select * from users;

CREATE TABLE courses (
    course_id INT PRIMARY KEY AUTO_INCREMENT,
    course_name VARCHAR(255) NOT NULL,
    description VARCHAR(500),
    fees INT NOT NULL,
    start_date DATE,
    end_date DATE,
    video_expire_days INT
);

desc courses;

CREATE TABLE students (
    reg_no INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(100) NOT NULL,
    course_id INT,
    mobile_no INT,
    profile_pic BLOB,

    FOREIGN KEY (email) REFERENCES users(email),
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);

CREATE TABLE videos (
    video_id INT PRIMARY KEY AUTO_INCREMENT,
    course_id INT,
    title VARCHAR(255) NOT NULL,
    description VARCHAR(500),
    youtube_url VARCHAR(500),
    added_at DATE,

    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);

desc videos;
desc students;
ALTER TABLE students MODIFY mobile_no VARCHAR(15);

drop table users;
show databases;
show tables;

select * from users;
select * from courses;
select * from students;
select * from videos;

INSERT INTO users (email, password, role) VALUES
('student1@gmail.com', 'pass1', 'student'),
('student2@gmail.com', 'pass2', 'student'),
('student3@gmail.com', 'pass3', 'student'),
('student4@gmail.com', 'pass4', 'student'),
('student5@gmail.com', 'pass5', 'student'),
('student6@gmail.com', 'pass6', 'student'),
('student7@gmail.com', 'pass7', 'student'),
('student8@gmail.com', 'pass8', 'student'),
('student9@gmail.com', 'pass9', 'student'),
('student10@gmail.com', 'pass10', 'student'),
('teacher2@example.com', 'teachpass2', 'teacher'),
('teacher3@example.com', 'teachpass3', 'teacher');

INSERT INTO courses (course_name, description, fees, start_date, end_date, video_expire_days) VALUES
('Data Structures in C++', 'Complete DSA using C++', 25000, '2025-01-10', '2025-04-10', 60),
('Frontend Mastery', 'HTML, CSS, JS, Responsive Design', 20000, '2025-04-01', '2025-07-01', 30),
('Cyber Security Basics', 'Ethical hacking fundamentals', 40000, '2025-05-15', '2025-08-15', 45),
('SQL & Database Design', 'Learn SQL, Joins, Procedures, Indexing', 15000, '2025-02-10', '2025-04-10', 60),
('AI & Deep Learning', 'Neural Networks, CNN, RNN', 50000, '2025-06-01', '2025-09-01', 90);

INSERT INTO students (name, email, course_id, mobile_no) VALUES
('Amit Kumar', 'student1@gmail.com', 1, '9988776655'),
('Priya Singh', 'student2@gmail.com', 2, '9876501234'),
('Rohit Patil', 'student3@gmail.com', 3, '9988123123'),
('Neha Desai', 'student4@gmail.com', 4, '9123456700'),
('Arjun Reddy', 'student5@gmail.com', 5, '9090901111'),
('Kiran Joshi', 'student6@gmail.com', 1, '9988998899'),
('Sneha Patil', 'student7@gmail.com', 2, '9000001111'),
('Rahul Jain', 'student8@gmail.com', 3, '9123098765'),
('Harsh Mehta', 'student9@gmail.com', 4, '9876543201'),
('Divya Kaur', 'student10@gmail.com', 5, '9812345678');

INSERT INTO videos (course_id, title, description, youtube_url, added_at) VALUES
(1, 'Arrays & Strings', 'Basics of arrays and strings', 'https://youtu.be/arrays', '2025-01-12'),
(1, 'Linked Lists', 'Singly and doubly linked lists', 'https://youtu.be/ll', '2025-01-16'),
(1, 'Binary Trees', 'Tree traversal techniques', 'https://youtu.be/trees', '2025-01-20');

INSERT INTO videos (course_id, title, description, youtube_url, added_at) VALUES
(2, 'HTML Basics', 'HTML structure and tags', 'https://youtu.be/html', '2025-04-02'),
(2, 'CSS Flexbox', 'Modern flexbox layout', 'https://youtu.be/flex', '2025-04-04'),
(2, 'JavaScript DOM', 'DOM manipulation & events', 'https://youtu.be/dom', '2025-04-08');

INSERT INTO videos (course_id, title, description, youtube_url, added_at) VALUES
(3, 'Footprinting Techniques', 'Reconnaissance basics', 'https://youtu.be/recon', '2025-05-18'),
(3, 'Kali Linux Tools', 'Security tools overview', 'https://youtu.be/kali', '2025-05-21'),
(3, 'Wireshark Basics', 'Packet analysis guide', 'https://youtu.be/wireshark', '2025-05-25');

INSERT INTO videos (course_id, title, description, youtube_url, added_at) VALUES
(4, 'SQL Joins', 'Inner/Left/Right joins explained', 'https://youtu.be/joins', '2025-02-12'),
(4, 'Stored Procedures', 'Creating stored procedures', 'https://youtu.be/proc', '2025-02-15'),
(4, 'Database Indexing', 'Clustered and nonclustered indexes', 'https://youtu.be/indexing', '2025-02-20');

INSERT INTO videos (course_id, title, description, youtube_url, added_at) VALUES
(5, 'Neural Networks Intro', 'Basics of neural networks', 'https://youtu.be/nn', '2025-06-03'),
(5, 'Convolutional Networks', 'CNN architecture guide', 'https://youtu.be/cnn', '2025-06-07'),
(5, 'Recurrent Networks', 'RNN and LSTM explained', 'https://youtu.be/rnn', '2025-06-12');

--1 fetch all data
SELECT *
FROM courses
WHERE start_date > CURDATE();


SELECT
    s.reg_no,
    s.name,
    s.email,
    c.course_name
FROM students s
JOIN courses c ON s.course_id = c.course_id;


SELECT
    s.reg_no,
    s.name,
    s.email,
    s.mobile_no,
    c.course_id,
    c.course_name,
    c.description,
    c.fees,
    c.start_date,
    c.end_date,
    c.video_expire_days
FROM students s
JOIN courses c ON s.course_id = c.course_id
WHERE s.email = 'student3@gmail.com';

SELECT
    s.name AS student_name,
    s.email,
    c.course_id,
    c.course_name,
    c.video_expire_days,
    v.video_id,
    v.title AS video_title,
    v.youtube_url,
    v.added_at
FROM students s
JOIN courses c 
    ON s.course_id = c.course_id
JOIN videos v 
    ON c.course_id = v.course_id
WHERE s.email = 'student1@gmail.com'
  AND DATE_ADD(v.added_at, INTERVAL c.video_expire_days DAY) >= '2025-02-01';









