require 'rest-client'
class ApiClient

  def initialize(email, password)
    @token = authenticate(email, password)
  end

  # authenticate endpoint
  def authenticate(email, password)
    data_hash = {
      email: email,
      password: password
    }
    json_payload = data_hash.to_json

    headers = {
      content_type: 'application/json',
    }

    response = RestClient.post "https://milkinium-api.herokuapp.com/v1/authenticate", json_payload, headers=headers
    response_hash = JSON.parse(response.body)
    token = response_hash['token']
    return token
  end

  # create user endpoint
  def create_user(user_info_hash)
    json_payload = user_info_hash.to_json

    headers = {
      content_type: 'application/json',
      authorization: @token 
    }

    response = RestClient.post "https://milkinium-api.herokuapp.com/v1/users", json_payload, headers=headers
    response_hash = JSON.parse(response.body)
    return response_hash
  end

  # get user by id endpoint
  def get_user_by_id(user_id)

    headers = {
      content_type: 'application/json',
      authorization: @token 
    }

    response = RestClient.get "https://milkinium-api.herokuapp.com/v1/users/#{user_id}", headers=headers
    response_hash = JSON.parse(response.body)
    return response_hash
  end

  def get_all_users
    headers = {
      content_type: 'application/json',
      authorization: @token 
    }
    response = RestClient.get "https://milkinium-api.herokuapp.com/v1/users", headers=headers
    response_code = response.code.to_s
    return response_code
  end

end