# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_rubysoc_session',
  :secret      => 'e8066dcc5928e3bd127e28683e97ab9c8452b743148737bf3157cbcda42335cd883ca44b388ede102b507d04553985333bb76f7fb4bfa01980623bf4f87a72ab'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
