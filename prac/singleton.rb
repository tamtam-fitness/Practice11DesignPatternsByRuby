require 'singleton'

class Python
  include SingleTon
end
  
a = Python.instance

# require 'singleton'

# class SomeSingletonClass
#   include Singleton
# end

# a = SomeSingletonClass.instance