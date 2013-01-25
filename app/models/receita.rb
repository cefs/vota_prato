class Receita < ActiveRecord::Base
	  belongs_to :prato

	attr_accessible :prato_id, :conteudo

	validates_presence_of :prato_id
	validates_presence_of :conteudo, message: "- deve ser preenchido"

	validates_associated :prato
end
