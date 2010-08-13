# PDF Service

This is a simple Rack server that accepts web requests posting HTML to be converted into PDF. Uses the wkhtmltopdf binaries.


## Instant installation and deploy

* Clone this: `git clone git://github.com/JackDanger/pdfservice.git`
* Signup for an account at Heroku ([better details here](http://github.com/sinatra/heroku-sinatra-app))
* push it to Heroku.com: `git push heroku master`


## HowTo

Once the server is running you need to post a string of html to it and that string will
be rendered in WebKit and returned to you as a PDF document.

    require 'pdfservice'
    client = PdfService::Client.new 'http://my-pdfservice-app.heroku.com'
    pdf_content = client.render '<html></html>'


Patches welcome, forks celebrated.

Copyright (c) 2010 [Jack Danger Canty](http://jåck.com). Released under the MIT License.