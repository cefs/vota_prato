#encoding: utf-8
class Cliente < ActiveRecord::Base
	has_many :qualificacoes

	attr_accessible :nome, :idade

	validates_presence_of :nome,	message: "- deve ser preenchido"
	validates_presence_of :idade,	message: "- deve ser preenchido"

	validates_numericality_of	:idade, 
								greater_than: 0,
								less_than: 100,
								message: "- deve ser um número entre 0 e 100"

end
