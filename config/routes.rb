Rails.application.routes.draw do
  namespace :salesforce_events do
    resource :accounts, only: [:create, :update]
  end
end
