#
# HowTo:
#
#  client = PdfService::Client.new 'http://my-pdfservice-app.com'
#  pdf_content = client.render '<html></html>'
#
module PdfService
  class Client
    # @server: "http://myserver.com"
    def initialize(server)
      require 'net/http'
      @server = URI.parse server
    end

    def render html
      start do |http|
        http.post '/', html
      end
    end

    protected

      def start
        Net::HTTP.start @server.host, @server.port do |http|
          yield http
        end
      end
  end
end