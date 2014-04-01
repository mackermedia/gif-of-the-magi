GifOfTheMagi::Application.routes.draw do

  resources :gifs, :only => [:new, :create, :index]

  # need this because Rails `rescue_from` doesn't catch ActionController::RoutingError
  unless Rails.env.development?
    match '*path',  :to => 'application#render_404', :via => :all
  end

end
