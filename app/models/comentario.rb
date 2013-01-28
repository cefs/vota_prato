class Comentario < ActiveRecord::Base
#associations
	belongs_to :comentavel, polymorphic: true
#mass assingment	
	attr_accessible :comentavel_id, :comentavel_type, :conteudo
end
