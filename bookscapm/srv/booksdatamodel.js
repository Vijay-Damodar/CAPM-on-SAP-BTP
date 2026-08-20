const cds = require('@sap/cds');
const {Books} = cds.entities;

module.exports = srv => {
    const db = cds.db;

    // srv.on('READ', 'BooksSet',async (req, response) => {
    //     results = [];

    //     results = await db.run([
    //         SELECT.from(Books).where({ID : req.data.ID})
    //     ]);

    //     return results;
    // });

    srv.before('CREATE', 'BooksSet', req => {
        if(req.data.price < 0) req.error(400, 'Price can not be negative');
    });

    srv.on('CREATE', 'BooksSet', async (req, response) => {
        results = [];
        results = await db.run([
            INSERT.into(Books).entries(req.data)
        ])
        .then((resolve, reject) =>{
            if(resolve) return req.data;
            else return req.error(400, 'Failed to Create!!');
        })
        .catch(err => {
            return req.error(500, 'Server Down, try again later' +err.toString())
        })

        return results;
    });

    srv.on('UPDATE', 'BooksSet', async (req, response) => {
        results = [];
        if(req.data.price < 0){
            return req.error(400, 'Book price can not negative');
        }
        results = await db.run([
            UPDATE(Books).set(req.data).where({ID: req.data.ID})
        ])
        .then((resolve, reject) =>{
            if(resolve) return req.data;
            else return req.error(400, 'Failed to Update!!');
        })
        .catch(err => {
            return req.error(500, 'Server Down, try again later' +err.toString())
        })

        return results;
    });

    srv.after('UPDATE', 'BooksSet', data => {
        console.log('Book Updated : ${data.ID}');
    });

    srv.on('DELETE', 'BooksSet', async (req) => {
        results = [];

        return results = await db.run([
            DELETE.from(Books).where({ID : req.data.ID})
        ]);
    })
}