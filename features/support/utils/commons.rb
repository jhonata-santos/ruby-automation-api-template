module Commons
  def get_credentials
    yaml = YAML.load_file("#{File.dirname(__FILE__)}/../security/credentials.yml")

    data ||= OpenStruct.new
    data.ts = yaml['ts']
    data.api_key = yaml['api_key']
    data.hash_md5 = yaml['hash_md5']

    data
  end
end
