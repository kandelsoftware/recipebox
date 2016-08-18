class RecipesController < ApplicationController
  before_action :set_recipe, only:[:show,:edit,:update,:destroy]
  def index    
    @recipes=Recipe.all.order("created_at DESC")
  end

  def show
    
  end


  def new
    @recipe=Recipe.new
  end

  def create
    @recipe=Recipe.new(recipe_params)
    if @recipe.save
     redirect_to @recipe,notice: "Recipe is created Successfully"
   else
    render :new
  end
  end
  def edit
    
  end
  def update
   if  @recipe.update(recipe_params)
    redirect_to @recipe, notice: "Recipe is update successfully"
   else
    render :edit
   end
  end
  def destroy
     @recipe.destroy
     redirect_to root_path, notice: "Recipe is deleted successfully"
  end
  private 

  def set_recipe
    @recipe=Recipe.find(params[:id])
  end
  def recipe_params
    params.require(:recipe).permit(:title,:description,:image)
  end

end
