class RecipesController < ApplicationController

	before_action :set_recipe, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user!, except: [:index, :show]
	def index
		@recipes = Recipe.all.order("created_at DESC")
	end

	def new
		@recipe = Recipe.new		
	end

	def create
		@recipe = Recipe.new(recipe_params)
		@recipe.user_id = current_user.id
		if @recipe.save
			redirect_to recipes_path
		else
			render action: "new"
		end
	end

	def show
		
	end

	def edit
		
	end

	def update
		if @recipe.update_attributes(recipe_params)
			redirect_to recipes_path
		else
			render action: "edit"
		end
	end

	def destroy
		@recipe.destroy
		redirect_to recipes_path
	end

	private

	def set_recipe
		@recipe = Recipe.find(params[:id])
	end

	def recipe_params
		params.require(:recipe).permit(:title, :description, :user_id, :image, ingredients_attributes: [:id, :name, :_destroy], directions_attributes: [:id, :step, :_destroy])
	end
end
