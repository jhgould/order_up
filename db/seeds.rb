# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


jack = Chef.create!(name: "Jack")
john = Chef.create!(name: "John")
pizza = Dish.create!(name: "Pizza", description: "Pizza", chef_id: "#{jack.id}")
pasta = Dish.create!(name: "Pasta", description: "Pasta", chef_id: "#{john.id}")
appitizer = Dish.create!(name: "Appitizer", description: "appitizer", chef_id: "#{jack.id}")
cheese = Ingredient.create!(name: "Cheese", calories: 50)
meat = Ingredient.create!(name: "Meat", calories: 60)
bread = Ingredient.create!(name: "Bread", calories: 40)
noodles = Ingredient.create!(name: "Noodles", calories: 40)
sauce = Ingredient.create!(name: "Sauce", calories: 20)
garlic = Ingredient.create!(name: "Garlic", calories: 5)
butter = Ingredient.create!(name: "Butter", calories: 50)
DishIngredient.create!(dish_id: pizza.id, ingredient_id: cheese.id)
DishIngredient.create!(dish_id: pizza.id, ingredient_id: bread.id)
DishIngredient.create!(dish_id: pizza.id, ingredient_id: meat.id)
DishIngredient.create!(dish_id: pizza.id, ingredient_id: sauce.id)

DishIngredient.create!(dish_id: pasta.id, ingredient_id: sauce.id)
DishIngredient.create!(dish_id: pasta.id, ingredient_id: noodles.id)
DishIngredient.create!(dish_id: pasta.id, ingredient_id: cheese.id)

DishIngredient.create!(dish_id: appitizer.id, ingredient_id: garlic.id)
DishIngredient.create!(dish_id: appitizer.id, ingredient_id: butter.id)
DishIngredient.create!(dish_id: appitizer.id, ingredient_id: bread.id)
DishIngredient.create!(dish_id: appitizer.id, ingredient_id: sauce.id)
