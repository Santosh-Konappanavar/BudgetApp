class CategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_user!, except: %i[new create]
  before_action :authenticate_user!, except: [:show]

  def index
    @categories = current_user.categories
  end

  def show
    @category = Category.find(params[:id])
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to categories_path, notice: 'Category created successfully.'
    else
      render :new
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to categories_path, notice: 'Category was successfully deleted.'
  end

  private

  def category_params
    params.require(:category).permit(:name, :icon)
  end
end
