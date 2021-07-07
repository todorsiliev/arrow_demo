module SalesforceEvents
    class AccountsController < ApplicationController
        skip_before_action :verify_authenticity_token, only: [:create, :update]

        def create
            @account = Account.create(account_attributes)
            head :ok
        end
        
        def update
            old_account = Account.find_by_sf_id(params["Id"])
            if !old_account.nil?
                old_account.update(account_attributes)
                head :ok
            else
                head 404
            end
        end

        private 

        def account_attributes
            {
                sf_id: params["Id"],
                name: params["Name"],
                is_deleted: params["IsDeleted"],
                clean_status: params["CleanStatus"],
                owner_id: params["OwnerId"]
            }
        end
    end
end