class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all

    render :json => @users
  end

  # GET /users/1
  # GET /users/1.json
  def show
      render  :json => @user.to_json({})
  end
  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        #format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :json=> @user }
      else
        format.html { render action: 'new' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update

       @user.update(user_params)
       render :json => @user.to_json


  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    #delete all group
    #delete all menbership
    #all signature
    #
    #set all shared document to null
    #
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end
  # GET  /authority
  def get_authority
     @user = User.find_by_roles('Authority')
     #respond_to do |format|
      # format.json { head :no_content }
     #end
    render :json => @user.to_json({})
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:firstname, :lastname, :email, :password, :publicKey, :secretKeyId, :roles,:salt ,:verifier, :isInitialized, :isActiv);
    end
end
