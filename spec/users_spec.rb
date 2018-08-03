require 'spec_helper.rb'

describe 'Testing Users APIs:' do
    it 'create user' do
        # authenticate
        api_client_obj_0 = ApiClient.new('nasyrova.ana@gmail.com','test_password')

        # create new user
        random_email = Time.now.strftime("%Y%m%d_%H%M%S")
        binding.pry
        user_info_hash = {
            email: 'culala@gmail.com',
            password: 'test_password',
            avatar: 'banana',
            name: {
              first: 'Ana',
              last: 'Banana'
            },
            role: 'client'
        } 
        user_info = api_client_obj_0.create_user(user_info_hash)
        puts user_info
    end
end
