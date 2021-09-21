class Car
  attr_accessor :speed
  def initialize(speed)
    @speed = speed
  end

  def run
    puts "走ります, 現在のスピード:#{@speed}"
  end

end

class Acceleration
  def more_run
    raise NotImplementedError.new()
  end
end

class ABitOfAcceleration < Acceleration
  def initialize(speed)
    @car= Car.new(speed)
  end


  def more_run
    @car.run
    puts "ちょっとはやくなります:#{@car.speed * 1.5}"
  end
end

a = ABitOfAcceleration.new(40)
a.more_run