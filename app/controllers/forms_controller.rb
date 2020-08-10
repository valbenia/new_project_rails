class FormsController < ApplicationController
    def new
        @form = Fulltimeform.new
    end
    def index
        @form = Fulltimeform.where(name: current_user.username)
    end
    def create
        @form = Fulltimeform.new (params.require(:form).permit(:name,:date,:content,:income))
        if @form.save
            redirect_to new_form_url
        else
            render :new
        end
    end
end
