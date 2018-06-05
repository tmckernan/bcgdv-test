module V1
  class DownloadsController < ApplicationController
    def show
      @image = Image.find(params[:id])
      return bad_request("missing file") unless check_file_exist?

      if @image.content_type.split('/').exclude?(params[:format])
        download_reformated_file
      else
        download_file
      end
    end

    private

    def check_file_exist?
      File.exist?(@image.file.file.path)
    end

    def download_reformated_file
      image = MiniMagick::Image.open(@image.file.file.path)
      image.format(params[:format])
      send_file image.path
    end

    def download_file
      send_file(@image.file.file.path,
                filename: @image.file.file.filename,
                type: @image.file.file.content_type,
                disposition: 'attachment',
                url_based_filename: true)
    end

    def bad_request(err_msg)
      render_json_error(
        code: :missing_file,
        status: :bad_request,
        options: { details: err_msg }
      )
    end
  end
end
