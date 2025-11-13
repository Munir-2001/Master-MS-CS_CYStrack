-- Before running this script:
--	- create the database with name "library-db"
--	- give permissions for this database to user "postgres" with password "postgres"

-- Table creation
CREATE TABLE public.books (
    isbn CHAR(13) PRIMARY KEY,
    title VARCHAR NOT NULL,
    author VARCHAR
);

CREATE SEQUENCE public.loans_id_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE public.users_id_seq START WITH 1 INCREMENT BY 1;

CREATE TABLE public.users (
    id INTEGER PRIMARY KEY DEFAULT nextval('public.users_id_seq'),
    name VARCHAR NOT NULL,
    surname VARCHAR NOT NULL,
    email VARCHAR
);

CREATE TABLE public.loans (
    id INTEGER PRIMARY KEY DEFAULT nextval('public.loans_id_seq'),
    "userId" INTEGER NOT NULL,
    "bookId" CHAR(13) NOT NULL,
    "leaseDate" DATE NOT NULL,
    "returnDate" DATE NOT NULL,
    CONSTRAINT "Book_FK" FOREIGN KEY ("bookId") REFERENCES public.books(isbn),
    CONSTRAINT "User_FK" FOREIGN KEY ("userId") REFERENCES public.users(id)
);

-- Table data
INSERT INTO public.books (isbn, title, author) VALUES
('9788804745723', 'Ghostland', 'Colin Dickey'),
('9788804783022', 'Stories of Surrender', 'Bono'),
('9788804776758', 'Poets square', 'Courtney Gustafson'),
('9788804805267', 'Anathema', 'Keri Lake'),
('9788804801634', 'Aut-Aut', 'Sören Kierkegaard'),
('9788804806837', 'Elfie', 'Gregory Maguire'),
('9788804800101', 'Katabasis', 'R. F. Kuang'),
('9781847493507', 'Frankenstein', 'Mary Wollstonecraft Shelley'),
('9788804782353', 'Hallowe’en Party', 'Agatha Christie'),
('9788804776871', 'Madam Tarot', 'Sua Lee'),
('9788804782551', 'Long live evil', 'Sarah Rees Brennan'),
('9788804751441', 'A new Earth', 'Eckhart Tolle'),
('9788804754497', 'The Call of Cthulhu', 'Howard Phillips Lovecraft'),
('9788804801290', 'And Then There Were None', 'Agatha Christie'),
('9788825173956', 'Algoritmi e Strutture dati', 'Alberto Montresor');

INSERT INTO public.users (id, name, surname, email) VALUES
(1, 'Jesse', 'Joyce', 'jesse.joyce@email.com'),
(2, 'Flynn', 'Yates', 'flynn.yates@example.com'),
(3, 'Benedict', 'Ferguson', 'benedict.ferguson@mail.com'),
(4, 'Ines', 'Sloan', 'ines.sloan@mail.com'),
(5, 'Billie', 'Baird', 'billie.baird@example.com'),
(6, 'James', 'Morgan', 'james.morgan@email.com'),
(7, 'Richard', 'May', 'richard.may@example.com');

INSERT INTO public.loans (id, "userId", "bookId", "leaseDate", "returnDate") VALUES
(2, 2, '9788804783022', '2025-10-26', '2025-11-26'),
(3, 2, '9788804800101', '2025-10-26', '2025-11-26'),
(4, 2, '9788804776871', '2025-09-18', '2025-10-18'),
(5, 3, '9781847493507', '2025-09-27', '2025-10-27'),
(6, 3, '9788804745723', '2025-10-14', '2025-11-14'),
(7, 3, '9788804776871', '2025-10-14', '2025-11-14'),
(8, 5, '9788804776871', '2025-08-02', '2025-09-02');

-- Setting sequences for auto-increments
SELECT setval('public.loans_id_seq', 8, true);
SELECT setval('public.users_id_seq', 7, true);