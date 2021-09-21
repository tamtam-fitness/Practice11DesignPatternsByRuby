# NotImplementedError.new()
class Printing

  def order
    if check?
      puts "コチラの商品を購入します"
      buy
    else
      puts "発注できませんでした"
    end  
  end
  
  private
  def check?
    raise NotImplementedError.new()
  end

  def buy
    raise NotImplementedError.new()
  end

end

class PrintingForPamphlet < Printing

  def initialize(attribute)
    @pamphlet_data = attribute[:pamphlet_data]
  end

  private
  def check?
    @pamphlet_data != nil
  end

  def buy
    puts "#{@pamphlet_data}を購入しました"
  end
  
end


p = PrintingForPamphlet.new(pamphlet_data: "光沢紙の24ページのパンフ")
p.order