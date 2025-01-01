-- CREATE DATABASE TG_FORM;
-- USE TG_FORM;


CREATE TABLE dept(
     dept_id INT  AUTO_INCREMENT PRIMARY KEY ,
     dept_name VARCHAR(70),
     acadmic_yr VARCHAR(20)
);
CREATE INDEX idx_deptName ON dept(dept_name);

CREATE TABLE tg(
     tg_id INT  AUTO_INCREMENT,
     tg_dept VARCHAR(70) NOT NULL,
     tg_name VARCHAR(70) NOT NULL,
     rollno_range VARCHAR(25) NOT NULL,
     PRIMARY KEY(tg_id),
     FOREIGN KEY (tg_dept) REFERENCES dept(dept_name)
 );
 CREATE INDEX idx_tgName ON tg(tg_name);

 CREATE TABLE student(
 stu_id INT  AUTO_INCREMENT,
 name VARCHAR(70) NOT NULL,
 classN VARCHAR(70) NOT NULL,
 branch  VARCHAR(70) NOT NULL,
 email VARCHAR(70) UNIQUE NOT NULL,
 rollno INT NOT NULL,
 mobile INT NOT NULL UNIQUE,
 tg_name VARCHAR(70) NOT NULL,
 dob DATE,
 blood_group VARCHAR(20),
 img_path VARCHAR(255),
 img_name VARCHAR(255),
 yr_of_study ENUM('1', '2', '3', '4') NOT NULL,
 academic_yr VARCHAR(10) NOT NULL,
 PRIMARY KEY(stu_id),
 FOREIGN KEY (tg_name) REFERENCES tg(tg_name),
 FOREIGN KEY (branch) REFERENCES dept(dept_name)
 );

-- CREATE TABLE parents (
-- p_id INT  AUTO_INCREMENT,
-- stu_id INT,
-- mo_name VARCHAR(70) NOT NULL,
-- mo_email  VARCHAR(70),
-- mo_contact INT NOT NULL,
-- mo_occupation VARCHAR(70) NOT NULL,
-- fa_name VARCHAR(70) NOT NULL,
-- fa_email VARCHAR(70),
-- fa_contact INT NOT NULL,
-- occupation VARCHAR(70) NOT NULL,
-- PRIMARY KEY(p_id),
-- FOREIGN KEY (stu_id) REFERENCES student(stu_id)
-- );

-- CREATE TABLE addr(
-- stu_id INT,
-- temp_location VARCHAR(70) NOT NULL,
-- temp_city VARCHAR(70) NOT NULL,
-- temp_pincode INT NOT NULL
-- temp_state VARCHAR(70) NOT NULL,
-- per_location VARCHAR(70) NOT NULL,
-- per_city VARCHAR(70) NOT NULL,
-- per_pincode INT NOT NULL,
-- per_state VARCHAR(70) NOT NULL,
-- FOREIGN KEY (stu_id) REFERENCES student(stu_id)
-- );
USE TG_FORM;

-- CREATE TABLE edu_details(
-- stu_id INT,

-- ssc_area VARCHAR(20),
-- ssc_name VARCHAR(70) NOT NULL,
-- ssc_adm_yr INT,
-- ssc_pass_yr INT,
-- ssc_cent FLOAT NOT NULL,

-- hsc_area VARCHAR(20),
-- hsc_name VARCHAR(70) ,
-- hsc_adm_yr INT,
-- hsc_pass_yr INT,
-- hsc_cent FLOAT NOT NULL,

clg_name VARCHAR(70) NOT NULL,
course_duration VARCHAR(20) NOT NULL,
current_yr INT NOT NULL,
fy_gpa DECIMAL(4, 2) DEFAULT 00.00;
sy_gpa DECIMAL(4, 2) DEFAULT 00.00;
ty_gpa DECIMAL(4, 2) DEFAULT 00.00;
be_gpa DECIMAL(4, 2) DEFAULT 00.00;

-- FOREIGN KEY (stu_id) REFERENCES student(stu_id)
-- );

-- CREATE TABLE sub_info(
-- stu_id INT,
-- theory_atkt VARCHAR(70),
-- pract_atkt VARCHAR(70),
-- fav_sub VARCHAR(70),
-- diff_sub VARCHAR(70),
-- extra_coach_need BOOLEAN DEFAULT 0,
-- needed_sub VARCHAR(200),
-- private_tut BOOLEAN DEFAULT 0,
-- tut_sub VARCHAR(200),
-- FOREIGN KEY (stu_id) REFERENCES student(stu_id)

-- );

-- CREATE TABLE stud_personal(
-- stu_id INT,
-- hobbies VARCHAR(200) NOT NULL,
-- futureplan VARCHAR(250),
-- plan_descrip VARCHAR(256),
-- FOREIGN KEY (stu_id) REFERENCES student(stu_id)
-- );








