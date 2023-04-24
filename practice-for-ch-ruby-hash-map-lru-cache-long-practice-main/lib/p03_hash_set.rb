class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    if !self.include?(key)
      if @count == num_buckets
        self.resize!
      end
      @store[key.hash % num_buckets].push(key)
      @count += 1
    end
  end

  def include?(key)
    @store[key.hash % num_buckets].include?(key)
  end

  def remove(key)
    if self.include?(key)
      @store[key.hash % num_buckets].delete(key)
      @count -= 1
    end
  end

  private

  def num_buckets
    @store.length
  end

  def resize!
    new_buckets = self.num_buckets * 2
    dupe = @store.dup.flatten
    @store = Array.new(new_buckets) {Array.new}
    dupe.each do |key|
      @store[key.hash % new_buckets].push(key)
    end
  end

end