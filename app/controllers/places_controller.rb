class PlacesController < ApplicationController
  before_action :authenticate_user!
  
  def create
    place = Place.find_by(room_id: params[:room_id],user_id: params[:user_id])
    place.lat = params[:lat]
    place.lng = params[:lon]
    place.check = 1
    place.save
    
    redirect_to :back
  end
  
  def refresh
    place = Place.find_by(room_id: params[:room_id],user_id: current_user.id)
    place.check = 0
    place.save
    
    redirect_to :back
  end
end
