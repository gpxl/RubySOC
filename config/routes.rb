ActionController::Routing::Routes.draw do |map|
  map.root :controller => 'static', :action => 'show', :path => ['index']

  # Basic Routes
  map.resource :home, :controller => 'home'
                                                                               
  map.connect '*path', :controller => :static, :action => 'show'
end