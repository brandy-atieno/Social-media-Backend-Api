const { constants } = require("buffer")
const { config } = require('dotenv');
const mssql = require('mssql')
const sqlConfig = require('../config/config');
const { user } = require('../config/config');
const poolPromise = require('../config/poolPromise')



const getPosts = async (req,res)=>{
    try {
        let pool= await poolPromise();
   const results = pool.query("SELECT * FROM Posts")
    console.log(results.recordset)
    } catch (error) {
        console.log(error.message)
    }
    
}

const createPosts = async (req, res) => {
         let { POST_ID, DESCRIPTION, POSTED,USERID } = req.body
      let pool = await poolPromise();
    
      
    pool.request()
        .input('POST_ID', POST_ID)
        .input('DESCRIPTION', DESCRIPTION)
        .input('POSTED', POSTED)
        .input('USERID', USERID)
        .input('StatementType','Insert')
        .execute('dbo.POSTSQUERIES')
        .then((result) => {
                
                 if (result.rowsAffected )
                 {
                    console.log(result)
                    return res.status(201).json({
                        message: "post added "
                    })
            }
           
                        else {
                return res.status(400).json({
                    message: " You are not logged in"
                })
            }})
        }






const createComments = async(req, res) => {
    let { COMMENT_ID, DESCRIPTION, POSTED ,USERID,POSTID} = req.body
    let pool = await poolPromise();
    
  pool.request()
      .input('COMMENT_ID', COMMENT_ID)
      .input('DESCRIPTION', DESCRIPTION)
      .input('POSTED', POSTED)
      .input('USERID', USERID)
      .input('POSTID', POSTID)
      .input('StatementType','Insert')
      .execute('dbo.COMMENTQUERIES')
      .then((result) => {
          
          if (result.rowsAffected ) {
              console.log(result)
              return res.status(201).json({
                  message: "comment added "
              })
          } else {
              return res.status(400).json({
                  message: "error occured"
              })
          }
      })




}

const createReplies = async (req, res) => {
    let { REPLY_ID, DESCRIPTION, POSTED,USERID,COMMENTID } = req.body
    
    let pool = await poolPromise();

  pool.request()
      .input('REPLY_ID', REPLY_ID)
      .input('DESCRIPTION', DESCRIPTION)
      .input('POSTED', POSTED)
      .input('USERID', USERID)
      .input('COMMENTID', COMMENTID)
      .input('StatementType','Insert')
      .execute('dbo.REPLYQUERIES')
      .then((result) => {
          
          if (result.rowsAffected ) {
              console.log(result)
              return res.status(201).json({
                  message: "reply added "
              })
          } else {
              return res.status(400).json({
                  message: "error occured"
              })
          }
      })





}





module.exports = { getPosts,  createPosts,createComments, createReplies }