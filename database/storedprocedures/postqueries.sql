CREATE OR ALTER PROCEDURE POSTSQUERIES (@POST_ID   INT,
                                          @DESCRIPTION VARCHAR (90),
                                          @POSTED DATE,
										  @USERID INT,
                                          @StatementType NVARCHAR(20)='' )
AS
  BEGIN
      IF @StatementType = 'Insert'
        BEGIN
            INSERT INTO  POSTS
                        (POST_ID ,
						DESCRIPTION,
                        POSTED ,
						USERID
                        )
            VALUES     ( @POST_ID,
                         @DESCRIPTION,
						 @POSTED,
						 @USERID
						)
        END

      IF @StatementType = 'Select'
        BEGIN
            SELECT *
            FROM   POSTS
        END

      IF @StatementType = 'Update'
        BEGIN
            UPDATE POSTS
			
            SET    POST_ID = @POST_ID,
			      DESCRIPTION = @DESCRIPTION,
                   POSTED = @POSTED,
				   USERID=@USERID
                   
            WHERE  POST_ID = @POST_ID
        END
      ELSE IF @StatementType = 'Delete'
        BEGIN
            DELETE FROM POSTS
            WHERE  POST_ID = @POST_ID
        END
  END
  EXECUTE POSTQUERIES [POST_ID,DESCRIPTION,POSTED,USER_ID,StatementType]