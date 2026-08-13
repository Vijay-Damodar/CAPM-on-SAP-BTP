using {relationship.db as rel} from '../db/relationshipdemo';

service relsrv {

    entity HeaderSet as projection on rel.Header;
    entity ItemSet   as projection on rel.Items;
    entity SalesOrderHeaderSet as projection on rel.SalesOrderHeader;
    entity SalesOrderItemSet as projection on rel.SalesOrderItems;

}

annotate relsrv.SalesOrderHeaderSet with @( 
    UI : {
        SelectionFields  : [ 
            ID, description
        ],
        LineItem  : [
            {$Type: 'UI.DataField', Value: ID, Label: 'Sales Order ID'},
            {$Type: 'UI.DataField', Value: description, Label: 'Description'}
        ],
    }
);

annotate relsrv.SalesOrderItemSet with @( 
    UI : {
        SelectionFields  : [ 
            ID, product
        ],
        LineItem  : [
            {$Type: 'UI.DataField', Value: ID, Label: 'Sales Order Item ID'},
            {$Type: 'UI.DataField', Value: product, Label: 'Product'},
            {$Type: 'UI.DataField', Value: quantity, Label: 'Quantity'}
        ],
    }
)
