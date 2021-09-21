class Cut
  def execute
    puts "cut"
  end
end

class Fri
  def execute
    puts "fri"
  end
end

class Boil
  def execute
    puts "boil"
  end
end



class DiContainar
  attr_accessor :cutting
  attr_accessor :boilling
  attr_accessor :fring

  def initialize
    @cutting = Cut.new()
    @boilling = Boil.new()
    @fring = Fri.new()
  end
end

class Facade

  def initialize
    @di = DiContainar.new()
  end

  def execute
    @di.cutting.execute
    @di.fring.execute
    @di.boilling.execute
  end

end


f = Facade.new()
f.execute