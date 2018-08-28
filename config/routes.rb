Rails.application.routes.draw do
get  'hero/index'
get    'hero/new'
post   'hero/create'
delete 'hero/:name' => 'hero#destroy'
get    'hero/:id/edit' => 'hero#edit'

put    'hero/:id' => 'hero#update'
end