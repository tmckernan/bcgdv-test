require 'rails_helper'

RSpec.describe CreateImage, type: :service do
  subject(:create_image) { described_class.new(image, params) }

  let(:image) { Image.new }
  let(:params) { { file: file } }

  let(:file_path) { Rails.root.join('spec', 'support', 'tonyimage.png') }

  describe '#call' do
    subject(:call) { create_image.call }

    before(:example) { call }

    context 'with a new Image' do
      context 'when image form is valid' do
        let(:file) { File.open(file_path) }

        it 'saves and returns the image' do
          is_expected.to eql(image)
          expect(image).to be_persisted
        end
      end

      context 'when image form is invalid' do
        let(:file) { nil }

        it 'returns the image form errors' do
          is_expected.to have_attributes(messages: { file: ["can't be blank"] })
          expect(image).not_to be_persisted
        end
      end
    end
  end
end
