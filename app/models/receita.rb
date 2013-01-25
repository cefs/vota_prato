class Receita < ActiveRecord::Base
	attr_accessible :prato_id, :conteudo

	validates_presence_of :conteudo, message: "- deve ser preenchido"
end
