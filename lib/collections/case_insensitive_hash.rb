class CaseInsensitiveHash
  def initialize
    @hsh = {}
  end

  def fetch_insensitive(key)
    raise ArgumentError unless key.respond_to?(:to_s)    
    @hsh[key.to_s.downcase.to_sym]
  end

  def set(key, value)
    raise ArgumentError unless key.respond_to?(:to_s)
    actual_key = key.to_s.downcase.to_sym
    @hsh[actual_key] = value
  end

  alias [] fetch_insensitive
  alias []= set
end
