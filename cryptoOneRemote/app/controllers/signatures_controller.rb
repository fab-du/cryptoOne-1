class SignaturesController < ApplicationController
  before_action :set_signature, only: [:show, :edit, :update, :destroy]

  # GET /signatures
  # GET /signatures.json
  def index
    @signatures = Signature.all

    if  params[:user_id]
       user_id = params[:user_id].to_i
       @signatures= @signatures.select{|signature| signature.userId == user_id };
    end

    if  params[:signority_id]
      signority_id = params[:signority_id].to_i
      @signatures= @signatures.select{|signature| signature.signorityId == signority_id };
    end

=begin
    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @signatures }
    end
=end

      render :json => @signatures



#
  end

  # GET /signatures/1
  # GET /signatures/1.json
  def show

    render :json => @signature.to_json({})
  end

  # GET /signatures/new
  def new
    @signature = Signature.new
  end

  # GET /signatures/1/edit
  def edit
  end

  # POST /signatures
  # POST /signatures.json
  def create
    @signature = Signature.new(signature_params)
    @signature.save

    respond_to do |format|
      if @signature.save
        #format.html { redirect_to @signature, notice: 'Signature was successfully created.' }
        format.json { render :json =>  @signature.to_json({}) }
      else
        format.html { render action: 'new' }
        format.json { render json: @signature.errors, status: :unprocessable_entity }
      end

    end

  end

  # PATCH/PUT /signatures/1
  # PATCH/PUT /signatures/1.json
  def update
    respond_to do |format|
      if @signature.update(signature_params)
        format.html { redirect_to @signature, notice: 'Signature was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @signature.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /signatures/1
  # DELETE /signatures/1.json
  def destroy
    @signature.destroy
    respond_to do |format|
      format.html { redirect_to signatures_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_signature
      @signature = Signature.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def signature_params
      params.require(:signature).permit(:signorityId, :userId, :value, :encryptedPublicKey, :signatureDate)

    end
end
