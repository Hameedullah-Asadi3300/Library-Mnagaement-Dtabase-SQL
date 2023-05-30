##Library-Mnagaement-Dtabase-SQL


This database is made of seven tables as follows:
1. librarybranch
    a. Inserted 6 values with the exception that one branch name is “Sharpstown.”
2. borrower
    b. Inserted 8 values for the following columns: CardNo, Name, Address and Phone.
3. books
    c. Inserted 10 rows of different books. One book is assigned with title “The Lost Tribe.”
4. publisher
    d. Inserted 10 values to the columns PublisherName, Address and Phone.
5. Book_Authors
    e. Inserted 10 different author names.
6. book_copies
    f. Inserted values for the following columns: Number_of_Copies, BookID, and BranchID.
7. book_loans
    g. Inserted 10 rows including values in the columns; BookID, BranchID, CardNo, DateOut, and DateDue

##Joins
This project also includes a full outer join of three tables showing in following schema:
SELECT * FROM ((book_loans FULL OUTER JOIN borrower ON book_loans.CardNo =
borrower.CardNo) FULL OUTER JOIN books ON book_loans.BookID = books.BookID)

##Stored Procedure
This database contains three stored procedure to get the following output:
A. How many copies of the book titled "The Lost Tribe" are owned by the library branch whose name is "Sharpstown"?
B. How many copies of the book titled "The Lost Tribe" are owned by each library branch?
C. Retrieve the names of all borrowers who do not have any books checked out.



