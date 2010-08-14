ENV['RACK_ENV'] = 'test'

require 'rubygems'
require 'test/unit'
require 'shoulda'
require 'rack/test'
require 'pdf_service_server'

class PdfServiceTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  context "on GET to /" do
    setup {
      get '/'
    }
    should "return ok" do
      assert last_response.ok?
    end
    should "have some kind of welcome" do
      assert last_response.body =~ /curl/
    end
  end

  context "on POST to /" do
    setup {
      post '/', '<html></html>'
    }
    should "return ok" do
      assert last_response.ok?
    end
    should "return pdf content-type" do
      assert last_response.ok?
    end
    should "return the PDF document" do
      body = last_response.body
      body.force_encoding('binary') if body.respond_to?(:force_encoding)
      assert body =~ /^%PDF-1\.4/
    end
  end
end