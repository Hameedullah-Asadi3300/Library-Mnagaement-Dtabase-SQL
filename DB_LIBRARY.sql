CREATE DATABASE DB_LIBRARY;
USE DB_LIBRARY;

--LIBRARY BRANCH TABLE--
CREATE TABLE librarybranch(
			BranchID INT NOT NULL IDENTITY(101,1),
			BranchName VARCHAR(50),
			BranchAddress VARCHAR(150),
			PRIMARY KEY (BranchID)
);
SELECT * FROM librarybranch;
INSERT INTO librarybranch
(BranchName, BranchAddress)
VALUES
			('Sharpstown Library', '7660 Clareon, TX 77036, Unitwood Dr, Housted States'),
			('Tommy Douglase Library', '7311 Kingsway, Burnaby, BC V5E 1G8'),
			('New Westminster Public Library', '716 6th Avenue, New Westminster, BC V3M 2B3'),
			('Coquitlam Library', '1169 Pinetree Way Coquitlam, BC V3B 0Y'),
			('Lynn Valley Library', '1277 Lynn Valley Rd North Vancouver, BC V7J 0A2'),
			('Cameron Library', '9523 Cameron St. Burnaby, BC V3J 1L6');
			SELECT * FROM librarybranch;
--END--


--BORROWER TABLE--
CREATE TABLE borrower(
			CardNo INT NOT NULL IDENTITY(2545,1),
			FullName VARCHAR(60) NOT NULL,
			BorrowerAddress VARCHAR(150) NOT NULL,
			Phone VARCHAR(50) NOT NULL,
			PRIMARY KEY(CardNo)
);
SELECT * FROM borrower;
INSERT INTO borrower
(FullName, BorrowerAddress, Phone)
VALUES
			('Hameedullah', 'Burnaby, BC, Canada', '604-625-0943'),
			('Ricky Franklin', 'Coquitlam, BC, Canada', '604-905-1345'),
			('Adele Pryor', 'New Westminster, BC, Canada', '784-965-1287'),
			('Mark Coyer', 'Port Moody, BC, Canada', '409-256-1287'),
			('Angela Eckard', 'Richmond, BC, Canada', '604-407-2487'),
			('Michael Anderson', 'North Vancouver', '782-091-3217'),
			('Patrick Penn', 'West Vancouver', '236-555-45-98'),
			('Kim	Goodall', 'Port Coquitlam', '489-453-9834');
SELECT * FROM borrower;
--END--


--BOOKS TABLE--
CREATE TABLE books(
			BookID INT NOT NULL IDENTITY(601,1),
			Title VARCHAR(50) NOT NULL,
			PublisherName VARCHAR(50),
			PRIMARY KEY(BookID),
			FOREIGN KEY (PublisherName) REFERENCES publisher(PublisherName)
);
SELECT * FROM books;
INSERT INTO books
(Title, PublisherName)
VALUES
			('The Lost Tribe', 'Simon Cromwell'),
			('Show Me the Honey', 'Thomas Zanetti'),
			('Lost Shadow', 'Katie	Tarbuck'),
			('Persephones Children', 'Zane Moore'),
			('Counting Down with You', 'Carla	Elsworth'),
			('Hot Copy', 'Karl Laker'),
			('The World of Fashion', 'Caroline Nixon'),
			('Connected Capitalism', 'David	James'),
			('Franklin the Turtle', 'Paul Manvile'),
			('If You Were Night', 'Zelda	Neill');	
SELECT * FROM books;
--END--
			


--PUBLISHER TABLE--
CREATE TABLE publisher (
			PublisherName VARCHAR(50) NOT NULL,
			PublisherAddress VARCHAR(50) NOT NULL,
			Phone VARCHAR(50) NOT NULL,
			PRIMARY KEY(PublisherName)
);
SELECT * FROM publisher;
INSERT INTO publisher
			(PublisherName, PublisherAddress, Phone)
			VALUES
			('Simon Cromwell', '1285 Baker Street, Ontario', '250-578-1455'),
			('Thomas Zanetti', '2175 Jasper Avenue, Edminton', '604-998-0063'),
			('Katie	Tarbuck', '4441 Venture Place, Victoria', '705-238-5445'),
			('Zane Moore', '3439 René-Lévesque Blvd, Montreal', '819-374-5208'),
			('Carla	Elsworth', '4741 Pape Ave, Toronto', '780-402-0553'),
			('Karl Laker', '1285 Baker Street, Clgary', '416-848-8709'),
			('Caroline Nixon', '3030 Islington Ave, Toronto', '705-666-2173'),
			('David	James', '4941 Lynden Road, Vancouver', '780-904-6880'),
			('Paul Manvile', '4941 Lynden Road', '905-906-3795'),
			('Zelda	Neill', '441 Pine Street, Ottawa', '778-288-8263');
SELECT * FROM publisher;
--END--



--BOOK_AUTHORS TABLE--
CREATE TABLE Book_Authors (
			AuthorID INT NOT NULL IDENTITY (400,1),
			AuthorName VARCHAR(50) NOT NULL,
			BookID INT,
			PRIMARY KEY (AuthorID),
			FOREIGN KEY (BookID) REFERENCES books(BookID)
);
SELECT * FROM Book_Authors;
INSERT INTO Book_Authors
			(AuthorName, BookID)
			VALUES
			('ARNOLD LOBEL', 601),
			('LENORE LOOK', 602),
			('ANDREA DAVIS PINKNEY', 603),
			('ARNOLD LOBEL', 604),
			('JERRY PINKNEY', 605),
			('DAN SANTAT', 606),
			('MAURICE SENDAK', 607),
			('DR SEUSS', 608),
			('MO WILLEMS', 609),
			('ERIC CARLE', 610);
SELECT * FROM Book_Authors;
--END--



--BOOK COPIES TABLE--
CREATE TABLE book_copies (
			book_copiesID INT NOT NULL IDENTITY(301,1),
			BookID INT,
			BranchID INT,
			PRIMARY KEY (book_copiesID),
			FOREIGN KEY (BookID) REFERENCES books(BookID),
			FOREIGN KEY (BranchID) REFERENCES librarybranch (BranchID),
			NumberOfCopies INT NOT NULL
);
SELECT * FROM book_copies;
INSERT INTO book_copies
			(BookID, BranchID, NumberOfCopies)
			VALUES
			(601, 101, 5),
			(602, 102, 3),
			(603, 103, 3),
			(604, 104, 3),
			(605, 105, 3),
			(606, 106, 2),
			(607, 102, 3),
			(608, 104, 4),
			(609, 101, 4),
			(610, 105, 4);
SELECT * FROM book_copies;
--END--



--BOOK LOANS TABLE--
CREATE TABLE book_loans (
			Book_LoansID INT NOT NULL PRIMARY KEY IDENTITY(801,1),
			BookID INT,
			BranchID INT,
			CardNo INT,
			FOREIGN KEY (BookID) REFERENCES books(BookID),
			FOREIGN KEY (BranchID) REFERENCES librarybranch(BranchID),
			FOREIGN KEY (CardNo) REFERENCES borrower(CardNo),
			DateOut VARCHAR(50) NOT NULL,
			DateDue VARCHAR(50) NOT NULL
);
SELECT * FROM book_loans;
INSERT INTO book_loans
			(BookID, BranchID, CardNo, DateOut, DateDue)
			VALUES
			(601,	101,	2545, '2023-01-12', '2023-02-12'),
			(602,	102,	2546, '2023-02-05', '2023-03-05'),
			(603,	103,	2547, '2023-01-13', '2023-02-13'),
			(604,	104,	2548, '2023-04-14', '2023-05-14'),
			(605,	105,	2549, '2023-05-07', '2023-06-07'),
			(606,	106,	2550, '2023-05-10', '2023-06-10'),
			(607,	102,	2551, '2023-05-15', '2023-06-15'),
			(608,	104,	2552, '2023-05-12', '2023-06-12'),
			(609,	101,	2548, '2023-05-16', '2023-06-16'),
			(610,	105,	2546, '2023-05-11', '2023-06-11');
SELECT * FROM book_loans;


--END--
SELECT * FROM ((book_loans FULL OUTER JOIN borrower ON book_loans.CardNo =
borrower.CardNo) FULL OUTER JOIN books ON book_loans.BookID = books.BookID)


--PROCEDURES--
CREATE PROCEDURE getCopiesOfBook @bookTitle VARCHAR(50)
AS
SELECT
		A1.BranchName, A2.NumberOfCopies, A3.Title
FROM
		librarybranch A1
		INNER JOIN book_copies A2 ON A2.BranchID = A1.BranchID
		INNER JOIN books A3 ON A2.BookID = A3.BookID
		WHERE
		Title = @bookTitle
		GO
		EXEC getCopiesOfBook @bookTitle = 'The Lost Tribe'
--END--



CREATE PROCEDURE getBookCopiesFromEachLibraryBranch
AS
SELECT
		bn.BranchName, nc.NumberOfCopies
FROM
		librarybranch bn
		INNER JOIN book_copies nc ON nc.BranchID = bn.BranchID
		INNER JOIN books ON books.BookID = nc.BookID
		WHERE
		books.Title = 'The Lost Tribe'
		;
		EXEC getBookCopiesFromEachLibraryBranch
--END--


--THIRD PROCEDURE--
CREATE PROCEDURE notCheckedOutByPeople
AS
SELECT FullName FROM borrower
	WHERE NOT EXISTS
		(SELECT * FROM book_loans
		WHERE book_loans.CardNo = borrower.CardNo)
GO
EXEC notCheckedOutByPeople
--END--
