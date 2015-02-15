class UsersController < ApplicationController
  before_action :authenticate_user!, except: :home

  def show
    User.find(params[:id])
    @user = User.find(params[:id])
    posts = Post.all
    @posts = posts.where(user_id:@user_id)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
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


    def user_params
      params.require(:user).permit(:full_name, :user_name)
    end
end
