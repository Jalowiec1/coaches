class AbilitiesController < ApplicationController
  before_action :set_ability, only: [:show, :edit, :update, :destroy]
  before_action :set_user
  def set_user
    @user = User.find(params[:user_id])
  end
  # GET /abilities
  # GET /abilities.json
  def index
    @abilities = @user.abilities
  end

  # GET /abilities/1
  # GET /abilities/1.json
  def show
  end

  # GET /abilities/new
  def new
    @ability = Ability.new
  end

  # GET /abilities/1/edit
  def edit
  end

  # POST /abilities
  # POST /abilities.json
  def create
    @ability = @user.abilities.build(ability_params)
  
      respond_to do |format|
        if @ability.save
          format.html { redirect_to user_abilities_path(@user) }
          flash[:success] = "Ability created!"
          format.json { render :show, status: :created, location: @ability }
        else
          format.html { render :new }
          format.json { render json: @ability.errors, status: :unprocessable_entity }
        end
      end
  end

  # PATCH/PUT /abilities/1
  # PATCH/PUT /abilities/1.json
  def update
    respond_to do |format|
      if @ability.update(ability_params)
        format.html { redirect_to user_abilities_path(@user) }
        flash[:success] = "Ability updated!"
        format.json { render :show, status: :ok, location: @ability }
      else
        format.html { render :edit }
        format.json { render json: @ability.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /abilities/1
  # DELETE /abilities/1.json
  def destroy
    @ability.destroy
    respond_to do |format|
      format.html { redirect_to abilities_url }
      flash[:success] = "Ability deleted!"
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ability
      @ability = Ability.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ability_params
      params.require(:ability).permit(:name, :value, :notice)
    end
end
