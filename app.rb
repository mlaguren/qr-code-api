require 'require_all'
require 'sinatra'

require_all 'lib'

post "/qr" do
  request.body.rewind
  if ValidUrl.check(params[:url])
    CreateQrCode.new(params[:url]).create_png
    status 201
    send_file 'qr.png'
  else
    status 400
  end
end