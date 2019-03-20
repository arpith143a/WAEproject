Rails.application.config.middleware.use OmniAuth::Builder do
  #provider :google_oauth2, ENV['GOOGLE_CLIENT_ID'], ENV['GOOGLE_CLIENT_SECRET']
  # provider :google_oauth2, ENV['GOOGLE_OAUTH_CLIENT_ID'], ENV['GOOGLE_OAUTH_SECRET'], provider_ignores_state: true
  #provider provider_ignores_state: true
  provider :google_oauth2, "205922665906-enaugrrt7k1gu6pmffp8ukl9ujtkvoe5.apps.googleusercontent.com",
           "fkCGCswXgYsjL8C88TLbhbST", {:skip_jwt => true}
end