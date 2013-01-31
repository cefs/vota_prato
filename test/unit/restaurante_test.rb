#encoding: utf-8
require 'test_helper'

class RestauranteTest < ActiveSupport::TestCase
	fixtures :restaurantes

	def test_restaurante
		restaurante = Restaurante.new(:nome => restaurantes(:fasano).nome, 
									  :endereco => restaurantes(:fasano).endereco, 
									  :especialidade => restaurantes(:fasano).especialidade)

		msg = "restaurante não foi salvo. errors: #{restaurante.errors.inspect}"


		assert restaurante.save, msg

		restaurante_fasano_copia = Restaurante.find(restaurante.id)

		#nome = nome
		assert_equal restaurante.nome, restaurante_fasano_copia.nome
	end
end
