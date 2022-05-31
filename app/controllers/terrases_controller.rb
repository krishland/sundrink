class TerrasesController < ApplicationController
  before_action :set_terrase, only: %i[ show edit update destroy ]

  # GET /terrases or /terrases.json
  def index
    @terrases = Terrase.all

    # the `geocoded` scope filters only flats with coordinates (latitude & longitude)
    @markers = @terrases.geocoded.map do |terrase|
      {
        lat: terrase.latitude,
        lng: terrase.longitude,
        info_window: render_to_string(partial: "info_window", locals: { terrase: terrase })
      }
    end
  end

  # GET /terrases/1 or /terrases/1.json
  def show
  end

  # GET /terrases/new
  def new
    @terrase = Terrase.new
  end

  # GET /terrases/1/edit
  def edit
  end

  # POST /terrases or /terrases.json
  def create
    @terrase = Terrase.new(terrase_params)

    respond_to do |format|
      if @terrase.save
        format.html { redirect_to terrase_url(@terrase), notice: "Terrase was successfully created." }
        format.json { render :show, status: :created, location: @terrase }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @terrase.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /terrases/1 or /terrases/1.json
  def update
    respond_to do |format|
      if @terrase.update(terrase_params)
        format.html { redirect_to terrase_url(@terrase), notice: "Terrase was successfully updated." }
        format.json { render :show, status: :ok, location: @terrase }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @terrase.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /terrases/1 or /terrases/1.json
  def destroy
    @terrase.destroy

    respond_to do |format|
      format.html { redirect_to terrases_url, notice: "Terrase was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_terrase
      @terrase = Terrase.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def terrase_params
      params.require(:terrase).permit(:name, :address)
    end
end
