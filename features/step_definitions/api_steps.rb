Given(/^I want to get the users$/) do
  @request = 'get'
end

Then(/^the response is a success$/) do
  p @response.code
  p @response.message
  expect(@response.code).to eq('200')
  expect(@response.message).to eq('OK')

end

Given(/^I want to add a user$/) do
  @json = create_user
  @request = 'post'
end


When(/^I send an api request$/) do
  case @request.downcase
    when 'get'
      send_get(TestConfig['host'], '/api/users')
    when 'post'
      send_post(TestConfig['host'], '/api/users', @json)
    else
      raise('Request method not available')
  end
end

Then(/^the user is added$/) do
  p @response.code
  p @response.message
  expect(@response.code).to eq('201')
  expect(JSON.parse(@response.body)['first_name']).to eq(@user.first_name)
  expect(JSON.parse(@response.body)['last_name']).to eq(@user.last_name)
  expect(JSON.parse(@response.body)['createdAt'].to_s[0..9]).to eq(Time.now.to_s[0..9])
  id = JSON.parse(@response.body)['id']
  p "Your User ID is: #{id}"
end