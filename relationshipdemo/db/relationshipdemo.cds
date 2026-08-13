namespace relationship.db;

entity Header {
    key ID            : UUID;
        description   : String;
        items_details : Association to many Items
                            on items_details.headerID = $self.ID;
}

entity Items {
    key ID       : UUID;
        headerID : UUID;
        product  : String;
        quantity : Integer;
}

entity SalesOrderHeader {
    key ID : UUID;
    description: String;
    items_details_comp : Composition of many SalesOrderItems on items_details_comp.headerID = $self;
}

entity  SalesOrderItems {
    key ID : UUID;
    headerID: Association  to SalesOrderHeader;
    product : String;
    quantity : Integer;
}
