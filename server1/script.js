const express = require('express');
const app = express();

const PORT = 4000;
//get method
const studentsRouter = require('./routes/students');

app.use(express.json());
app.use('/students',studentsRouter);

app.listen(PORT,()=>{
    console.log(`Server started at port ${PORT}`);
});