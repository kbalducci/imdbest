class UsersController < ApplicationController
  before_action :set_user, only: [ :show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: :index

  def index
    @users = User.all
    @user = User.first

  def show
    @user = User.find(params[:id])
    posts = Post.all
    @posts = posts.where(user_id:@user_id)
  end

  def new
    @user = User.new
  end

  def delete
  end

  def edit
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save!
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
