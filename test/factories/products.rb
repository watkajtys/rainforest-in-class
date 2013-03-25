FactoryGirl.define do 
	factory :product do
		name "Shoes"
		description "Brown Shoes"
		price_in_cents 5500
	end

	factory :cheap_product, :class => Product do
		name "Book"
		description "Has pictures"
		price_in_cents 99
	end


end