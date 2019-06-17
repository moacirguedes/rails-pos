class PurchasesController < ApplicationController
  before_action :set_products
  before_action :set_purchases, only: [:show, :edit, :update, :destroy]

  # GET /purchases
  # GET /purchases.json
  def index
    @purchases = current_user.purchases.all
  end

  # GET /purchases/1
  # GET /purchases/1.json
  def show
  end

  # GET /purchases/new
  def new
    @purchase = Purchase.new
  end

  # GET /purchases/1/edit
  def edit
  end

  # POST /purchases
  # POST /purchases.json
  def create
    @purchases = current_user.profile.purchases.new(purchases_params)

    respond_to do |format|
      if @purchases.save
        format.html { redirect_to purchases_url, notice: 'Purchase created with success.' }
        format.json { render :show, status: :created, location: @purchases }
      else
        format.html { render :new }
        format.json { render json: @purchases.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /purchases/1
  # PATCH/PUT /purchases/1.json
  def update
    respond_to do |format|
      if @purchases.update(purchases_params)
        format.html { redirect_to purchases_url, notice: 'Purchase altered with success.' }
        format.json { render :show, status: :ok, location: @purchases }
      else
        format.html { render :edit }
        format.json { render json: @purchases.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /purchases/1
  # DELETE /purchases/1.json
  def destroy
    @purchases.destroy
    respond_to do |format|
      format.html { redirect_to purchases_url, notice: 'Purchase deleted with success.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.

    def set_products
      @products = Product.all
    end

    def set_purchases
      @purchases = Purchase.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def purchases_params
      params.require(:purchases).permit(:description, :was_bought, :profile_id, product_purchases_attributes: [:name, :id, :_destroy, :product_id])
    end
end
