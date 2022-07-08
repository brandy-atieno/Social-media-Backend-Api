const express = require("express")
require('dotenv').config()

const bodyparser = require('body-parser');
const blogrouter=require('./routes/BlogRoutes')
const userrouter=require('./routes/UserRoutes')
const port= 5001
const server=express()
server.use(bodyparser.json());
server.use(bodyparser.urlencoded({extended: true}));


server.use('/posts', blogrouter)

server.use('/user', userrouter)





server.listen(port,()=>{
    console.log(`Running at http://localhost:${port}`)
})