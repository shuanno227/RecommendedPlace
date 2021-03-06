class PlacesController < ApplicationController
  before_action :set_place, only: [:show, :edit, :update, :destroy]
  # before_action :move_to_index, except: [:index, :show]
  # GET /places
  # GET /places.json
  def index
    if params[:key]
      @places = Place.where('name LIKE? OR description LIKE?', "%#{params[:key]}%", "%#{params[:key]}%").includes(:user).order("created_at DESC")
      # @places = current_user.places
    else
      places = Place.includes(:user)
      @places = current_user.places.order("created_at DESC")
    end
  end

  # GET /places/1
  # GET /places/1.json
  def show
    @place = Place.find(params[:id]) #showページを開いた地点のデータを取得
    gon.place = @place
    @places = Place.where.not(id: @place.id)  #@placeのid以外のデータを取得
    gon.places = @places
    
    @lat = @place.latitude
    @lng = @place.longitude
    gon.lat = @lat
    gon.lng = @lng
    gon.lats = []
    gon.lngs = []
    @places.each do |places|
      gon.lats << places.latitude
      gon.lngs << places.longitude
    end
    @hash = Gmaps4rails.build_markers(@place) do |place, marker|
      marker.lat place.latitude
      marker.lng place.longitude
      marker.infowindow place.name
    end
    
  end

  # GET /places/new
  def new
    @place = Place.new
  end

  # GET /places/1/edit
  def edit
  end

  # POST /places
  # POST /places.json
  def create
    @place = Place.new(place_params)

    respond_to do |format|
      if @place.save
        format.html { redirect_to "/places", notice: 'Place was successfully created.' }
        format.json { render :show, status: :created, location: @place }
      else
        format.html { render :new }
        format.json { render json: @place.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /places/1
  # PATCH/PUT /places/1.json
  def update
    respond_to do |format|
      if @place.update(place_params)
        format.html { redirect_to "/places", notice: 'Place was successfully updated.' }
        format.json { render :show, status: :ok, location: @place }
      else
        format.html { render :edit }
        format.json { render json: @place.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /places/1
  # DELETE /places/1.json
  def destroy
    @place = Place.find(params[:id])
    @place.destroy
    respond_to do |format|
      format.html { redirect_to places_url, notice: 'Place was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_place
      @place = Place.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def place_params
      params.require(:place).permit(:name, :description, :latitude, :longitude, :image).merge(user_id: current_user.id)
    end

    # def move_to_index
    #   redirect_to action: :index unless user_signed_in?
    # end
end
