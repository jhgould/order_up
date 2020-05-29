require 'rails_helper'

RSpec.describe Chef, type: :feature do
  before :each do
    @jack = Chef.create!(name: "Jack")
    @john = Chef.create!(name: "John")
    @pizza = Dish.create!(name: "Pizza", description: "Pizza", chef_id: "#{@jack.id}")
    @pasta = Dish.create!(name: "Pasta", description: "Pasta", chef_id: "#{@john.id}")
    @cheese = Ingredient.create!(name: "Cheese", calories: 50)
    @meat = Ingredient.create!(name: "Meat", calories: 60)
    @bread = Ingredient.create!(name: "Bread", calories: 40)
    @noodles = Ingredient.create!(name: "Noodles", calories: 40)
    @sauce = Ingredient.create!(name: "Sauce", calories: 20)
  end

  it "user can see dish and ingredients for that dish" do
    DishIngredient.create!(dish_id: @pizza.id, ingredient_id: @cheese.id)
    DishIngredient.create!(dish_id: @pizza.id, ingredient_id: @bread.id)
    DishIngredient.create!(dish_id: @pizza.id, ingredient_id: @meat.id)
    DishIngredient.create!(dish_id: @pizza.id, ingredient_id: @sauce.id)

    DishIngredient.create!(dish_id: @pasta.id, ingredient_id: @sauce.id)
    DishIngredient.create!(dish_id: @pasta.id, ingredient_id: @noodles.id)
    DishIngredient.create!(dish_id: @pasta.id, ingredient_id: @cheese.id)

    visit "/dishes/#{@pizza.id}"

    expect(page).to have_content("#{@pizza.name}")
    expect(page).to have_content("#{@cheese.name}")
    expect(page).to have_content("#{@bread.name}")
    expect(page).to have_content("#{@meat.name}")

  end

end

# I see a list of ingredients for that dish
# and the chef's name
require 'rails_helper'

RSpec.describe Chef, type: :feature do
  before :each do
    @jack = Chef.create!(name: "Jack")
    @john = Chef.create!(name: "John")
    @pizza = Dish.create!(name: "Pizza", description: "Pizza", chef_id: "#{@jack.id}")
    @pasta = Dish.create!(name: "Pasta", description: "Pasta", chef_id: "#{@john.id}")
    @cheese = Ingredient.create!(name: "Cheese", calories: 50)
    @meat = Ingredient.create!(name: "Meat", calories: 60)
    @bread = Ingredient.create!(name: "Bread", calories: 40)
    @noodles = Ingredient.create!(name: "Noodles", calories: 40)
    @sauce = Ingredient.create!(name: "Sauce", calories: 20)
  end

  it "user can see dish and ingredients for that dish" do
    DishIngredient.create!(dish_id: @pizza.id, ingredient_id: @cheese.id)
    DishIngredient.create!(dish_id: @pizza.id, ingredient_id: @bread.id)
    DishIngredient.create!(dish_id: @pizza.id, ingredient_id: @meat.id)
    DishIngredient.create!(dish_id: @pizza.id, ingredient_id: @sauce.id)

    DishIngredient.create!(dish_id: @pasta.id, ingredient_id: @sauce.id)
    DishIngredient.create!(dish_id: @pasta.id, ingredient_id: @noodles.id)
    DishIngredient.create!(dish_id: @pasta.id, ingredient_id: @cheese.id)

    visit "/dishes/#{@pizza.id}"

    expect(page).to have_content("#{@jack.name}")

    expect(page).to have_content("#{@pizza.name}")
    expect(page).to have_content("#{@cheese.name}")
    expect(page).to have_content("#{@bread.name}")
    expect(page).to have_content("#{@meat.name}")
    expect(page).to have_content("#{@sauce.name}")

    expect(page).to_not have_content("#{@noodles.name}")
  end

  it "user can see calories for a dish" do
    DishIngredient.create!(dish_id: @pizza.id, ingredient_id: @cheese.id)
    DishIngredient.create!(dish_id: @pizza.id, ingredient_id: @bread.id)
    DishIngredient.create!(dish_id: @pizza.id, ingredient_id: @meat.id)
    DishIngredient.create!(dish_id: @pizza.id, ingredient_id: @sauce.id)

    visit "/dishes/#{@pizza.id}"
    expect(page).to have_content("Calories: 170")
  end

end
