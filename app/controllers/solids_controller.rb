class SolidsController < ApplicationController
  before_action :set_solid, only: [:show, :edit, :update] # [:destroy]
  before_action :set_solids, only: [:index, :show]

  # GET /solids
  def index
  end

  # GET /solids/1
  def show
  end

  # GET /solids/new
  def new
    @solid = Solid.new
  end

  # GET /solids/1/edit
  def edit
  end

  # POST /solids
  def create
    @solid = Solid.new(solid_params)

    if @solid.save
      redirect_to @solid, notice: 'solid was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /solids/1
  def update
   if @solid.update(solid_params)
     redirect_to @solid, notice: 'solid was successfully updated.'
   else
     render :edit
   end
  end

  # DELETE /solids/1
  # -def destroy
  # -  @solid.destroy
  # -  redirect_to solids_url, notice: 'solid was successfully destroyed.'
  # -end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_solids
    @solids = Solid.all
  end
  
  def set_solid
    @solid = Solid.find(params[:id])
    @err_male = (0.45 * @solid.dose)*(2.718281**(-0.026*(@solid.exposure - 25 )))
    @rr_male = 1 + @err_male
    @pc_male = (@err_male / @rr_male).round(4) *100
    @err_female = (0.77 * @solid.dose)*(2.718281**(-0.026*(@solid.exposure - 25 )))
    @rr_female = 1 + @err_female
    @pc_female = (@err_female / @rr_female).round(4) *100
    if @solid.incidence.present? && @solid.male_expected_age.present? && @solid.female_expected_age.present?
      @lle_male = @err_male * @solid.incidence * (@solid.male_expected_age - @solid.exposure) / 360
      @lle_female = @err_female * @solid.incidence * (@solid.female_expected_age - @solid.exposure) / 360
      @vinte_male = (0.45 * @solid.dose)*(2.718281**(-0.026*(20 - 25 ))) * @solid.incidence * (@solid.male_expected_age - 20) / 360
      @trinta_male = (0.45 * @solid.dose)*(2.718281**(-0.026*(30 - 25 ))) * @solid.incidence * (@solid.male_expected_age - 30) / 360
      @quarenta_male = (0.45 * @solid.dose)*(2.718281**(-0.026*(40 - 25 ))) * @solid.incidence * (@solid.male_expected_age - 40) / 360
      @cinquenta_male = (0.45 * @solid.dose)*(2.718281**(-0.026*(50 - 25 ))) * @solid.incidence * (@solid.male_expected_age - 50) / 360
      @vinte_female = (0.77 * @solid.dose)*(2.718281**(-0.026*(20 - 25 ))) * @solid.incidence * (@solid.female_expected_age - 20) / 360
      @trinta_female = (0.77 * @solid.dose)*(2.718281**(-0.026*(30 - 25 ))) * @solid.incidence * (@solid.female_expected_age - 30) / 360
      @quarenta_female = (0.77 * @solid.dose)*(2.718281**(-0.026*(40 - 25 ))) * @solid.incidence * (@solid.female_expected_age - 40) / 360
      @cinquenta_female = (0.77 * @solid.dose)*(2.718281**(-0.026*(50 - 25 ))) * @solid.incidence * (@solid.female_expected_age - 50) / 360
    end
  end

  # Only allow a trusted parameter "white list" through.
  def solid_params
    params.require(:solid).permit(:gender, :dose, :exposure, :male_expected_age, :female_expected_age, :incidence)
  end  
end
