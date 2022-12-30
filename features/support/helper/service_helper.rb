module Rest
  def marvel_public_stories; Bexs::Rest::MarvelPublicStories.new end
  def marvel_public_characters; Bexs::Rest::MarvelPublicCharacters.new end
end
