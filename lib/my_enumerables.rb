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
