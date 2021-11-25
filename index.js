const express = require('express');
const mysql = require('mysql2');

const app = express();

app.listen('4000', () => {
    console.log('Server started on port 4000');
});

const connection = mysql.createConnection({
    host: '172.21.0.2',
    user: "pram",
    password: "pram",
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
