const router = require("express").Router()
const { getUsers,createUser} = require("../controllers/UserControllers");
const {login}=require('../midddlewares/logger')

router.get('/users',getUsers)
router.post('/signin',login, login)
router.post('/register', createUser)


module.exports=router;    
        
           
      
 