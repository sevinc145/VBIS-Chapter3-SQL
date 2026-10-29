-- Məcburi tapşırıqlar
-- 3.11, 3.24, 3.25 universitet sxemi ilə, 3.15 bank sxemi ilə yazılıb.


-- Exercise 3.11(a)
-- Ən azı bir Comp. Sci. kursu almış tələbələr. DISTINCT təkrarları silir.
SELECT DISTINCT s.ID, s.name
FROM student s
JOIN takes t ON s.ID = t.ID
JOIN course c ON t.course_id = c.course_id
WHERE c.dept_name = 'Comp. Sci.';


-- Exercise 3.11(b)
-- 2017-ci ildən əvvəl heç bir kurs almayan tələbələr.
SELECT ID, name
FROM student
WHERE ID NOT IN (
    SELECT ID
    FROM takes
    WHERE year < 2017
);


-- Exercise 3.11(c)
-- Hər departamentdə müəllimlərin maksimum maaşı.
SELECT dept_name, MAX(salary) AS max_salary
FROM instructor
GROUP BY dept_name;


-- Exercise 3.11(d)
-- Yuxarıdakı maksimum maaşlar içində ən kiçiyi.
SELECT MIN(max_salary) AS min_of_max_salary
FROM (
    SELECT dept_name, MAX(salary) AS max_salary
    FROM instructor
    GROUP BY dept_name
) AS dept_max;


-- Exercise 3.15(a)
-- Brooklyn-dakı bütün filiallarda hesabı olan müştərilər.
-- Brooklyn filiallarından müştərinin hesabı olmayan filial qalmamalıdır.
SELECT c.ID, c.customer_name
FROM customer c
WHERE NOT EXISTS (
    SELECT b.branch_name
    FROM branch b
    WHERE b.branch_city = 'Brooklyn'
    EXCEPT
    SELECT a.branch_name
    FROM depositor d
    JOIN account a ON d.account_number = a.account_number
    WHERE d.ID = c.ID
);


-- Exercise 3.15(b)
-- Bankdakı bütün kreditlərin cəmi.
SELECT SUM(amount) AS total_loan_amount
FROM loan;


-- Exercise 3.15(c)
-- Aktivi Brooklyn-dakı ən azı bir filialdan çox olan filiallar.
SELECT branch_name
FROM branch
WHERE assets > SOME (
    SELECT assets
    FROM branch
    WHERE branch_city = 'Brooklyn'
);


-- Exercise 3.24
-- Physics müəllimi tərəfindən məsləhət verilən Accounting tələbələri.
SELECT s.name, s.ID
FROM student s
JOIN advisor a ON s.ID = a.s_ID
JOIN instructor i ON a.i_ID = i.ID
WHERE s.dept_name = 'Accounting'
  AND i.dept_name = 'Physics';


-- Exercise 3.25
-- Büdcəsi Philosophy departamentindən çox olan departamentlər, əlifba sırası ilə.
SELECT dept_name
FROM department
WHERE budget > (
    SELECT budget
    FROM department
    WHERE dept_name = 'Philosophy'
)
ORDER BY dept_name;
