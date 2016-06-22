OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, '489526137634-nuangjhdach3aqnlgdgupumlmnvmqa72.apps.googleusercontent.com', '9FxlosOS6_JTNVsgOXUu9l1q', {client_options: {ssl: {ca_file: Rails.root.join("cacert.pem").to_s}}}
end