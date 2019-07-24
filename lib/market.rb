class Market

  attr_reader :name, :vendors

  def initialize(name)
    @name = name
    @vendors = []
  end

  def add_vendor(vendor)
    @vendors << vendor
  end

  def vendor_names
    @vendors.map(&:name)
  end

  def vendors_that_sell(fruit)
    @vendors.select { |vendor| vendor.inventory.has_key? fruit }
  end

  def sorted_item_list
    @vendors.map(&:inventory).map(&:keys).flatten.uniq.sort
  end

  def total_inventory
    total = Hash.new(0)
    @vendors.map(&:inventory)
      .each do |item|
        if total.has_key? item.keys[0]
          total[item.keys[0]] += item[item.keys[0]]
        else
          total.merge! item
        end
      end
    total
  end
end
