ENV['APP_ENV'] = 'test'

require './app'  # <-- your sinatra app
require 'rspec'
require 'rack/test'

RSpec.describe 'The QR Code Generating App' do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  it "should generate a QR Code from a fully formed URL", :integration => true do
    post '/qr', :url => 'https://www.example.com'
    expect(last_response).to be_ok
    expect( ImageHash.new('qr.png').hash).to eq  ImageHash.new('qr_codes/example_com.png').hash
  end

  it "should generate a QR Code from a non-www compliant url", :integration => true do
    post '/qr', :url => 'https://example.com'
    expect(last_response).to be_ok
    expect( ImageHash.new('qr.png').hash).to eq  ImageHash.new('qr_codes/example_com.png').hash
  end

  it "should return an error if the url is not compliant", :integration => true do
    post 'qr', :url => 'test'
    expect(last_response.bad_request?).to be true
  end
end