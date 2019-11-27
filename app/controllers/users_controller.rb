class UsersController < ApplicationController
	before_action :authenticate_user!
	before_action :correct_user,   only: [:edit, :update]
	

	def correct_user
        @user = User.find(params[:id])
        if @user != current_user
        	redirect_to user_path(current_user.id)
        end
    end


	def edit
		@user = User.find(params[:id])
    end

    def update
		@user = User.find(params[:id])
        flash[:notice] = "You have updated user successfully."
  	   if@user.update(user_params)
  	    redirect_to user_path(@user.id)
       else
        @users = User.all
        render :edit
       end
    end
    
    def index
    	@users = User.all
    	@book = Book.new
    end
    
    def show
    	@users = User.all
    	@book = Book.new
    	@user = User.find(params[:id])
    end

    private

    def user_params
   	   params.require(:user).permit(:name, :introduction, :profile_image)
   end
end
