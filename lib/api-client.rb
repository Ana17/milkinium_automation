require 'rest-client'
class ApiClient

  def initialize(email, password)
    @token = authenticate(email, password)
  end

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

end