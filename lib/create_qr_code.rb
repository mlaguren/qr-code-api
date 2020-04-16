class CreateQrCode
  require 'rqrcode'

  def initialize(url)
    @qr = RQRCode::QRCode.new(url)
  end

  def create_png
    png = @qr.as_png(
        bit_depth: 1,
        border_modules: 4,
        color_mode: ChunkyPNG::COLOR_GRAYSCALE,
        color: 'black',
        file: nil,
        fill: 'white',
        module_px_size: 6,
        resize_exactly_to: false,
        resize_gte_to: false,
        size: 120
    )
    IO.binwrite("qr.png",png.to_s)
    sleep 1
  end
end
