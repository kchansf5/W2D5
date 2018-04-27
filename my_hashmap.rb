require 'byebug'
class MaxIntSet
  attr_reader :store
  def initialize(length)
    @max = length
    @store = Array.new(length) {false}
  end

  def insert(el)
    raise "not enough space!" if el > @max
    if el < @max
      @store[el] = true
    else
      false
    end
  end

  def remove(el)
    raise "cannot remove el because it does not exist!" if @store[el] == false
    @store[el] == false
  end

  def include?(el)
    raise "el is not included!" if el >= @max
    if @store[el] == true
      return true
    else
      return false
    end
  end
end

class IntSet
  attr_reader :store
  def initialize
    @store = Array.new(20) {[]}
  end

  def insert(el)
    bucket = el % 20
    @store[bucket] << el
  end

  def remove(el)

  end

  def include?(el)
    self[el].include?(el)
  end

  def [](el)
    @store[el % 20]
  end
end

class ResizingIntSet

  attr_reader :store

  def initialize
    @store = Array.new(1){[]}
    @insert_count = 0
  end

  def insert(el)
    # debugger
    if @store.length == @insert_count
      @new_store = Array.new(@store.length * 2) {[]}
      new_length = @new_store.length

      @store.each do |bucket|
        bucket.each do |old_el|
          new_bucket = old_el % new_length
          @new_store[new_bucket] << old_el
        end
      end
      new_el_bucket = el % new_length
      @new_store[new_el_bucket] << el
      @store = @new_store
      @insert_count += 1
    else
      bucket = el % @store.length
      @store[bucket] << el
      @insert_count += 1
    end

  end


  def remove(el)
  end

  def include?()
  end

  def [](el)
    @store[el % @store.length]
  end


end











if __FILE__ == $0

b = ResizingIntSet.new
 # b.insert()
# p b.store
# p b.include?(42)
 b.insert(1)
 b.insert(2)
 b.insert(4)
 b.insert(5)
 b.insert(65)
 b.insert(522)
 b.insert(59)
 b.insert(56)
 # b.insert(51)
p b.store
end
