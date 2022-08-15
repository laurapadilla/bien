CarrierWave.configure do |config|
  config.storage    = :aws
  config.aws_bucket = 'bien-rest-reviews'
  config.aws_acl    = 'public-read'
  config.aws_authenticated_url_expiration = 60 * 60 * 24 * 7
  config.aws_credentials = {
    access_key_id:    'AKIA3XVDYOTDMNFP4XWC',
    secret_access_key: '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',
    region:            'us-east-1' 
  }
end
