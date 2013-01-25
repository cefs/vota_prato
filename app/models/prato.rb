#encoding: utf-8
class Prato < ActiveRecord::Base
	  has_and_belongs_to_many :restaurantes
	  has_one :receita

	attr_accessible :nome

	validates_presence_of	:nome, message: "- deve ser preenchido"
	validates_uniqueness_of :nome, message: "- nome já cadastrado"

	validate :validate_presence_of_more_than_one_restaurante

	private

	def validate_presence_of_more_than_one_restaurante
		errors.add("restaurantes","deve haver ao menos um restaurante") if restaurantes.empty?
	end
end
