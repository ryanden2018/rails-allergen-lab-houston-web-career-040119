# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Recipe.destroy_all
Ingredient.destroy_all
User.destroy_all
RecipeIngredient.destroy_all
UserIngredient.destroy_all

i1 = Ingredient.create(name:"Tomato")
i2 = Ingredient.create(name:"Orange peel")
i3 = Ingredient.create(name:"Salt")
i4 = Ingredient.create(name:"Pepper")
i5 = Ingredient.create(name:"Cayenne")
i6 = Ingredient.create(name:"Eggs")
i7 = Ingredient.create(name:"Milk")
i8 = Ingredient.create(name:"Flour")
i9 = Ingredient.create(name:"Sugar")
i10 = Ingredient.create(name:"Butter")
i11 = Ingredient.create(name:"Celery")
i12 = Ingredient.create(name:"Carrot")
i13 = Ingredient.create(name:"Olive oil")
i14 = Ingredient.create(name:"Soy sauce")
i15 = Ingredient.create(name:"Vinegar")

u1 = User.create(name:"Tom")
u2 = User.create(name:"Dick")
u3 = User.create(name:"Harry")
u4 = User.create(name:"Carrie")
u5 = User.create(name:"Susan")
u6 = User.create(name:"Samantha")

UserIngredient.create(user_id:u1.id,ingredient_id:i10.id)
UserIngredient.create(user_id:u3.id,ingredient_id:i15.id)
UserIngredient.create(user_id:u3.id,ingredient_id:i7.id)
UserIngredient.create(user_id:u6.id,ingredient_id:i10.id)
