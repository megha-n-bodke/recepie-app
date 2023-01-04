class RecipeFoodsController < ApplicationController
  before_action :set_recipe_food, only: %i[edit update destroy]

  def new
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_food = RecipeFood.new
  end

  def edit
    @recipe = Recipe.find(params[:recipe_id])
  end

  def create
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_food = @recipe.recipe_foods.create(recipe_food_params)

    respond_to do |format|
      if @recipe_food.save
        format.html { redirect_to recipe_path(@recipe), notice: 'Recipe food was successfully created.' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_food = RecipeFood.find(params[:id])

    respond_to do |format|
      if @recipe_food.update(recipe_food_params)
        format.html { redirect_to @recipe, notice: 'Recipe food was successfully updated.' }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_food.destroy

    # redirect_to @recipe
    respond_to do |format|
      format.html { redirect_to @recipe, notice: 'Recipe food was successfully destroyed.' }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_recipe_food
    @recipe_food = RecipeFood.find(params[:id])
  end

  def recipe_food_params
    params.require(:recipe_food).permit(:quantity, :food_id)
  end
end
