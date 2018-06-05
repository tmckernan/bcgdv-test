module V1
  class UploadsController < ApplicationController
    def create
      image_or_errors = CreateImage.new(Image.new, params).call
      if image_or_errors.is_a?(Image)
        upload_accepted(image_or_errors)
      else
        bad_request(image_or_errors)
      end
    end

    private

    def upload_accepted(image)
      render json: { unique_identifier: image.id }.to_json, status: 202
    end

    def bad_request(errors)
      render_json_error(
        code: :parameter_missing,
        status: :bad_request,
        options: { details: errors.messages }
      )
    end
  end
end
