const { config } = require('dotenv');
const mssql = require('mssql')
const sqlConfig = require('../config/config');
const { user } = require('../config/config');
const poolPromise = require('../config/poolPromise')

const createUser = async (req, res) => {
    let { USER_ID, USERNAME, FIRSTNAME, LASTNAME, EMAIL, PASSWORD, GENDER } = req.body
    let pool = await poolPromise();
    pool.request()
        .input('USER_ID', USER_ID)
        .input('USERNAME', USERNAME)
        .input('FIRSTNAME', FIRSTNAME)
        .input('LASTNAME', LASTNAME)
        .input('EMAIL', EMAIL)
        .input('PASSWORD', PASSWORD)
        .input('GENDER', GENDER)
        .input('StatementType','Insert')
        .execute('dbo.USERDATAQUERIES')
        .then((result) => {
            
            if (result.rowsAffected) {
                console.log(result)
                return res.status(201).json({
                    message: "user added "
                })
            } else {
                return res.status(400).json({
                    message: "error occured"
                })
            }
        })




}
const getUsers = async (req, res) => {
    let pool = await poolPromise()
    pool.query(`select * FROM USERDATA`).then(results => {
        console.log(results.recordset)
        res.json({
            status: 200,
            success: true,
            message: "success",
            results: results.recordset
        })
    }

    )
}




module.exports = { getUsers, createUser}
