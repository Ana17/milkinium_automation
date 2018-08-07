require 'spec_helper.rb'

describe 'Testing Users APIs:' do
    it 'create user' do
        # authenticate
        api_client_obj_0 = ApiClient.new('nasyrova.ana@gmail.com','test_password')

        # create new user
        random_email = Time.now.strftime("#{Faker::Hipster.word}_%Y_%m_%d_%H_%M_%S@gmail.com")

        user_info_hash = {
            email: random_email,
            password: 'test_password',
            name: {
              first: 'Ana',
              last: 'Banana'
            },
            role: 'client'
        } 
        created_user_info_hash = api_client_obj_0.create_user(user_info_hash)
        created_user_info_hash = created_user_info_hash.deep_symbolize_keys
        
        # expect server to return user info
        expected_hash = user_info_hash.except(:password)
        expect(created_user_info_hash).to include(expected_hash)

        # get a user by id
    end
end
