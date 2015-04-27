###
#emulate a subset of Ruby's built-in Hash class
class MyHash

  define_method(:initialize) do
    @hash = []
  end

  #emulate Hash#store
  define_method(:store) do |key, value|
    kp = KeyPair.new(key, value)
    if self.has_key?(key) == false
      @hash.push(kp)
    end
  end

  #emulate Hash#fetch
  define_method(:fetch) do |key|
    @hash.each do |key_value_pair|
      if key == key_value_pair.key
        return key_value_pair.value
      end
    end
    return nil
  end

  #emulate Hash#has_key?
  define_method(:has_key?) do |key|
    @hash.each do |key_value_pair|
      if key == key_value_pair.key
        return true
      end
    end
    return false
  end

  #emulate Hash#has_value?
  define_method(:has_value?) do |value|
    @hash.each do |key_value_pair|
      if value == key_value_pair.value
        return true
      end
    end
    return false
  end

  #emulate Hash#length
  define_method(:length) do
    return @hash.length()
  end

  ###
  #sub-class to contain (and return) a single key-value pair
  class KeyPair
    #init requiring a key and value
    define_method(:initialize) do |key, value|
      @key = key
      @value = value
    end

    #return the key
    define_method(:key) do
      @key
    end

    #return the value
    define_method(:value) do
      @value
    end
  end

end
