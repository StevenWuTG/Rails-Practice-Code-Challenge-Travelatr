class PostsController < ApplicationController
    before_action :set_post, only: [:show, :edit, :update, :like]

    def index
        @posts = Post.all
        render :index
    end

    def show
        render :show
    end

    def new
        @post = Post.new
    end

    def create
        @post = Post.new(post_params)

        if @post.valid?
            @post = Post.create(post_params)
            redirect_to post_path(@post)
        else
            redirect_to new_post_path
        end
    end

    
    def like 
        # byebug
        @post.likes += 1
        @post.save
        redirect_to post_path(@post)
    end


    def edit
        # render :show
    end


    def update
        @post.update(post_params)
        redirect_to post_path(@post)
    end

    private

    def post_params
        params.require(:post).permit(:title, :content, :likes, :blogger_id, :destination_id)
    end

    def set_post
        @post = Post.find(params[:id])
    end

end
