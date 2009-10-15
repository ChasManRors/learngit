# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_learngit_session',
  :secret      => '206caa1fe6d37737b0708035ed398023a7d3fd84be7d0f1f747df4ed8d93a0869f754b83854576173311f70c4293e9c6f07e012b6026e2c29ae8fe9672682a80'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
