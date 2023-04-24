class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
    new_hash = 0
    alpha = (0..self.length).to_a
    self.each_with_index do |ele, idx|
      new_hash += (alpha.index(ele).hash * idx)
    end
    return new_hash
  end
end

class String
  def hash
    new_hash = 0
    alpha = ("a"..'z').to_a
    self.each_char.with_index do |ele, idx|
      new_hash += (alpha.index(ele).hash * idx)
    end
    return new_hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    new_hash = 0
    alpha = ("a"..'z').to_a
    self.each do |key, val|
      new_hash += key.hash * val.to_i.hash
    end
    return new_hash
  end
end
