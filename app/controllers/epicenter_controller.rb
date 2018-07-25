class EpicenterController < ApplicationController
  before_action :authenticate_user! #, only: [:feed, :now_following] (optional)
  before_action :set_user, only:[:show_user, :following, :followers]

  def feed
  	@following_dares = []

  	Dare.all.each do |dare|
  		if current_user.following.include?(dare.user_id) || current_user.id == dare.user_id

      	@following_dares.push(dare)
  		end
  	end
  end

  def all_users
    @users= User.all 
    @dare = Dare.all
  end

  def following
    
    @users = User.where(id: @user.following)
  end

  def followers
    @user = []

    User.all.each do |u|
      @users.push(u) if u.following.inclcude?(@user.id)
    end

  end


  			

  def show_user
   
  end

  def now_following
    current_user.following.push(params[:id].to_i)
    current_user.save

    redirect_to show_user_path(id: params[:id])
  end

  def unfollow
    current_user.following.delete(params[:id].to_i)
    current_user.save

    redirect_to show_user_path(id: params[:id])
  end


  def set_user
    @user = User.find(params[:id])
  end

end
