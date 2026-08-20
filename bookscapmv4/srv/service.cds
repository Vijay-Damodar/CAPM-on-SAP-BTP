using { bookscapmv4.db as db } from '../db/booksmodelv4';

service BooksLibSrv @(path: '/odata/v4/BooksSrv' ){
    @odata.draft.enabled
    entity Books as projection on db.Books;

    entity AgeGroupVH as projection on db.AgeGroupVH;
    entity GenderVH as projection on db.GenderVH;

}

annotate BooksLibSrv.Books with @(
    UI : {
        LineItem : [
            {Value: title, Label: 'Title'},
            {Value: author, Label: 'Author'},
            {Value: price, Label: 'Price'},
            {Value: publishedDate, Label: 'Published Date'},
            {Value: gender, Label: 'Gender'},
            {Value: ageGroup, Label: 'Age Group'},
        ],
        SelectionFields  : [
            title, author, gender, ageGroup
        ],
        HeaderInfo  : {
            $Type : 'UI.HeaderInfoType',
            TypeName : 'Book',
            TypeNamePlural : 'Books',
            Title : {Value : title },
            Description : { Value : author }
        },
        Facets  : [
            {
                $Type : 'UI.ReferenceFacet',
                Label : 'General Information',
                Target : '@UI.FieldGroup#General',
            },
            {
                $Type : 'UI.ReferenceFacet',
                Label : 'Publication Details',
                Target : '@UI.FieldGroup#Publication',
            },
            {
                $Type : 'UI.ReferenceFacet',
                Label : 'Pricing',
                Target : '@UI.FieldGroup#Pricing',
            }
        ],
        FieldGroup #General : {
            Data : [
                { Value : title },
                { Value : author },
                { Value : gender },
                { Value : ageGroup }
            ]
        },
        FieldGroup #Publication : {
            Data : [
                { Value : publishedDate }
            ]
        },
        
        FieldGroup #Pricing : {
            Data : [
                { Value : price }
            ]
        },
    }
);

annotate BooksLibSrv.Books with {
    gender @(
        Common.ValueList : {
            CollectionPath : 'GenderVH',
            Parameters :[
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : gender,
                    ValueListProperty : 'code'
                },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'text'
                }
            ] 
        }
    );

    ageGroup @(
        Common.ValueList : {
            CollectionPath : 'AgeGroupVH',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : ageGroup,
                    ValueListProperty : 'code'
                },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'text'
                }
            ]
        }
    )
};

