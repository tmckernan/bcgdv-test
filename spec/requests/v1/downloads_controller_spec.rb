require 'rails_helper'

RSpec.describe 'Downloads Controller', type: :request do
  describe "GET /downloads/show" do
    subject(:perform_request) { get download_path(id) }
    let!(:image) { create(:image) }
    context 'download file' do
      let(:id) { image.id }
      it 'returns file and ok status' do
        perform_request
        expect(response).to have_http_status(:ok)
        expect(response.headers["Content-Type"]).to eq("application/octet-stream")
      end
    end

    context 'request file which has not been uploaded' do
      let(:id) {  999_99  }
      it 'returns not found status' do
        perform_request
        expect(response).to have_http_status(:not_found)
      end
    end
  end
end
