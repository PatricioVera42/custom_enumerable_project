module Enumerable
  # Your code goes here
  def my_each_with_index
    for i in 0...self.length
      yield(self[i], i)
    end

    self
  end

  def my_select
    res = []
    self.my_each do |element|
      if yield(element)
        res.push(element)
      end
    end

    res
  end

  def my_all?
    self.my_each do |element|
      return false unless yield(element)
    end
    true
  end

  def my_any?
    self.my_each do |element|
      return true if yield(element)
    end
    false        
  end

  def my_none?
    self.my_each do |element|
      return false if yield(element)
    end
    true
  end

  def my_count
    return self.length unless block_given?
    count = 0
    self.my_each {|element| count += 1 if yield(element)}
    count 
  end

  def my_map
    self.my_each_with_index {|element, index| self[index] = yield(element)}
    self
  end

end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    for element in self do
      yield element
    end

    self
  end
end
