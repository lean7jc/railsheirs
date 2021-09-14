class HeirsController < ApplicationController
  before_action :set_heir, only: %i[ show edit update destroy ]
  #before_action :athenticate_user!, except: [:index, :show]
  # GET /heirs or /heirs.json
  before_action :correct_user, only: [:edit, :update, :destroy]
  def index
    @heirs = Heir.all
  end

  # GET /heirs/1 or /heirs/1.json
  def show
  end

  # GET /heirs/new
  def new
    #@heir = Heir.new
    @heir = current_user.heirs.build
  end

  # GET /heirs/1/edit
  def edit
  end

  # POST /heirs or /heirs.json
  def create
    #@heir = Heir.new(heir_params)
    @heir = current_user.heirs.build(heir_params)

    respond_to do |format|
      if @heir.save
        format.html { redirect_to @heir, notice: "Heir was successfully created." }
        format.json { render :show, status: :created, location: @heir }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @heir.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /heirs/1 or /heirs/1.json
  def update
    respond_to do |format|
      if @heir.update(heir_params)
        format.html { redirect_to @heir, notice: "Heir was successfully updated." }
        format.json { render :show, status: :ok, location: @heir }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @heir.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /heirs/1 or /heirs/1.json
  def destroy
    @heir.destroy
    respond_to do |format|
      format.html { redirect_to heirs_url, notice: "Heir was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def correct_user
    @heir = current_user.heirs.find_by(id: params[:id])
    redirect_to heirs_path, notice: "Not Authorized To Edit" if @heir.nil?
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_heir
      @heir = Heir.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def heir_params
      params.require(:heir).permit(:first_name, :last_name, :email, :phone_number, :facebook, :user_id)
    end
end
