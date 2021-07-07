module SalesforceEvents
    class AccountsController < ApplicationController
        skip_before_action :verify_authenticity_token, only: [:create]

        def create
            @account = Account.create(
                name: params["Name"],
                is_deleted: params["IsDeleted"],
                clean_status: params["CleanStatus"],
                owner_id: params["OwnerId"]
            )
            head :ok
        end

    end
end