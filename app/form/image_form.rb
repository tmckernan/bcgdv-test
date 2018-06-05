class ImageForm < Reform::Form
  property :file
  # property :id, default: MySQLBinUUID::Type.new
  validates :file, presence: true
end
