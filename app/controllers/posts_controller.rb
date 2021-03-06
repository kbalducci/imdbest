class PostsController < ApplicationController
   before_action :set_post, only: [:show, :edit, :update, :destroy]
   # before_action :authenticate_user!

  def index
    @user = User.first
  end

  def new
    set_user
    set_new_post
  end

  def show
  end

  def edit
  end

  def delete
  end

  def create
    @post = Post.new(post_params)
    user = User.find(params[:user_id])
    @post.user_id = user.id
    respond_to do |format|
      if @post.save
        format.html { redirect_to root_path, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }

      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @post.destroy(post_params)
  end

  private
    def set_post
      @post = Post.find(params[:id])
    end

    def set_user
      @user = User.find(params[:user_id])
    end

    def set_new_post
      @new_post = Post.new
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:movie_title, :url, :descrition, :poster_image, :user_id)
    end
end

