class DosesController < ApplicationController
  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
  end

  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose.ingredient = Ingredient.find(params[:ingredient_id])
    @dose = Dose.new(dose_params)

    @dose.cocktail = Cocktail.find(params[:cocktail_id])
    @dose.save
    if @dose.save
      redirect_to cocktail_path(@dose.cocktail)
    else
      render :new
    end
  end

  private

  def dose_params
    params.require(:dose).permit(:amount, :description)
  end
end