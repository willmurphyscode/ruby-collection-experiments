class CaseInsensitiveHash
  def initialize
    @hsh = {}
  end

  def get(key)
    raise ArgumentError unless key.respond_to?(:to_s)    
    @hsh[key.to_s.downcase.to_sym]
  end

  def set(key, value)
    raise ArgumentError unless key.respond_to?(:to_s)
    actual_key = key.to_s.downcase.to_sym
    @hsh[actual_key] = value
  end

  alias [] get
  alias []= set
end
