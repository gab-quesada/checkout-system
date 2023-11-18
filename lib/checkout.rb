class Checkout
	attr_reader :total
	attr_reader :basket

	# Receives the catalogue of product and the promotions
	# The catalogue is an array of products
	def initialize(catalogue, promotions)
		@catalogue = catalogue
		@basket = []
		@promotions = promotions
	end

	# Scan product, find it in the catalogue and add it on basket
	# Calculates the discounts and total every time we scan to be able to print the items any time
	def scan(product_code)
		product = @catalogue.products.find {|p| p.code === product_code}
		raise "Product code '#{product_code}' not found" if product.nil?

		@basket << product
		@calculated_basket = @promotions.apply_promotions(@basket)
		calculate_total
	end

	def print_items()
		puts "ITEM        PRICE"
		puts "----        -----"
		@calculated_basket.each { |product| 
			if product.code 
				puts format("%s         $%.2f", product.code, product.price)
			else
				puts format("      %s  $%.2f", product.name, product.price)
			end
		}
		puts "-----------------"
		puts format("            $%.2f", @total)
	end

	private

	def calculate_total()
		@total = @calculated_basket.reduce(0) {
			|sum, product| sum + product.price
		}
	end

end

