require 'rails_helper'

RSpec.describe Dish, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :description}
  end
  describe "relationships" do
    it {should belong_to :chef}
  end

  it "model methods" do
    jack = Chef.create!(name: "Jack")
    john = Chef.create!(name: "John")
    pizza = Dish.create!(name: "Pizza", description: "Pizza", chef_id: "#{jack.id}")
    pasta = Dish.create!(name: "Pasta", description: "Pasta", chef_id: "#{john.id}")
    cheese = Ingredient.create!(name: "Cheese", calories: 50)
    meat = Ingredient.create!(name: "Meat", calories: 60)
    bread = Ingredient.create!(name: "Bread", calories: 40)
    noodles = Ingredient.create!(name: "Noodles", calories: 40)
    sauce = Ingredient.create!(name: "Sauce", calories: 20)

    DishIngredient.create!(dish_id: pizza.id, ingredient_id: cheese.id)
    DishIngredient.create!(dish_id: pizza.id, ingredient_id: bread.id)
    DishIngredient.create!(dish_id: pizza.id, ingredient_id: meat.id)
    DishIngredient.create!(dish_id: pizza.id, ingredient_id: sauce.id)

    expect(pizza.total_calories).to eq(170)

  end
end
