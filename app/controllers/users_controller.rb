class UsersController < ApplicationController
	
	def new
		@user = User.new
	end

	def create
		@user = User.new(params[:user])
		if @user.save
			flash[:notice] = "Signup was a success!"
			redirect_to products_path
		else
			render :action => :new
		end
	end
end
