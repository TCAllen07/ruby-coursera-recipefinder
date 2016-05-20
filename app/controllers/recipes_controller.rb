class RecipesController < ApplicationController
  def index
    # URL format: root/recipes/index?search=swiss
    # Check if request parameter 'search' was passed
    # use 'search' term as keyword if supplied, default to 'chocolate'
    @search_term = params[:search] || 'chocolate'
    @recipes = Recipe.search_for(@search_term)
  end
end
