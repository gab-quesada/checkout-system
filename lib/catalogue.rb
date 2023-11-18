class Catalogue
	attr_accessor :products

	def initialize()
		chai = Product.new("CH1", "Chai", 3.11)
    apple = Product.new("AP1", "Apples", 6.00)
    coffee = Product.new("CF1", "Coffee", 11.23)
    milk = Product.new("MK1", "Milk", 4.75)
    @products = [
      chai, apple, coffee, milk
    ]
	end
end
