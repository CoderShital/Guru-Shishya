-- SET foreign_key_checks = 0;

USE TG_FORM;

INSERT INTO dept
(dept_name, acadmic_yr)
VALUES 
("Computer Science and Engineering", "2024 - 2025"),
("Computer Science and Engineering(Data Science)", "2024 - 2025"),
("Artificial Intelligence and Data Science", "2024 - 2025"),
("Mechanical Engineering", "2024 - 2025"),
("Civil Engineering", "2024 - 2025"),
("Electronics and Telecommunication", "2024 - 2025"),
("Electrical Engineering", "2024 - 2025");

INSERT INTO tg 
 (tg_dept, tg_name, rollno_range)
 VALUES 
 ( "Computer Science and Engineering","Prof. S. S. Mandawale", "1001 - 1040"),
 ("Computer Science and Engineering","Asst.Prof. S. S. Mokase", "1101 - 1140"),
 ("Computer Science and Engineering(Data Science)","Prof. R. D. Wagh", "1141 - 1180"),
 ("Computer Science and Engineering(Data Science)","Prof. A. K. Quadri", "1041 - 1076");

-- INSERT INTO student
-- (name, class, branch, email, rollno, tg_name, mobile,  dob, blood_group)
-- VALUES 
-- ("Kale Shital", "TE-A", "CSE", 'sh@gmail.com',1028, 'S. S. Mandavale',  1020304050,'2000-09-15','B +ve'),
-- ("Halvi Spurthi", "TE-A", "CSE", 'sp@gmail.com',1074, 'A. K. Quadri',  2030405060,'1998-010-15','O -ve'),
-- ("Jadhav Gitanjali", "TE-A", "DS",  'gi@gmail.com', 1026,"S. S. Mandavale",  3030405070,'1999-11-15', 'A +ve');


--not inserted yet
-- INSERT INTO parents 
-- (mo_name, mo_email, mo_contact, mo_occupation, fa_name, fa_email, fa_contact, occupation)
-- VALUES 
-- (),
-- ("Manikarnika Kale", "mnkale@gmail.com",1234567890, "Manager", "Maharana Pratap Kale", "mhrana@gmail.com", 0123654789, "President"),
-- ("Halvi Saraswati", "saras@gmail.com",4574567890, "Designer", "Halvi Vyakatraman", "vyankat@gmail.com", 7894561230, "Mechanic"),
-- ("Jadhav Nishika", "nishi@gmail.com",9992567890, "Manager", "Jadhav Pratap", "kuvar@gmail.com", 9633654789, "Businessman"),
-- ("Rajput Padmavati", "rani@gmail.com",9696567890, "Superviser", "Maharana Pratap Kale", "rana@gmail.com", 7893654789, "Singer"),
-- ("Borade Naina", "naina@gmail.com",9674567890, "Manager", "Borade Manish", "manish@gmail.com", 1223654789, "Goldsmith");

-- INSERT INTO addr 
-- (temp_location,temp_city,temp_state, per_location, per_city, per_state)
-- VALUES 
-- ("cidco", "Mayanager", "Maharashtra", "khuldabad", "khuldabad", "Dehradun"),
-- ("Hudco", "JaybhavaniNagar", "Maharashtra", "HanumanNagar", "SambhajiNagar", "Sikkim"),
-- ("Kranti Chauk", "Osmanpura", "Goa", "Power House", "Aurangpura", "Keral"),
-- ("T.V. Centre", "Padampura", "Uttarakhand", "khuldabad", "khuldabad", "Dehradun"),
-- ("cidco", "Ramnagar", "Maharashtra", "Kamgar Chauk", "Jadhavwadi", "Gujrat");



-- INSERT INTO edu_details 
-- (ssc_area, hsc_area, ssc_name, adm_yr, pass_yr, cent, hsc_name, h_adm_yr, h_pass_yr, h_cent, clg_name, acadmic_yr, current_yr, fy_gpa, sy_gpa, ty_gpa, be_gpa)
-- VALUES 
-- (0,1,"GBVM", 2018, 2019, 87.40, "SPSJC", 2019, 2021, 93.33, "SYCET", 2022, 3, 8.5,8.4,0,0 ),
-- (0,1,"SYPER", 2019, 2020, 87.40, "SPSJC", 2020, 2021, 93.33, "SYCET", 2022, 3, 8.7,8.8,0,0 ),
-- (1,1,"SVS", 2019, 2020, 87.40, "BJS", 2019, 2020, 93.33, "SYCET", 2022, 3, 8.9,8.4,0,0 ),
-- (1,0,"SGES", 2018, 2019, 87.40, "PJC", 2019, 2020, 93.33, "SYCET", 2022, 3, 8.5,8.6,0,0 ),
-- (1,0,"GBVM", 2018, 2019, 87.40, "SPSJC", 2019, 2021, 93.33, "SYCET", 2022, 3, 8.2,8.4,0,0 );


-- INSERT INTO sub_info 
-- (theory_atkt, pract_atkt, fav_sub, diff_sub, extra_coach_need, needed_sub, private_tut, tut_sub)
-- VALUES 
-- ("None", "None", "DBMS, TOC", "SE, BC, HCI", "NO", 0 , "NO", 0 ),
-- ("None", "None", "DBMS, TOC", "SE, BC, HCI", "NO", 0 , "NO", 0 ),
-- ("None", "None", "DBMS, TOC", "SE, BC, HCI", "NO", 0 , "NO", 0 ),
-- ("None", "None", "DBMS, TOC", "SE, BC, HCI", "NO", 0 , "NO", 0 ),
-- ("None", "None", "DBMS, TOC", "SE, BC, HCI", "NO", 0 , "NO", 0 );

-- INSERT INTO stu_personal 
-- (hobbies, futureplan,plan_descrip)
-- VALUES 
-- ("DANCE, SKETCHING", "Product based company mie placement","internship first then PPO"),
-- ("DANCE, SKETCHING", "Product based company mie placement","internship first then PPO"),
-- ("PAINTING, SKETCHING", "service based company mie placement","internship first then PPO"),
-- ("CRICKET, SINGING", "Concert","internship first then stage"),
-- ("SINGING, ACTING", "placement ","internship first then PPO");

