class Vendor

  attr_reader :name
  attr_accessor :inventory

  def initialize(name)
    @name = name
    @inventory = Hash.new(0)
  end

  def check_stock(fruit)
    @inventory[fruit]
  end

  def stock(fruit, amount)
    @inventory[fruit] += amount
  end
end
