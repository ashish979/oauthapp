Oauth2 App

This app is an example of multiple login system. User can sign up on this app or login via twitter and google.

To setup the application:

1. Clone the application.
2. Install ruby 2.4.0
3. bundle install
4. create database.yml and secrets.yml
5. rake db:create db:migrate
6. generate google oauth2 credentials from https://console.developers.google.com/ and add it to secrets.yml
5. rails server