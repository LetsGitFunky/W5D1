class MaxIntSet
  attr_reader :max, :store
require "byebug"
  def initialize(max)
    @store = Array.new(max+1, false)
    @max = max
  end

  def insert(num)
    raise "Out of bounds" if !num.between?(0, @max)
    @store[num] = true


  end

  def remove(num)
    @store[num] = false
  end

  def include?(num)
    @store[num] == true
  end

  private

  # def is_valid?(num)
  # end

  # def validate!(num)
  # end
end

class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    @store[num % 20].push(num)
  end

  def remove(num)
    @store[num % 20].delete(num)
  end

  def include?(num)
    @store[num % 20].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)

    if !self.include?(num)
      if @count == num_buckets
        self.resize!
      end
      @store[num % num_buckets].push(num) 
      @count += 1

    end
  end

  def remove(num)
    if self.include?(num)
      @store[num % num_buckets].delete(num)
      @count -= 1
    end
  end

  def include?(num)
    @store[num % num_buckets].include?(num)
  end

  private

  def num_buckets
    @store.length
  end

  def resize!
    new_buckets = self.num_buckets * 2
    dupe = @store.dup.flatten
    @store = Array.new(new_buckets) {Array.new}
    dupe.each do |ele|
      @store[ele % new_buckets].push(ele) 
    end

  end

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end
end
