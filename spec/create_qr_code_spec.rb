require "create_qr_code"

describe CreateQrCode do

  describe ".create_png" do
    context "given the following url, https://www.example.com" do
      it "returns a qr code containing the url" do
        CreateQrCode.new('https://www.example.com').create_png
        expect( ImageHash.new('qr.png').hash).to eq  ImageHash.new('qr_codes/example_com.png').hash
      end
    end
  end
end