class CallsController < ApplicationController
  before_action :set_call, only: [:show, :edit, :update, :destroy]

  # GET /calls
  # GET /calls.json
  def index

    @comunas = Register.distinct.pluck(:comuna)
    @registers = Register.all
    if params[:filtro_comuna].blank?
      @calls = Call.all
    else
      @registers = Register.where(:comuna => params[:filtro_comuna])
      @calls = []
      @registers.each do |r|
        @call_r = Call.where(:register_id => r.id)
        @calls = @calls + @call_r
      end
    end
  end

  # GET /calls/1
  # GET /calls/1.json
  def show
  end

  # GET /calls/new
  def new
    @comunas = Register.distinct.pluck(:comuna)
    @registers = Register.all

    @call = Call.new
    if params[:filtro_comuna].blank?
      @calls = Call.all
    else
      @registers = Register.where(:comuna => params[:filtro_comuna]).map{ |r| [r.calle + ' ' + r.numero.to_s, r.id] }

    end
  end

  # GET /calls/1/edit
  def edit
  end

  # POST /calls
  # POST /calls.json
  def create
    @call = Call.new(call_params)
    @call.register_id =  params[:register_id]

    respond_to do |format|
      if @call.save
        format.html { redirect_to @call, notice: 'Call was successfully created.' }
        format.json { render :show, status: :created, location: @call }
      else
        format.html { render :new }
        format.json { render json: @call.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /calls/1
  # PATCH/PUT /calls/1.json
  def update
    respond_to do |format|
      if @call.update(call_params)
        format.html { redirect_to @call, notice: 'Call was successfully updated.' }
        format.json { render :show, status: :ok, location: @call }
      else
        format.html { render :edit }
        format.json { render json: @call.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /calls/1
  # DELETE /calls/1.json
  def destroy
    @call.destroy
    respond_to do |format|
      format.html { redirect_to calls_url, notice: 'Call was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def call_params
      params.require(:call).permit(:fecha_llamado, :fecha_retiro, :register_id, :status)
    end

    def set_call
      @call = Call.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def call_params
      params.require(:call).permit(:fecha_llamado, :fecha_retiro, :status)
    end
end
