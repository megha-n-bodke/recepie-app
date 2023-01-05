class FoodsController < ApplicationController
  before_action :set_food, only: %i[edit update destroy]

  def index
    @foods = Food.includes(:user).all
  end

  def new
    @food = Food.new
  end

  def shopping_list
    @foods = Food.includes(:recipe_foods).where(recipe_foods: { food_id: nil })
    @sum = sumtotal(@foods)
    @qty = quantity_total(@foods)
  end

  def edit; end

  def create
    @food = Food.new(food_params)

    respond_to do |format|
      if @food.save
        format.html { redirect_to foods_url, notice: 'Food was successfully created.' }
        format.json { render :show, status: :created, location: @food }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @food.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /foods/1 or /foods/1.json
  def update
    respond_to do |format|
      if @food.update(food_params)
        format.html { redirect_to food_url(@food), notice: 'Food was successfully updated.' }
        format.json { render :show, status: :ok, location: @food }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @food.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /foods/1 or /foods/1.json
  def destroy
    @food.destroy

    respond_to do |format|
      format.html { redirect_to foods_url, notice: 'Food was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_food
    @food = Food.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price, :quantity, :user_id)
  end

  def sumtotal(obj)
    sum = 0
    obj.each do |val|
      sum += val.price
    end
    sum
  end

  def quantity_total(obj)
    sum = 0
    obj.each do |val|
      sum += val.quantity.to_i
    end
    sum
  end
end
