class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  include CarrierWave::Backgrounder::Delay

  storage :file

  def extension_white_list
    %w(jpg jpeg gif png)
  end
end
