require 'rails_helper'

describe Item do

  describe "#methods in item class" do
		let(:item_1) {Item.new("+5 Dexterity Vest", 8, 1)}
		let(:item_2) {Item.new("Aged Brie", 3, 6)}
		let(:item_3) {Item.new("Backstage passes to a TAFKAL80ETC concert", 5, 45)}
		let(:item_4) {Item.new("Backstage passes to a TAFKAL80ETC concert", 7, 45)}
		let(:item_5) {Item.new("Backstage passes to a TAFKAL80ETC concert", 12, 45)}
		let(:item_names) {['Aged Brie', 'Backstage passes to a TAFKAL80ETC concert', 'Sulfuras, Hand of Ragnaros']}
		
		it "#initialize create instance for item class" do
			expect(item_1.name).to eq('+5 Dexterity Vest')
		end
		
		it "#to_s object to string representaton" do
			item = Item.new("+5 Dexterity Vest", 8, 1)
			expect(item_1.to_s).to eq("+5 Dexterity Vest, 8, 1")
		end	
		
		it "#decrease_quality " do
			expect(item_1.decrease_quality).to eq 0
		end	
		
		it "#increase_quality" do
			expect(item_1.increase_quality).to eq 2
		end
		
		it "#decrease_sell_in" do
			expect(item_1.decrease_sell_in).to eq 7
		end
		
		it "#check_quality_name - returns true" do
			expect(item_1.check_quality_name(item_names)).to be_truthy 
	
		end
		
		it "#check_quality_name - returns false" do
			expect(item_2.check_quality_name(item_names)).to be_falsey			
		end
		
		it "#check_quality_sell_in - decrease in quality" do
			expect(item_1.check_quality_sell_in).to eq 0 
	
		end
		
		it "#check_quality_sell_in - increase in quality" do 
			expect(item_2.check_quality_sell_in).to eq 7	
		end
		
		it "#check_quality_sell_in - quality =0" do
			expect(item_3.check_quality_sell_in).to eq 0 		
		end
		
		it "#check_sell_in -quality increased by 3" do
			expect(item_3.check_sell_in).to eq 48
		end
		
		it "#check_sell_in -quality increased by 2" do
			expect(item_4.check_sell_in).to eq 47
		end
		
		it "#check_sell_in - no change in quality " do
			expect(item_5.check_sell_in).to eq nil
		end
		
		it "#update - quality decreased" do
			item_1.update
			expect(item_1.quality).to eq 0
		end
	end
end
