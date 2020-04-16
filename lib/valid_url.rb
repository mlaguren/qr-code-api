class ValidUrl
  def self.check (url)
    if url[ /https?:\/\/(www.)?\w.*.*/ ]
      return true
    else
      return false
    end
  end
end