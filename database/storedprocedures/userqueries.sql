 CREATE OR ALTER PROCEDURE USERDATAQUERIES (@USER_ID   INT,
                                          @USERNAME VARCHAR (90),
                                          @FIRSTNAME   VARCHAR(100),
                                          @LASTNAME    VARCHAR(100),
                                          @EMAIL        VARCHAR(100),
                                          @PASSWORD          VARCHAR(70),
										  @GENDER         VARCHAR(100),
                                          @StatementType NVARCHAR(20)='' )
AS
  BEGIN
      IF @StatementType = 'Insert'
        BEGIN
            INSERT INTO USERDATA
                        (USER_ID,
						USERNAME,
                         FIRSTNAME,
                         LASTNAME,
                         EMAIL,
                         PASSWORD,
						 GENDER)
            VALUES     ( @USER_ID,
                         @USERNAME,
						 @FIRSTNAME,
						 @LASTNAME,
                         @EMAIL,
                         @PASSWORD,
                         @GENDER)
        END

      IF @StatementType = 'Select'
        BEGIN
            SELECT *
            FROM   USERDATA
        END

      IF @StatementType = 'Update'
        BEGIN
            UPDATE USERDATA
			
            SET    USERNAME = @USERNAME,
			      FIRSTNAME = @FIRSTNAME,
                   LASTNAME = @LASTNAME,
                   EMAIL = @EMAIL,
                   PASSWORD = @PASSWORD,
				   GENDER = @GENDER
            WHERE  USER_ID = @USER_ID
        END
      ELSE IF @StatementType = 'Delete'
        BEGIN
            DELETE FROM USERDATA
            WHERE  USER_ID = @USER_ID
        END
  END
  EXECUTE USERDATAQUERIES[USER_ID,USERNAME,FIRSTNAME,LASTNAME,EMAIL,PASSWORD,GENDER,StatementType]