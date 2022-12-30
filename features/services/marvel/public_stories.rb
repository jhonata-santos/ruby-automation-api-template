module Bexs
  module Rest
    class MarvelPublicStories
      include HTTParty

      base_uri URL[ENVIRONMENT]['marvel']
      headers 'Content-Type' => 'application/json'

      def get_stories(data)
        credentials = get_credentials
        params = {
          ts: credentials.ts,
          apikey: credentials.api_key,
          hash: credentials.hash_md5,
          limit: data.max_register
        }

        self.class.get(ENDPOINT['stories'], query: params)
      end
    end
  end
end
