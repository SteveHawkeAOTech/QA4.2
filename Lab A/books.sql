select b.isbn, b.title, b.no_pages as pages, t.theme_name as theme, a.author_name as author
from books b
left outer join books_themes bt
on b.isbn = bt.isbn
left outer join themes t
on bt.theme_id = t.id
left outer join authors_books ab
on b.isbn = ab.isbn
left outer join authors a
on ab.author_id = a.id
