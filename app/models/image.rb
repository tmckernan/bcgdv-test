class Image < ApplicationRecord
  mount_uploader :file, ImageUploader
  store_in_background :file

  before_save :update_asset_attributes

  private

  def update_asset_attributes
    if file.present? && file_changed?
      self.content_type = file.file.content_type
    end
  end
end
