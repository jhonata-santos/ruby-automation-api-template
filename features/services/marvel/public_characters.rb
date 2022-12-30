module Bexs
  module Rest
    class MarvelPublicCharacters
      include HTTParty

      base_uri URL[ENVIRONMENT]['marvel']
      headers 'Content-Type' => 'application/json'

      def get_characters(data)
        credentials = get_credentials
        params = {
          ts: credentials.ts,
          apikey: credentials.api_key,
          hash: credentials.hash_md5
        }

        self.class.get("#{ENDPOINT['characters']}/#{data.characters_id}", query: params)
      end
    end
  end
end
