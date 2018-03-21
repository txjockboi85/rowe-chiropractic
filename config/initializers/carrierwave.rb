CarrierWave.configure do |config|
  if Rails.env.development? || Rails.env.test?
    config.storage = :file
  end

  if Rails.env.production?
    config.fog_provider = 'fog/aws'
    config.storage = :fog
    config.fog_credentials = {
      provider:              'AWS',
      aws_access_key_id:     Rails.application.credentials.aws_access_key_id,
      aws_secret_access_key: Rails.application.credentials.aws_secret_access_key,
      region:                'us-east-2',
    }
    config.fog_directory  = 'rowechiropractic.com'
  end
end