# Solution

## Main classes

- **app/services/salesforce_subscriber_service.rb** - implements SF Streaming API methods *PushTopic* and *Subscribe*

- **app/models/account.rb** - SF *Account* model

- **app/controllers/salesforce_events/accounts_controller.rb** - implements *create* and *update* methods to track SF Accounts events

## Streaming API
Use this command to test Streaming API

```TOPIC_NAME='Your topic' rake salesforce:test_streaming ```

---