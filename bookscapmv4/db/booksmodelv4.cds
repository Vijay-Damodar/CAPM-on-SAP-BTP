namespace bookscapmv4.db;

entity GenderVH {
    key code : String(1);
    text : String
};
entity AgeGroupVH {
    key code : String(1);
    text : String
};

type allGenders : String enum {
    Male  = 'M';
    Female = 'F'
};

type booksAgeGroup : String enum {
    Kids = 'Kids';
    Adult = 'Adult'
};

entity Books {
    key ID: UUID;
    title : String(100);
    author :  String(30);
    price :Decimal(10, 2);
    publishedDate : DateTime;
    gender : allGenders;
    ageGroup : booksAgeGroup;

    chapters : Composition of many Chapters on chapters.bookID = $self;
}

entity Chapters {
    key ID : UUID;
    title : String;
    pages : Integer;

    bookID : Association to Books;
}