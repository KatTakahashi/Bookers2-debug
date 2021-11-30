class RelationshipsController < ApplicationController

  def create
    user = User.find(params[:user_id])        #自分をフォローできないようにするための代入
    unless user == current_user               #自分をフォローできないように条件分岐　※viewにも記載
    current_user.follow(params[:user_id])
      redirect_to request.referer
    end
  end

  def destroy
    current_user.unfollow(params[:user_id])
    redirect_to request.referer
  end

  # フォロー一覧
  def followings
    user = User.find(params[:user_id])
    @users = user.followings
  end
  # フォロワー一覧
  def followers
    user = User.find(params[:user_id])
    @users = user.followers
  end

end
