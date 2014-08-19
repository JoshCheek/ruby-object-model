## Object Model notes:

```
start with classes and instances
Classes
  store instance methods
  have a superclass pointer
Instances
  store instance variables
  have a class pointer
Classes are also instances (of Class)
Method lookup
  when you invoke a method on an instance
  start by going to its class
  until you find the method, go to the superclass
  once you find it, create a scope for that object
  and run the code for the method in that scope
Scopes/Bindings
  all code executes in a scope
  store local variables
  they have a self (an instance that they are operating in)
  this gives them access to instance variables
  they can call methods on that object
```

## Underneath the magic:

What are C classes and objects underneath the magic?
https://github.com/ruby/ruby/blob/65a5162550f58047974793cdc8067a970b2435c0/ruby.h#L218-233

## Example to use for review of lessons 0 through 4

```ruby
class HasExtraStuff
  def get_name
    @name
  end

  def get_binding
    binding
  end
end

class Person < HasExtraStuff
  def initialize(name)
    @name = name
  end

  def get_initial
    get_name[0]
  end
end

joshs_name = "Josh"
josh = Person.new(joshs_name)
josh.get_name                 # => "Josh"
josh.get_initial              # => "J"
josh.get_binding.eval('self') # => #<Person:0x007fe6348454f0 @name="Josh">
```
