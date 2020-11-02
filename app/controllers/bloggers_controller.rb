class BloggersController < ApplicationController
    before_action :set_blogger, only: [:show, :edit, :update]

    def index
        @bloggers = Blogger.all
        render :index
    end

    def show
        render :show
    end

    
    def new
        @blogger = Blogger.new
    end

    def create
        @blogger = Blogger.new(blogger_params)

        if @blogger.valid?
            Blogger.create(blogger_params)
            redirect_to blogger_path(@blogger)
        else
            redirect_to new_blogger_path
        end
    end

    private

    def blogger_params
        params.require(:blogger).permit(:name, :bio, :age)
    end

    def set_blogger
        @blogger = Blogger.find(params[:id])
    end

end
