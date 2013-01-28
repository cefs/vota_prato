class QualificacoesController < ApplicationController

  respond_to :html,:xml

  def index
    @qualificacoes = Qualificacao.all
    respond_with @qualificacoes
  end

  def show
    @qualificacao = Qualificacao.find(params[:id])
    respond_with @qualificacao
  end

  def new
    @qualificacao = Qualificacao.new

    if params[:cliente]
      @qualificacao.cliente = Cliente.find(params[:cliente])
    end

    if params[:restaurante]
      @qualificacao.restaurante = Restaurante.find(params[:restaurante])
    end
  end

  def edit
    @qualificacao = Qualificacao.find(params[:id])
  end

  def create
    @qualificacao = Qualificacao.new(params[:qualificacao])

    respond_to do |format|
      if @qualificacao.save
        format.html { redirect_to @qualificacao, notice: 'Qualificacao was successfully created.' }
        format.json { render json: @qualificacao, status: :created, location: @qualificacao }
      else
        format.html { render action: "new" }
        format.json { render json: @qualificacao.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @qualificacao = Qualificacao.find(params[:id])

    respond_to do |format|
      if @qualificacao.update_attributes(params[:qualificacao])
        format.html { redirect_to @qualificacao, notice: 'Qualificacao was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @qualificacao.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @qualificacao = Qualificacao.find(params[:id])
    @qualificacao.destroy

    respond_to do |format|
      format.html { redirect_to qualificacoes_url }
      format.json { head :no_content }
    end
  end
end
