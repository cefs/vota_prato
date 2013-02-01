#encoding: utf-8
class Restaurante < ActiveRecord::Base
#paperclip
has_attached_file :foto, :styles => {:medium => "300x200", :thumb => "100x100"}

#associations  
      has_many :qualificacoes
      has_and_belongs_to_many :pratos
      has_many :comentarios, :as => :comentavel
#mass assingment
  attr_accessible :nome, :endereco, :especialidade, :foto

#validations
  validates_presence_of :nome, message: "deve ser preenchido"
  validates_presence_of :endereco, message: "deve ser preenchido"
  validates_presence_of :especialidade, message: "deve ser preenchido"

  validates_uniqueness_of :nome, message: "nome já cadastrado!"
  validates_uniqueness_of :endereco, message: "endereço já cadastrado!"

  validate :primeira_letra_maiuscula

  #methods of instance
  def nota_media    
    nota_media = self.qualificacoes.average(:nota)
  end

  def valida_nota_media
    if nota_media.nil?
      0 
    else
      nota_media.round
    end
  end

  def media_valor_gasto
    media_valor_gasto = self.qualificacoes.average(:valor_gasto)
  end

  def valida_media_valor_gasto
    if media_valor_gasto.nil?
      0
    else
      media_valor_gasto.round(2)
    end
  end

  private
  def primeira_letra_maiuscula
  	errors.add(:nome,"primeira letra deve ser maiúscula") unless nome =~ /[A-Z].*/
  end
end
