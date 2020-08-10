class ParttimesController < ApplicationController
    def new
        @form = Fulltimeform.new
    end
    def index
        @form = Parttimeform.where(name: current_user.username)
    end
    def create
        @form = Parttimeform.new (params.require(:form).permit(:name,:date,:customer,:income,:description,:note))
        if @form.save
            redirect_to new_parttime_url
        else
            render :new
        end
    end
end
