class Api::V1:: UsersController < ApplicationController

  
    def index
      @users = User.all
      render json: @users
    end
  
    def show
      @user = User.find(params[:id])
    end
  
    def new
      @user = User.new 
      
    end

    def create 
        @user = User.new({name: params[:name], email: params[:email], password: params[:password]})
    
        if @user.save
      
            render json: @user
      
            else
              redirect_to api_v1_users_path 
            end 
    
    end 

    private 

    def user_params 
      params.require(:user).permit(:name, :email, :password)
    end 

end