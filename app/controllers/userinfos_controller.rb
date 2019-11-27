class UserinfosController < ApplicationController
  def new
  	@userinfo = User.new
  end

  def create
  	users = User.new(users_params)
  	users.save
  	redirect_to'/users/index'
  end

  private

   def post_params
   	   params.require(:post).permit(:title, :body, :category)
   end
end
