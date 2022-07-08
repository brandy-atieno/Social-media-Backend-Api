 CREATE OR ALTER PROCEDURE COMMENTQUERIES (@COMMENT_ID   INT,
                                          @DESCRIPTION VARCHAR (90),
                                          @POSTED DATE,
										  @USERID INT,
										  @POSTID INT,
                                          @StatementType NVARCHAR(20)='' )
AS
  BEGIN
      IF @StatementType = 'Insert'
        BEGIN
            INSERT INTO  COMMENTS
                        (COMMENT_ID ,
						DESCRIPTION,
                        POSTED,
						USERID,
						POSTID
                        )
            VALUES     ( @COMMENT_ID,
                         @DESCRIPTION,
						 @POSTED,
						 @USERID,
						 @POSTID
						)
        END

      IF @StatementType = 'Select'
        BEGIN
            SELECT *
            FROM   COMMENTS
        END

      IF @StatementType = 'Update'
        BEGIN
            UPDATE COMMENTS
			
            SET    COMMENT_ID = @COMMENT_ID,
			      DESCRIPTION = @DESCRIPTION,
                   POSTED = @POSTED,
				    USERID = @USERID,
					 POSTID= @POSTID
                   
            WHERE  COMMENT_ID = @COMMENT_ID
        END
      ELSE IF @StatementType = 'Delete'
        BEGIN
            DELETE FROM COMMENTS
            WHERE  COMMENT_ID = @COMMENT_ID
        END
  END
  EXECUTE COMMENTQUERIES [COMMENT_ID,DESCRIPTION,POSTED,USER_ID,POST_ID,StatementType]