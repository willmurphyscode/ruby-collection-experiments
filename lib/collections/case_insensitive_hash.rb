class CaseInsensitiveHash
  def initialize
    @hsh = {}
  end

  def fetch_insensitive(key)
    str_key = key.to_s.downcase
    @hsh[str_key] || 
      @hsh[str_key.upcase] || 
      @hsh[str_key.to_sym] ||
      @hsh[str_key.upcase.to_str]
  end

  def set(key, value)
    @hsh[key] = value
  end

  alias [] fetch_insensitive
  alias []= set
end
