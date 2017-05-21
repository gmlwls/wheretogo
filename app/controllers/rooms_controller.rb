class RoomsController < ApplicationController
    before_action :authenticate_user!
    
    def index
        @user_id = current_user.email
        @rooms = Room.all
    end
    
    def create
        room = Room.create(creator: current_user.id, member: '1')
        Place.create(user_id: current_user.id, room_id: room.id)
        redirect_to :root
    end
    
    def join
        room = Room.find(params[:room_id])
        if room.creator == current_user.id
            redirect_to :root
        else
            room.member += 1
            room.save
            Place.create(user_id: current_user.id, room_id: room.id)
            redirect_to :root
        end
    end
    
    def show
        room = Room.find(params[:room_id])
        @count = room.member
        @places = room.places
        @user_id = current_user.id
    end
end
