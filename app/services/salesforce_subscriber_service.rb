require 'restforce'
require 'faye'

class SalesforceSubscriberService
    attr_reader :client

    LOG_PATH = "#{Rails.root}/log/#{Rails.env}_salesforce.log"
    LOGGER = Logger.new(LOG_PATH)

    def initialize
        @client =  Restforce.new(
            username: ENV['salesforce_username'],
            password: ENV['salesforce_password'],
            security_token: ENV['salesforce_security_token'],
            client_id: ENV['salesforce_client_id'],
            client_secret: ENV['salesforce_client_secret']
        )
    end

    def create_push_topic(name:, description:, query:)
        topic_id = @client.create!(
            'PushTopic',
            ApiVersion: '48.0',
            Name: name,
            Description: description,
            NotifyForOperations: 'All',
            NotifyForFields: 'All',
            Query: query
        )

        LOGGER.info("Created Push Topic With ID: #{topic_id}")
    end

    def subscribe(topic_name)
        EM.run do
            @client.subscription "/topic/#{topic_name}" do |message|
                LOGGER.info("Recieved '#{message}' from topic #{topic_name}")
                message.inspect
            end
        end
    end
end