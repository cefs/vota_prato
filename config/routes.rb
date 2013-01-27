VotaPrato::Application.routes.draw do

	match 'rack',
	:to => proc{|env| [200, {"Content-type" => "text/html"},
		["App Rack em uma rota Rails"]]}


	resources :restaurantes

	match "inicio(/:nome)" => "restaurantes#index"
end
