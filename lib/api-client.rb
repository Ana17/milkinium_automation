require 'rest-client'
class LinkClient

  def create_marketing_link(param1)
    data_hash = {
        id: '0',
        email: 'nasyrova.ana@gmail.com',
        password: 'test_password',
        avatar: 'banana',
        name: {
          first: 'Ana',
          last: 'Banana'
        },
        role: 'client'
    }

    json_payload = data_hash.to_json

    variable = RestClient.post 'https://api.branch.io/v1/url', json_payload, :content_type => 'application/json'

    hash = JSON.parse(variable.body)
    api_link = hash['url']

    return api_link
  end

  def click_link(api_link)
    RestClient.get api_link, {:user_agent => "Mozilla/5.0 (Linux; Android 6.0.1; SM-G920V Build/MMB29K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2743.98 Mobile Safari/537.36"}
  end

end