-- Task 4a
SELECT *
FROM copy
WHERE shelf_loc LIKE 'A%';

-- Task 4b
SELECT title, pub_year
FROM book;

-- Task 4c
SELECT isbn, shelf_loc
FROM copy
WHERE shelf_loc >= 'B';

-- Task 4d
SELECT m.full_name, b.title
FROM loan l
JOIN member m ON l.member_no = m.member_no
JOIN copy c ON l.copy_no = c.copy_no
JOIN book b ON c.isbn = b.isbn
WHERE l.return_date IS NULL;

-- Task 4e
SELECT m.full_name,
       COUNT(l.loan_id) AS active_loans
FROM member AS m
LEFT OUTER JOIN loan AS l
    ON m.member_no = l.member_no
   AND l.return_date IS NULL
GROUP BY m.member_no, m.full_name;

-- Task 4f
SELECT title
FROM book
WHERE isbn IN (
    SELECT isbn FROM book
    EXCEPT
    SELECT c.isbn
    FROM copy c
    JOIN loan l ON c.copy_no = l.copy_no
);
