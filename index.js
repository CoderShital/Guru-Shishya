const mysql = require("mysql2");
require('dotenv').config();

const express = require("express");
const app = express();
const path = require("path");
const ejsMate = require('ejs-mate');
const multer = require("multer");

app.set("views", path.join(__dirname, "views"));
app.set("view engine", "ejs");
app.engine("ejs", ejsMate);
app.use(express.static(path.join(__dirname, "public")));
app.use('/uploads', express.static(path.join(__dirname, 'uploads')));

app.use(express.urlencoded({ extended: true }));

const storage = multer.diskStorage({
    destination: function (req, file, cb) {
        // Ensure the 'uploads' directory exists
        const uploadDir = path.join(__dirname, 'uploads');
        // if (!fs.existsSync(uploadDir)) {
        //     fs.mkdirSync(uploadDir); // Create directory if it doesn't exist
        // }
        cb(null, uploadDir);
    },
    filename: function (req, file, cb) {
        const fileName = Date.now() + path.extname(file.originalname); // Add timestamp and extension
        cb(null, fileName); 
    }
});

const uploads = multer({ storage: storage });


const pass = process.env.PASSWORD;
const db = process.env.DATABASE;
const port1 = process.env.PORT;
const host = process.env.HOST;
const port = 8080;


const connection = mysql.createConnection({
    host: host,
    user: 'root',
    database: db,
    password: pass ,
    port: port1
    
});


app.get("/", (req, res) => {
    res.render("students/home.ejs");
});


app.post("/submit", uploads.single("stu_img"), async(req, res) => {
// console.log(req.body.academic_yr);
        if(!req.file){
            return res.send("No file uploaded!!");
        } 
    const fileName = req.file.filename;                           // The file name saved with timestamp and extension
    const filePath = path.join(__dirname, 'uploads', fileName);   // Full path to the uploaded file
    console.log('File uploaded to:', 'uploads/' + fileName); // Debug log
    const {name, classN, branch, email, rollno, mobile, tg_name, dob, blood_group,academic_yr,yr_of_study} = req.body;

    
    connection.beginTransaction((err)=>{
        if(err){
            return res.status(500).send("Eror in starting transaction(before starting form filling)");
        }
        console.log(tg_name);
        let q1 = 'INSERT INTO student (img_path, img_name, name, classN, branch, email, rollno, mobile, tg_name, dob, blood_group, academic_yr, yr_of_study ) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?)';
        connection.query(q1, [filePath, fileName, name, classN, branch, email, rollno, mobile, tg_name, dob, blood_group,academic_yr, yr_of_study ], (err, results) => {
            if (err) {
                return connection.rollback(()=>{
                    res.status(500).send("Error in inserting into Student Details");
                    console.log(err);

                })
            }
            console.log(academic_yr);
            let id = results.insertId;
            console.log(id);

            const {temp_location, temp_city, temp_pincode, temp_state,  per_location, per_city, per_pincode, per_state} =req.body;
            let q2 = 'INSERT INTO addr(stu_id,temp_location, temp_city, temp_pincode, temp_state,  per_location, per_city, per_pincode, per_state) VALUES(?,?,?,?,?,?,?,?,?)'
            connection.query(q2, [id,temp_location, temp_city, temp_pincode, temp_state,  per_location, per_city, per_pincode, per_state], (err, results)=>{
                if (err) {
                    return connection.rollback(()=>{
                        res.status(500).send("Error in inserting into Address information");
                        console.log(err);

                    });
                }
                const {mo_name, mo_email, mo_occupation, mo_contact,  fa_name, fa_email, occupation, fa_contact} =req.body;
                let q3 = 'INSERT INTO parents(p_id, stu_id, mo_name, mo_email, mo_occupation, mo_contact,  fa_name, fa_email, occupation, fa_contact) VALUES(?,?,?,?,?,?,?,?,?,?)'
                connection.query(q2, [p_id, id, mo_name, mo_email, mo_occupation, mo_contact,  fa_name, fa_email, occupation, fa_contact], (err, results)=>{
                    if (err) {
                        return connection.rollback(()=>{
                            res.status(500).send("Error in inserting into Parents Details");
                            console.log(err);
    
                        });
                    }
                });
                connection.commit((err)=>{
                    if(err){
                        return connection.rollback(()=>{
                            res.status(500).send("Error in commiting transaction");
                            console.log(err);
                        });
                    }
                    res.redirect(`/submit/${id}`);
                });

            });
        });
    });
   

    
});

app.get("/submit/:id", (req, res) => {
    let { id } = req.params;
    console.log(id);

    let q = 'SELECT * FROM student as S INNER JOIN addr as A ON S.stu_id = A.stu_id INNER JOIN parents as P ON  S.stu_id = P.stu_id';
    connection.query(q, [id], (err, result) => {
        if (err) {
            console.error('Error fetching student details:', err);
            return res.status(500).send('Failed to fetch student details.');
        }
        console.log({student:result[0]});
        res.render("students/view", { student: result[0], addr:result[0], parents:result[0] }); // Send the student, addr data to the view - just like we used send object variable with for using it in template.
    });
   
});


app.get("/form", (req, res) => {
    let body = req.params;
    let body1 = req.body;

    res.render("students/form");
})

app.get("/alltg", (req, res) => {
    let q = 'SELECT tg_name FROM tg';
    try {
        connection.query(q, (err, result) => {
            if (err) throw err;
            let alltg = result;
            res.render("students/alltg.ejs", { alltg });
        });
    } catch (err) { console.log(err); }
});

// app.post('/views', (req, res)=>{
//     let q = 'SELECT * FROM student'
//     try{
//         connection.query(q, (err, result)=>{
//             if(err) throw err;
//             let detail = result;
//             console.log(detail);
//             res.render("students/view.ejs",{detail});
//         });
//     }catch(err){console.log(err);}
// })





app.listen(port, () => {
    console.log(`app is listening on the port ${port}`);
});