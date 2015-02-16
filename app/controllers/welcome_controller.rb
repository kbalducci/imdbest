class WelcomeController < ApplicationController
protect_from_forgery with: :exception

  def index
    @user = User.first
    @posts = Post.all
    @users = User.all
  end


  def new
    @user = User.new
    @post = Post.new
  end

  def post_post
    @post = Post.new(post_params)
    user = User.find(params[:user_id])
    @post.user_id = user.id
    respond_to do |format|
      if @post.save
        format.html { redirect_to root_path, notice: 'Post was successfully created.' }
        format.json { render json: @post.as_json, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { render posts_index_path, notice: 'User was successfully created.' }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render "home/index" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def set_post
      @post = Post.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:full_name, :user_name)
    end

    def post_params
      params.require(:user).permit(:user_id, :movie_title, :url, :descrition)
    end


end
