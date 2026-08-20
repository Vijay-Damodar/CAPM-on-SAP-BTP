sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"bookscapmui/test/integration/pages/BooksSetList.gen",
	"bookscapmui/test/integration/pages/BooksSetObjectPage.gen"
], function (JourneyRunner, BooksSetListGenerated, BooksSetObjectPageGenerated) {
    'use strict';

    const runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('bookscapmui') + '/test/flpSandbox.html#bookscapmui-tile',
        pages: {
			onTheBooksSetListGenerated: BooksSetListGenerated,
			onTheBooksSetObjectPageGenerated: BooksSetObjectPageGenerated
        },
        async: true
    });

    return runner;
});

