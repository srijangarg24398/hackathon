class ResiduesController < ApplicationController
  before_action :set_residue, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_restaurant!,except:[:index,:show]
  # GET /residues
  # GET /residues.json
  def index
    @residues = Residue.all
  end

  # GET /residues/1
  # GET /residues/1.json
  def show
  end

  # GET /residues/new
  def new
    @residue = Residue.new
  end

  # GET /residues/1/edit
  def edit
  end

  # POST /residues
  # POST /residues.json
  def create
    @residue = Residue.new(residue_params_without_time)
    @residue.restaurant_id=current_restaurant.id
    @residue.date=Time.now#.to_s.split(" ")[0]+" "+Time.now.to_s.split(" ")[1]
    if @residue.restaurant==current_restaurant
    respond_to do |format|
      if @residue.save
        format.html { redirect_to @residue, notice: 'Residue was successfully created.' }
        format.json { render :show, status: :created, location: @residue }
      else
        format.html { render :new }
        format.json { render json: @residue.errors, status: :unprocessable_entity }
      end
    end
    end
  end

  # PATCH/PUT /residues/1
  # PATCH/PUT /residues/1.json
  def update
    if @residue.restaurant==current_restaurant
      respond_to do |format|
        if @residue.update(residue_params)
          format.html { redirect_to @residue, notice: 'Residue was successfully updated.' }
          format.json { render :show, status: :ok, location: @residue }
        else
          format.html { render :edit }
          format.json { render json: @residue.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # DELETE /residues/1
  # DELETE /residues/1.json
  def destroy
    if @residue.restaurant==current_restaurant
      @residue.destroy
      respond_to do |format|
        format.html { redirect_to residues_url, notice: 'Residue was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_residue
      @residue = Residue.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def residue_params
      params.require(:residue).permit(:restaurant_id, :date, :description, :discount)
    end
    def residue_params_without_time
      params.require(:residue).permit(:restaurant_id, :description, :discount)
    end
end
