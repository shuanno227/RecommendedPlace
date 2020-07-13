class CurrentPlaceController < ApplicationController
  def current
    @places = Place.all
    gon.places = @places    
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
end
