 CREATE OR ALTER PROCEDURE REPLYQUERIES (@REPLY_ID   INT,
                                          @DESCRIPTION VARCHAR (90),
                                          @POSTED DATE,
										  @USERID INT,
										  @COMMENTID INT,
                                          @StatementType NVARCHAR(20)='' )
AS
  BEGIN
      IF @StatementType = 'Insert'
        BEGIN
            INSERT INTO  REPLY
                        (REPLY_ID ,
						DESCRIPTION,
                        POSTED,
						USERID,
						COMMENTID
                        )
            VALUES     ( @REPLY_ID,
                         @DESCRIPTION,
						 @POSTED,
						  @USERID,
						   @COMMENTID
						)
        END
        

      IF @StatementType = 'Select'
        BEGIN
            SELECT *
            FROM   REPLY
        END

      IF @StatementType = 'Update'
        BEGIN
            UPDATE REPLY
			
            SET    REPLY_ID = @REPLY_ID,
			      DESCRIPTION = @DESCRIPTION,
                   POSTED = @POSTED,
				   USERID = @USERID,
				   COMMENTID = @COMMENTID
                   
            WHERE  REPLY_ID = @REPLY_ID
        END
      ELSE IF @StatementType = 'Delete'
        BEGIN
            DELETE FROM REPLY
            WHERE  REPLY_ID = @REPLY_ID
        END
  END
  EXECUTE REPLYQUERIES [REPLY_ID,DESCRIPTION,POSTED,USER_ID,COMMENT_ID,StatementType]