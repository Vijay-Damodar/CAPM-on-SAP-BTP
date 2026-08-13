namespace sodemo.db;
using { managed } from '@sap/cds/common';


entity SO: managed {
    customer: String;
    amount : Decimal(10, 2);
}