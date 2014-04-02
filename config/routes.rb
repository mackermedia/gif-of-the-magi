GifOfTheMagi::Application.routes.draw do

  get   '/:channel_token'       => 'channels#show', :as => :channel
  post  '/:channel_token/gifs'  => 'gifs#create',   :as => :gif
  get   '/:channel_token/gifs'  => 'gifs#index',    :as => :gifs

  root :to => 'pages#home', :via => :get

  # need this because Rails `rescue_from` doesn't catch ActionController::RoutingError
  unless Rails.env.development?
    match '*path',  :to => 'application#render_404', :via => :all
  end

end
