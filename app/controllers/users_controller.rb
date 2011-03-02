class UsersController < ApplicationController
	layout "application"
	before_filter :login_required, :except => [:new, :create]
	#not sure we want :except => [:new, :create]
	
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
	
	@user.save!
    if @user.save
	  redirect_to root_url, :notice => "New User created"
    else
      render :action => 'new'
    end
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update_attributes(params[:user])
      redirect_to root_url, :notice => "Your profile has been updated."
    else
      render :action => 'edit'
    end
  end
  
end
