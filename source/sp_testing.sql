/** Stored Procedure exercises.
 *
 * @Author André Luis (github.com/devkcud)
 * @Version 1.0.0
 */

/*
	Script actions:
		- Will create database(s): POSTS
		- Will create table(s): POST
*/

/* Initial config */
CREATE DATABASE POSTS;
USE POSTS;

/* Tables */
CREATE TABLE POST (
    ID      INT NOT NULL,
    TITLE   VARCHAR(50),
    MESSAGE VARCHAR(255),
    
    PRIMARY KEY (ID)
);

/* SPs for managing posts */
DELIMITER $$
/* ------------------------------------------------------------------------------------------------------------------ */
	CREATE PROCEDURE CREATE_POST(IN ID INT, IN TITLE VARCHAR(50), IN MESSAGE VARCHAR(255)) BEGIN
		INSERT INTO POST VALUES (ID, TITLE, MESSAGE);
	END;
/* ------------------------------------------------------------------------------------------------------------------ */
	CREATE PROCEDURE DELETE_POST(IN ID INT) BEGIN
		DELETE FROM POST WHERE ID = POST.ID;
	END;
/* ------------------------------------------------------------------------------------------------------------------ */
	CREATE PROCEDURE GET_POST_TITLE(IN ID INT) BEGIN
		SELECT POST.TITLE FROM POST WHERE ID = POST.ID;
	END;
/* ------------------------------------------------------------------------------------------------------------------ */
	CREATE PROCEDURE GET_POST_MESSAGE(IN ID INT) BEGIN
		SELECT POST.MESSAGE FROM POST WHERE ID = POST.ID;
	END;
/* ------------------------------------------------------------------------------------------------------------------ */
	CREATE PROCEDURE SET_POST_TITLE(IN ID INT, IN NEW_TITLE VARCHAR(50)) BEGIN
		UPDATE POST SET POST.TITLE = NEW_TITLE WHERE ID = POST.ID;
	END;
/* ------------------------------------------------------------------------------------------------------------------ */
	CREATE PROCEDURE SET_POST_MESSAGE(IN ID INT, IN NEW_MESSAGE VARCHAR(50)) BEGIN
		UPDATE POST SET POST.MESSAGE = NEW_MESSAGE WHERE ID = POST.ID;
	END;
/* ------------------------------------------------------------------------------------------------------------------ */
$$ DELIMITER ;

/* Managing Posts */
CALL CREATE_POST(1, "Title 1", "Message 1");
CALL CREATE_POST(2, "Title 2", "Message 2");
CALL CREATE_POST(3, "Title 3", "Message 3");
CALL CREATE_POST(4, "Title 4", "Message 4");

CALL DELETE_POST(4);

/* Managing Posts Title */
CALL SET_POST_TITLE(2, "Custom title!");

CALL GET_POST_TITLE(1); /* Expected:    Title 1    */
CALL GET_POST_TITLE(2); /* Expected: Custom title! */
CALL GET_POST_TITLE(3); /* Expected:    Title 3    */
CALL GET_POST_TITLE(4); /* Expected:               */

/* Managing Posts Message */
CALL SET_POST_MESSAGE(2, "Custom message!");

CALL GET_POST_MESSAGE(1); /* Expected:   Message 1   */
CALL GET_POST_MESSAGE(2); /* Expected: Custom title! */
CALL GET_POST_MESSAGE(3); /* Expected:   Message 3   */
CALL GET_POST_MESSAGE(4); /* Expected:               */

/* Deleting Database */
DROP DATABASE POSTS;