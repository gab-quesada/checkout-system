require 'checkout'
require 'promotions'
require 'product'
require 'catalogue'

RSpec.describe Checkout, "#checkout" do
  before do
    @catalogue = Catalogue.new
    @promotions = Promotions.new
    @checkout = Checkout.new(@catalogue, @promotions)
  end

  it "Product code not found" do
    expect { @checkout.scan('---') }.to raise_error("Product code '---' not found")
  end

  it "Test case #1" do
    @checkout.scan('CH1')
    @checkout.scan('AP1')
    @checkout.print_items()
    @checkout.scan('CF1')
    @checkout.scan('MK1')
    @checkout.print_items()
    expect(@checkout.total).to eq(20.34)
  end

  it "Test case #2" do
    @checkout = Checkout.new(@catalogue, @promotions)
    @checkout.scan('MK1')
    @checkout.scan('AP1')
    expect(@checkout.total).to eq(10.75)
  end

  it "Test case #3" do
    @checkout = Checkout.new(@catalogue, @promotions)
    @checkout.scan('CF1')
    @checkout.scan('CF1')
    expect(@checkout.total).to eq(11.23)
  end

  it "Test case #4" do
    @checkout = Checkout.new(@catalogue, @promotions)
    @checkout.scan('AP1')
    @checkout.scan('AP1')
    @checkout.scan('CH1')
    @checkout.scan('AP1')
    expect(@checkout.total).to eq(16.61)
  end
end