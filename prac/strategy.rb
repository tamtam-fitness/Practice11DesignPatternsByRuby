## context , strategy stategyをコンポジションつおしてcontextが持ってやる

class IsuconStategy

  def attempt
    measure
    improve
  end


  private
  def measure
    NotImplementedError.new()
  end

  def improve
    NotImplementedError.new()
  end

end

class DbStrateby < IsuconStategy

  def measure(score)
    puts "#現在のスコア: #{score}"
  end

  def improve(score)
    puts "改善しました"
    score + 300
  end

end

class Context

  def initialize(attribute)
    @i_strategy = attribute[:i_strategy]
    @score = attribute[:score]
  end

  def compete
    @i_strategy.measure(@score)
    @score = @i_strategy.improve(@score)
    puts @score 
  end

end

ds = DbStrateby.new()
c = Context.new(i_strategy: ds, score: 420)
c.compete

c.compete
c.compete
