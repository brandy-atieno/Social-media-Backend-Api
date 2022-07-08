const router = require("express").Router()
const { getPosts, createComments,createPosts,createReplies} = require("../controllers/BlogControllers");
const {login}=require('../midddlewares/logger')

router.post('/posts',createPosts)
router.get('/',getPosts)
router.post('/comments',createComments)
router.post('/replies', createReplies)




module.exports=router;    
        
           
      
 