class RoomsController < ApplicationController
    before_action :authenticate_user!
    
    def index
        @user_id = current_user.email
        @rooms = Room.all
    end
    
    def create
        room = Room.create(creator: current_user.id, member: '1')
        Place.create(user_id: current_user.id, room_id: room.id, check: '0')
        redirect_to :root
    end
    
    def join
        room = Room.find(params[:room_id])
        places = room.places
        is_new = true
        places.each do |place|
            if current_user.id == place.user_id
                is_new = false
                break
            end
        end
        if is_new
            room.member += 1
            room.save
            Place.create(user_id: current_user.id, room_id: room.id, check: '0')
        end
        redirect_to :root
    end
    
    def show
        room = Room.find(params[:room_id])
        @count = room.member
        @places = room.places
        @user_id = current_user.id
        @check = room.places.where(check: 1)
    end
end
