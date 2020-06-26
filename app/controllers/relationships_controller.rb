class RelationshipsController < ApplicationController

	def create
		user = User.find(params[:follow_id])
		following = current_user.follow(user)
		if following.save
			flash[:success] = 'フォローしました'
			redirect_to user
		else
			flash.now[:alert] = 'フォローに失敗'
			redirect_to user
		end
	end

	def destroy
		user = User.find(params[:follow_id])
		following = current_user.unfollow(user)
		if following.destroy
			flash[:success] = 'フォローを解除'
			redirect_to user
		else
			flash.now[:alert] = 'フォロー解除に失敗しました'
			redirect_to user
		end
	end
end