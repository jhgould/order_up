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
    @appitizer = Dish.create!(name: "Appitizer", description: "appitizer", chef_id: "#{@jack.id}")
    @cheese = Ingredient.create!(name: "Cheese", calories: 50)
    @meat = Ingredient.create!(name: "Meat", calories: 60)
    @bread = Ingredient.create!(name: "Bread", calories: 40)
    @noodles = Ingredient.create!(name: "Noodles", calories: 40)
    @sauce = Ingredient.create!(name: "Sauce", calories: 20)
    @garlic = Ingredient.create!(name: "Garlic", calories: 5)
    @butter = Ingredient.create!(name: "Butter", calories: 50)
    DishIngredient.create!(dish_id: @pizza.id, ingredient_id: @cheese.id)
    DishIngredient.create!(dish_id: @pizza.id, ingredient_id: @bread.id)
    DishIngredient.create!(dish_id: @pizza.id, ingredient_id: @meat.id)
    DishIngredient.create!(dish_id: @pizza.id, ingredient_id: @sauce.id)

    DishIngredient.create!(dish_id: @pasta.id, ingredient_id: @sauce.id)
    DishIngredient.create!(dish_id: @pasta.id, ingredient_id: @noodles.id)
    DishIngredient.create!(dish_id: @pasta.id, ingredient_id: @cheese.id)

    DishIngredient.create!(dish_id: @appitizer.id, ingredient_id: @garlic.id)
    DishIngredient.create!(dish_id: @appitizer.id, ingredient_id: @butter.id)
    DishIngredient.create!(dish_id: @appitizer.id, ingredient_id: @bread.id)
    DishIngredient.create!(dish_id: @appitizer.id, ingredient_id: @sauce.id)
  end

    it "user visits chef show page" do
      visit "/chefs/#{@jack.id}"

      expect(page).to have_content("Chef #{@jack.name}")
      click_link "Ingredients"

      expect(current_path).to eq("/chefs/#{@jack.id}/ingredients")
      expect(page).to have_content("#{@cheese.name}")
      expect(page).to have_content("#{@bread.name}")
      expect(page).to have_content("#{@meat.name}")
      expect(page).to have_content("#{@sauce.name}")

      visit "/chefs/#{@john.id}"

      expect(page).to have_content("Chef #{@john.name}")
      click_link "Ingredients"

      expect(current_path).to eq("/chefs/#{@john.id}/ingredients")
      expect(page).to have_content("#{@cheese.name}")
      expect(page).to have_content("#{@sauce.name}")
      expect(page).to have_content("#{@noodles.name}")
      expect(page).to_not have_content("#{@meat.name}")
      expect(page).to_not have_content("#{@bread.name}")




    end
end
