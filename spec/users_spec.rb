require 'spec_helper.rb'

describe 'Testing Users APIs:' do
    it 'create user' do
        # authenticate
        api_client_obj_0 = ApiClient.new('admin@admin.com','admin')

        # create new user 
        user_info = api_client_obj_0.create_user
        puts user_info
    end
end