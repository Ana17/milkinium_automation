require 'spec_helper.rb'

describe 'Testing Users APIs:' do
    it 'create user' do
        # authenticate
        api_client_obj_0 = ApiClient.new('nasyrova.ana@gmail.com','test_password')

        # create new user
        random_email = Time.now.strftime("%Y%m%d_%H%M%S")
  
        user_info_hash = {
            email: 'culala6@gmail.com',
            password: 'test_password',
            avatar: 'banana',
            name: {
              first: 'Ana',
              last: 'Banana'
            },
            role: 'client'
        } 
        created_user_info = api_client_obj_0.create_user(user_info_hash)
        # created_user_info_hash = JSON.parse(created_user_info.body)
        puts created_user_info
    end
end
