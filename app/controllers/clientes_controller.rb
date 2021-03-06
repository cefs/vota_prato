class ClientesController < ApplicationController

  respond_to :html, :xml

  def index
    @clientes = Cliente.order(:nome).page(params[:page]).per(5)
    respond_with @clientes
  end

  def show
    @cliente = Cliente.find(params[:id])
    respond_with @cliente
  end

  def new
    @cliente = Cliente.new
    respond_with @cliente
  end

  def edit
    @cliente = Cliente.find(params[:id])
  end

  def create
    @cliente = Cliente.new(params[:cliente])

    respond_to do |format|
      if @cliente.save
        format.html { redirect_to @cliente, notice: 'Cliente was successfully created.' }
        format.js { render "create", status: 200 }
      else
        format.html { render action: "new" }
        format.js { render "create", status: 400 }
      end
    end
  end

  def update
    @cliente = Cliente.find(params[:id])

    respond_to do |format|
      if @cliente.update_attributes(params[:cliente])
        format.html { redirect_to @cliente, notice: 'Cliente was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @cliente.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @cliente = Cliente.find(params[:id])
    @cliente.destroy

    respond_to do |format|
      format.html { redirect_to clientes_url }
      format.json { head :no_content }
    end
  end
end
