class Payment

  def buy
    raise NotImplementedError.new()
  end

end

class RealMoney < Payment
  def initialize(possession_money)
    @possession_money = possession_money
  end

  def buy(amount)
    @possession_money = @possession_money -amount
    puts "購入金額: #{amount}, 残り: #{@possession_money}"
  end

end

class CreditCard < Payment

  def initialize(possession_money)
    @real_money = RealMoney.new(possession_money)
  end

  def buy(amount)
    puts "問い合わせます"
    puts "照合に成功しました"
    @real_money.buy(amount)

    puts "ログに反映しました"
  end

end

c = CreditCard.new(100)
c.buy(20)