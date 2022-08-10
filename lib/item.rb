# frozen_string_literal: true

# Item class with name, sell_in, quality as attributes
class Item
  attr_accessor :name, :sell_in, :quality

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def to_s
    "#{@name}, #{@sell_in}, #{@quality}"
  end

  def decrease_quality
    self.quality -= 1
  end

  def increase_quality
    self.quality += 1
  end

  def decrease_sell_in
    self.sell_in -= 1
  end

  def check_quality_name(names)
    !names.include?(name) && self.quality.positive?
  end

  def check_quality_sell_in
    if name != item_names[0]
      if name != item_names[1]
        decrease_quality if check_quality_name(item_names[2])
      else
        self.quality = 0
      end
    elsif self.quality < 50
      increase_quality
    end
  end

  def update
    if check_quality_name(item_names)
      decrease_quality
    elsif self.quality < 50
      check_sell_in
    end
    decrease_sell_in if name != item_names[2]
    check_quality_sell_in if sell_in.negative?
  end

  def check_sell_in
    increase_quality
    if self.sell_in < 6 && name == item_names[1]
      return self.quality += 2 if self.quality < 49
      return self.quality += 1 if self.quality < 50
    end
    return increase_quality if self.sell_in < 11 && name == item_names[1] && self.quality < 50
  end

  def item_names
    ['Aged Brie', 'Backstage passes to a TAFKAL80ETC concert', 'Sulfuras, Hand of Ragnaros']
  end
end
