module Concerns
  module ExceptionHandler
    extend ActiveSupport::Concern

    included do
      def render_json_error(code:, status:, options: {})
        error = {
          title: "error_codes.#{code}.message",
          status: status
        }.merge(options)

        render json: { errors: [error] }, status: status
      end
    end
  end
end
