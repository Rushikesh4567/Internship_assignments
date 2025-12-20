const express = require('express');
const router = express.Router();
const pool = require('../db');
const createResult = require('../util/result');
 
router.get("/",(request,response)=>{
    sql = "select * from students";

    pool.query(sql,(error,data)=>{
       response.send(createResult(error,data));
    });
    
});

router.post("/",(request,response)=>{
    let {name,email,course} = request.body;
    sql = "insert into students values(?,?,?)";
    pool.query(sql,[name,email,course],(error,data)=>
        {
            response.send(createResult(error,data));
        });
});

router.put("/",(request,response)=>{
    let {name,email,course} = request.body;
    sql = "update students set email=?,course=? where name=?";
    pool.query(sql,[email,course,name],(error,data)=>
        {
            response.send(createResult(error,data));
        });
});

router.delete("/", (request, response) => {
    let { email } = request.body;
    const sql = "delete from students where email=?";

    pool.query(sql, [email], (error, data) => {
        response.send(createResult(error, data));
    });
    
});




module.exports = router;

