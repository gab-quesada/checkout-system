class Promotions
	def apply_promotions(basket)
		calculated_basket = basket.clone
		
		promos = [bogo_promo, apple_promo, chai_promo]
		promos.each {|promo| promo.call(calculated_basket)}

		calculated_basket
	end

	def bogo_promo
		lambda { |calculated_basket|
			coffee_count = calculated_basket.count { |item| item.code == "CF1" }
			if coffee_count > 0 && coffee_count.even?
				calculated_basket << Product.new( nil, "BOGO", coffee_count/2 * -11.23 )
			end
		}
	end

	def apple_promo
		lambda { |calculated_basket|
			apple_count = calculated_basket.count { |item| item.code == "AP1" }
			if apple_count > 2
				calculated_basket << Product.new( nil, "APPL", apple_count * -1.50 )
			end
		}
	end

	def chai_promo
		lambda { |calculated_basket|
			if calculated_basket.find { |item| item.code == "CH1" } && calculated_basket.find { |item| item.code == "MK1" } 
				calculated_basket << Product.new( nil, "CHMK", -4.75 )
			end
		}
	end
end
