ActionController::Routing::Routes.draw do |map|
    map.root :controller => 'posts'
  
      map.resources :posts do |post|
    post.resources :comments
  end
  
end
