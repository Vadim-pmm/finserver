class UserStocksController < ApplicationController
  before_action :set_user_stock, only: [:show, :edit, :update, :destroy]

  def index
    @user_stocks = UserStock.all
  end

  def show
  end

  def new
    @user_stock = UserStock.new
  end

  def edit
  end

  def create
    if params[:stock_id].present?
      @user_stock = UserStock.new(stock_id: params[:stock_id], user: current_user)
    else
      stock = Stock.find_by_ticker(params[:stock_ticker])
      if stock
        @user_stock = UserStock.new(user: current_user, stock: stock)
      else
        stock = Stock.new_from_lookup(params[:stock_ticker])
        if stock.save
          @user_stock = UserStock.new(user: current_user, stock: stock)
        else
          @user_stock = nil
          flash[:error] = 'Stock is not available'
        end
      end
    end


    respond_to do |format|
      if @user_stock.save
        format.html { redirect_to my_portfolio_path,
            notice: "Stock #{@user_stock.stock.ticker} was successfully added" }
        format.json { render :show, status: :created, location: @user_stock}
      else
        format.html { render :new}
        format.json { render json: @user_stock.errors, status: :unprocessable_entity}
      end
    end
  end
  def destroy
    @user_stock.destroy
    respond_to do |format|
      format.html {redirect_to my_portfolio_path, notice: 'Stock was successfully removed from portfolio'}
      format.json { head :no_content}
    end
  end

  private
  def set_user_stock
    @user_stock = UserStock.find(params[:id])
  end

end
