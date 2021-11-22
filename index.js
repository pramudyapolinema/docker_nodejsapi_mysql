const express = require('express');
const mysql = require('mysql');

const app = express();

app.listen('4000', () => {
    console.log('Server started on port 4000');
});

const connection = mysql.createConnection({
    host: "localhost",
    user: "root",
    password: "admin",
    database: "dbpus"
});

connection.connect((err) => {
  if (err) {
      console.log(err)
  } else {
      console.log("Database Connected!")
  }
});

app.get('/', function (req, res) {
  connection.query("SELECT * FROM tbanggota", function (err, result, fields) {
    if (err) throw err;
    res.status(200).send(result);
  });
  console.log("Query succeed")
});