class MessageFilter
  def initialize(word)
    @word = word
  end

  def detected?(text)
    true
  end
end
