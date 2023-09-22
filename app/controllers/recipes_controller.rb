class RecipesController < ApplicationController
	def index
    @recipes = Recipe.with_ingredients

    if params[:recipes].present?
      @recipes = @recipes.search_by_name(params[:recipes])
    end

    if params[:ingredient].present?
      @recipes = @recipes.with_ingredient(params[:ingredient])
    end

    if @recipes.empty?
      flash.now[:notice] = "No recipes found"
    end
  end
end
