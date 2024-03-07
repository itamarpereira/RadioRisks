class LeukaemiaController < ApplicationController
  before_action :set_leukaemium, only: [:show, :edit, :update] # [:destroy]
  before_action :set_leukaemia, only: [:index, :show]

  # GET /leukaemia
  def index
  end

  # GET /leukaemia/1
  def show
  end

  # GET /leukaemia/new
  def new
    @leukaemium = Leukaemium.new
  end

  # GET /leukaemia/1/edit
  def edit
  end

  # POST /leukaemia
  def create
    @leukaemium = Leukaemium.new(leukaemium_params)

    if @leukaemium.save
      redirect_to @leukaemium, notice: 'leukaemium was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /leukaemia/1
  def update
    if @leukaemium.update(leukaemium_params)
      redirect_to @leukaemium, notice: 'leukaemium was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /leukaemia/1
  # -def destroy
  # -  @leukaemium.destroy
  # -  redirect_to leukaemia_url, notice: 'leukaemium was successfully destroyed.'
  # -end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_leukaemia
    @leukaemia = Leukaemium.all
  end
  
  def set_leukaemium
    @leukaemium = Leukaemium.find(params[:id])
    @exp = 2.718281
    @d = (0.243 * @leukaemium.dose)+(0.271*(@leukaemium.dose ** 2))
    @e = @leukaemium.exposure
    @t = @leukaemium.diagnostic - @e
    if @e <= 20 && @t <= 15
      @rr = 1 + (@d * (@exp ** 4.885))
    elsif @e <= 20 && @t <= 25
      @rr = 1 + (@d * (@exp ** 2.38))
    elsif @e > 20 && @t <= 25
      @rr = 1 + (@d * (@exp ** 2.367))
    elsif @e > 20 && @t <= 30
      @rr = 1 + (@d * (@exp ** 1.638))
    else
      @rr = 1 + @d
    end
    @err = @rr - 1
    @pc = @err / @rr
    #@err_male = (0.45 * @solid.dose)*(2.718281**(-0.026*(@solid.exposure - 25 )))
    #@rr_male = 1 + @err_male
    #@pc_male = (@err_male / @rr_male).round(2) *100
    #@err_female = (0.77 * @solid.dose)*(2.718281**(-0.026*(@solid.exposure - 25 )))
    #@rr_female = 1 + @err_female
    #@pc_female = (@err_female / @rr_female).round(2) *100
  end

  # Only allow a trusted parameter "white list" through.
  def leukaemium_params
    params.require(:leukaemium).permit(:dose, :exposure, :diagnostic, :male_expected_age, :female_expected_age, :incidence)
  end
end
