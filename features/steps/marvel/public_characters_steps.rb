Given('that I have the character id {string}') do |character|
  @characters_get ||= OpenStruct.new
  @characters_get.characters_id = case character
                                  when 'agents of atlas' then '1011198'
                                  when 'agent brand'     then '1011297'
                                  when 'balder'          then '1011456'
                                  when 'nonexistent'     then '0101'
                                  end
end

When('call the endpoint characters.get') do
  @characters_get.response = marvel_public_characters.get_characters(@characters_get)
rescue StandardError => e
  @characters_get.error = e
end

Then('I check that the returned character is correct {string}') do |character|
  response = @characters_get.response
  expect(@characters_get.error).to be_nil

  if character.eql?('nonexistent')
    expect(response.code).to eql 404
    expect(response['status']).to eql "We couldn't find that character"
  else
    expect(response.code).to eql 200
    expect(response['data']['results'][0]['name'].downcase).to eql character
  end
end
