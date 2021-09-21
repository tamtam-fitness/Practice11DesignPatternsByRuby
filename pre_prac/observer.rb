# subjecet は行動ごとにobserverにnotifyをする, 
# obserberは勝手にきたイベントをもとに追加の処理をする

class User

  #一対多を実現
  def initialize
    @observers = []
    @stocks = []
    puts "userを作成しました"
  end
  
  def notify
    @observers.each do |observer|
      observer.act(self)
    end
  end

  def attach(observer)
    @observers.append(observer)
    puts "アタッチしました"
  end

  def dettach(observer)
    @observers.delete(observer)
    puts "デタッチしました"
  end

  def buy_stock(ticker)
    unless @stocks.include?(ticker)
      @stocks.append(ticker)
      puts "#{ticker}を追加しました"
      notify
    else
      puts "#{ticker}はすでに購入しています"
    end
  end

  def sell_stock(ticker)
    unless @stocks.include?(ticker)
      @stocks.append(ticker)
      puts "#{ticker}を売りしました"
      notify
    else
      puts "#{ticker}は保有していません"
    end
  end

  def show_stocks
    "#{@stocks}"
  end
  
end

class Observer
  def act
    raise NotImplementedError.new()
  end

end

class Email < Observer

  def act(user)
    puts "現在の銘柄の状況 #{user.show_stocks}"
  end

end

e = Email.new()

u = User.new()

u.attach(e)

u.buy_stock(4384)

u.buy_stock(4385)