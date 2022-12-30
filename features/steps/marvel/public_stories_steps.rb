Given('that I have the record limit data {string}') do |maximum_registration|
  @stories_get ||= OpenStruct.new
  @stories_get.max_register = maximum_registration
end

When('call the endpoint stories.get') do
  @stories_get.response = marvel_public_stories.get_stories(@stories_get)
rescue StandardError => e
  @stories_get.error = e
end

Then('i check that the limit of returned records is ok {string}') do |maximum_registration|
  response = @stories_get.response

  expect(@stories_get.error).to be_nil
  expect(response.code).to eql 200
  expect(response['data']['count'].to_s).to eql maximum_registration

  puts '################### TITLES ###################'.yellow
  maximum_registration.to_i.times { |index| puts "# Title #{index + 1}: #{response['data']['results'][index]['title']}".yellow }
  puts '################# END TITLES #################'.yellow
end
