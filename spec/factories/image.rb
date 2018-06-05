FactoryBot.define do
  factory :image do
    # file { Rack::Test::UploadedFile.new(Rails.root.join('spec', 'support', 'tonyimage.png'), 'image/png') }
    content_type 'image/png'


    after :create do |b|
      b.update_column(:file, "spec/support/tonyimage.png")
    end
  end
end
