using { db.books as mybook } from '../db/booksdatamodel';

service BooksSrv {
    entity BooksSet as projection on mybook.Books;
}