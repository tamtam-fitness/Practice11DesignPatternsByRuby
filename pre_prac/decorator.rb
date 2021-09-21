#ラップする主体と客体の違いやな。decoraterとproxyは。
class Component
end

class Concretecomponet < Component
  def decorate
    puts "-" * 40
  end
end

class Decorater < Component

  def initialize(attribute)
    @componet = attribute[:componet]
  end

  def func
    @componet.decorate

    puts "execute"

    @componet.decorate
  end

end

c = Concretecomponet.new()
d = Decorater.new(componet: c)
d.func