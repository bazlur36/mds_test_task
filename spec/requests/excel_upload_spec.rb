# spec/requests/excel_upload_spec.rb
require 'rails_helper'

RSpec.describe 'Excel Upload', type: :request do
  it 'uploads an Excel file and processes it' do
    get '/users'
    expect(response).to have_http_status(:success)

    excel_file_path = Rails.root.join('spec/files/TaskSampleSheet.xlsx')
    file = Rack::Test::UploadedFile.new(excel_file_path, 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet')
    post '/users/import', params: { file: file }

    expect(response).to have_http_status(:success)
    expect(response.body).to include('Successful Imports: 6')
    expect(response.body).to include('Unsuccessful Imports: 2')
    expect(User.last.last_name).to eq("LN 8")
  end
end
