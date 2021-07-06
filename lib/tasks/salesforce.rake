namespace :salesforce do

    task test_streaming:  :environment do
        topic_name = ENV['TOPIC_NAME']

        subscriber = SalesforceSubscriberService.new
        subscriber.create_push_topic(
            name: topic_name,
            description: "",
            query: 'select Id, Name, Phone, Type, BillingStreet,BillingCity, BillingState, BillingPostalCode, BillingCountry, Ownerid, ParentId, IsDeleted from Account'
        )
        subscriber.subscribe(topic_name)
    end
end