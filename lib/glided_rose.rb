# frozen_string_literal: true

# GlidedRose class update the collection of items
class GlidedRose
  def initialize(items)
    @items = items
  end

  def update_quality
    @items.each(&:update)
  end
end
