require 'rails_helper'

describe GlidedRose do

  describe "#update_quality" do
		let(:item_1) {Item.new("+5 Dexterity Vest",-10, 1)}
		let(:item_2) {Item.new("Aged Brie", 2, 4)}
		let(:item_3) {Item.new("Conjured Mana Cake", 3, 6)}
		let(:item_4) {Item.new("Sulfuras, Hand of Ragnaros", 0 ,80)}
		let(:item_5) {Item.new("Sulfuras, Hand of Ragnaros", -1 ,80)}
		let(:item_6) {Item.new("Backstage passes to a TAFKAL80ETC concert", 15, 20)}
		let(:item_7) {Item.new("Backstage passes to a TAFKAL80ETC concert", 10, 45)}
		let(:item_8) {Item.new("Backstage passes to a TAFKAL80ETC concert", 5, 45)}
		let(:item_9) {Item.new("Backstage passes to a TAFKAL80ETC concert", 5, 49)}
		
		it "Quality is never negative - sell in negative" do
			items = GlidedRose.new([item_1, item_5 ]).update_quality()
      expect(items.map(&:quality)).to eq [0, 80]
			expect(items.size).to eq(2)			
    end
		
		it "Aged Brie increases in Quality" do
      items = GlidedRose.new([item_2]).update_quality()
			expect(items.first.quality).to eq 5
    end
		
    it "Conjured decrease the quality" do
      items = GlidedRose.new([item_3]).update_quality()
      expect(items.first.sell_in).to eq 2
			expect(items.first.quality).to eq 5
		end
		
    it "Sulfuras no decrease in quality" do
      items = GlidedRose.new([item_4]).update_quality()
 			expect(items.first.quality).to eq 80		
    end
		
		it "Quality increases by 2 , sell_in < 9 and by 3 sell_in < 6" do
      items = GlidedRose.new([item_6, item_7, item_8,item_9]).update_quality()
      expect(items.map(&:sell_in)).to eq [14,9,4,4]
			expect(items.map(&:quality)).to eq [21,47,48,50]
    end		
  end	
end
