class CaseInsensitiveHash
  def initialize
    @hsh = {}
  end

  def fetch_insensitive(key)
    @hsh[key.to_s.downcase.to_sym]
  end

  def set(key, value)
    actual_key = key.downcase.to_sym
    @hsh[actual_key] = value
  end

  alias [] fetch_insensitive
  alias []= set
end
