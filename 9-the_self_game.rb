# ===== THE SELF GAME! =====


# At any given time in Ruby, you are in a binding
# that has local variables and is executing in the context
# of some object (you can access its instance variables and methods).
#
# You can see what object you're in by looking at self.


# on main
self

# in a class
class String
  self
end

# in a method
class String
  def existential
    self
  end
end
"abc".existential

# in a method called by another method
class Example
  def method1
    self
    method2
  end

  def method2
    self
  end
end
Example.new.method1
# This matters because we have access to the same object
# its ivars and methods


class Example
  self

  @abc = 123
  # get ivar
  # what obj is the ivar on?

  def self.method!
    self
    #ivars
  end

  Example.new
  self.new
  new
end

# in a method from a module
module MyModule
  self
  def my_method
    self
  end
end

class Example
  include MyModule
end
Example.new.my_method


# in a block
5.times do |i|
  self
end

class Example
  class << self
    self # => #<Class:#<Object:0x007f983982a400>>
  end
end

# after `class <<`
class << "abc"
  self
end

# when in the inherited value
class A < (p self
           Object)

  # when in a method default value
  def m(a=(p self
           1))
  end
end
A.new.m
