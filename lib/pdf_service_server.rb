## Resources
require 'rubygems'
gem 'sinatra', :version => '1.0'
require 'sinatra'



## Application

get '/' do
  %Q{
    <body style='line-height: 1.8em; font-family: Archer, Museo, Helvetica, Georgia; font-size 25px; text-align: center; padding-top: 20%;'>
      Post some HTML content to this server and receive a PDF document.
      <pre style='font-family: Iconsolata, monospace;background-color:#EEE'>curl -X POST http://#{request.host}/ < some_file.html > some_file.pdf</pre>
      <br />
      Also, try <a href='http://github.com/JackDanger/pdfservice'>the official Ruby client</a>
    </body
}
end

post '*' do
  begin
    content_type 'application/pdf'
    convert request.env['rack.input'].read
  rescue => error
    puts error.inspect
    status 400
  end
end


## HELPERS

def wkhtmltopdf
  executable = `which wkhtmltopdf`.chomp

  if '' == executable.to_s && RUBY_PLATFORM =~ /x86_64-linux/
    executable = File.join File.dirname(__FILE__), '..', 'vendor', 'wkhtmltopdf-amd64-0.10.0_beta5-static-amd64'
  end
  executable
end

def command
  [ wkhtmltopdf,
    "--page-size letter",
    "--margin-right 0",
    "--margin-top 0",
    "--margin-bottom 0",
    "--disable-smart-shrinking",
    "--encoding UTF-8",
    "--margin-left 0",
    "--quiet",
    "-",
    "-"
  ]
end

def convert html
    pdf = Kernel.open('|-', "w+")
    exec command.join(' ') if pdf.nil?
    pdf.puts html
    pdf.close_write
    result = pdf.gets nil
    pdf.close_read
    result
end