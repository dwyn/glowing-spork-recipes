module RecipeHelper
	def	recipe_image(recipe)
		recipe.photo.present? ? recipe.photo : "spork.png"
	end

	def	author_name(recipe)
	  author(recipe).present? ? author(recipe).name : "Anonymous"
	end

	def	author(recipe)
		User.find(recipe.author_id)
	end
		
	def	created_on(recipe)
    recipe.created_at.strftime("%B %d, %Y")
	end

	def datetime_machine(recipe)
		recipe.created_at.strftime("%Y-%m-%d")
	end

	def	short_description(recipe)
    recipe.description.truncate(40)
	end
end