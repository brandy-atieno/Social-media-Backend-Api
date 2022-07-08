

const poolPromise = require('../config/poolPromise')
const login = async (req, res,next) => {
    const { EMAIL, PASSWORD} = req.body
    let pool = await poolPromise()
    pool.query(`select * FROM USERDATA WHERE EMAIL='${EMAIL}'`).then(results => {
        let user = results.recordset[0]
        if (user) {
            let pass = user.PASSWORD
           
            if (PASSWORD === pass )
             {
                return res.json({
                    status: 200,
                    success: true,
                    message: "Logged in successfully",
                    results: user
                    
})
               
 
          }
next()        }            
            else {
                return res.status(401).json({
                    status: 401,
                    success: false,
                    message: "Wrong password",
                    results: {}
                })






            }



        })

    }




module.exports={login}