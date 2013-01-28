VotaPrato::Application.routes.draw do
  resources :comentarios


	#Resources
	resources :clientes
	resources :qualificacoes
	resources :restaurantes

	#Testando rack dentro de aplicação rails
	#match 'rack',
	#:to => proc{|env| [200, {"Content-type" => "text/html"},
	#	["App Rack em uma rota Rails"]]}

	#Match
	match "inicio" => "restaurantes#index"

	root :to => "restaurantes#index"
end
