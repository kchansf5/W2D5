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















if __FILE__ == $0



end
