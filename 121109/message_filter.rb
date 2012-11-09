class MessageFilter
  def initialize(word)
    @word = word
  end

  def detected?(text)
    text.include?(@word)
  end
end
