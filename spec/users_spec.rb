require 'spec_helper.rb'

describe 'Testing Users APIs:' do
    it 'create user' do
        # authenticate
        api_client_obj_0 = ApiClient.new('nasyrova.ana@gmail.com','test_password')

        # create new user
        user_info_hash = random_user_info_hash
        created_user_info_hash = api_client_obj_0.create_user(user_info_hash).deep_symbolize_keys
        
        # expect server to return user info
        expected_hash = user_info_hash.except(:password)

        expect(created_user_info_hash.except(:id)).to eq(expected_hash)
        expect(created_user_info_hash[:id]).not_to be_empty
        expect(created_user_info_hash[:id]).to be_kind_of(String)

        # get a user by id to verify its created
        user_from_get_user_endpoint = api_client_obj_0.get_user_by_id(created_user_info_hash[:id]).deep_symbolize_keys
       
        expected_user_id = created_user_info_hash[:id]
        expect(user_from_get_user_endpoint[:id]).to eq(expected_user_id)
    end

    it 'create 2 users + get them by id + get all users' do
        # authenticate
        api_client_obj_0 = ApiClient.new('nasyrova.ana@gmail.com','test_password')

        # create 2 users
        created_user1_info_hash = api_client_obj_0.create_user(random_user_info_hash).deep_symbolize_keys
        created_user2_info_hash = api_client_obj_0.create_user(random_user_info_hash).deep_symbolize_keys

    end
    
    def random_user_info_hash
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
    end

end
