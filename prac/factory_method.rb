class IMapApiFactory

  attr_reader :product

  def create(attributes)
    @product = create_product
    register(attributes)
    return @product
  end

  protected
  def create_product
  end

  def register
  end

end

class IMapApiProduct
  def call
  end
  
end


class GooleMapApiFactory < IMapApiFactory
  # attr_reader :googe_product

  def create_product
    google_product = GoogleMapApiProduct.new()
    google_product
  end

  def register(attributes)
    token = attributes[:token]

    googe_product.token = token
    googe_product
  end
end

class GoogleMapApiProduct < IMapApiProduct
  attr_accessor :token

  def call
    print("apiを叩きました。#{@token}")
    
    return {status: 200}
  end
end

class YahooMapApiFactory < IMapApiFactory
  # attr_reader :googe_product

  def create_product
    yahoo_product = YahooMapApiProduct.new()
    yahoo_product
  end

  def register(attributes)
    yahoo_id = attributes[:yahoo_id]

    yahoo_product.yahoo_id = yahoo_id
    yahoo_product
  end
end


class YahooMapApiProduct < IMapApiProduct
  attr_accessor :yahoo_id

  def call
    print("apiを叩きました。#{@yahoo_id}")
    return {status: 200}
  end
end

##############

# g_f = GooleMapApiFactory.new()

# attributes = {
#   token: "fefd"
# }
# g_p = g_f.create(attributes)
# results = g_p.call

y_f = YahooMapApiFactory.new()

attributes = {
  yahoo_id: 3
}
y_p = y_f.create(attributes)
results = y_p.call
results