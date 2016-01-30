class Post < ActiveRecord::Base

  belongs_to :admin

has_attached_file :image, :styles => { :inpost => "778x514#", :header  => "1900x800#" }
# , :default_url => "/images/:style/missing.png"
                      # :storage => :s3,
                      # :s3_credentials => {
                      # :bucket => ENV['AWS_BUCKET'],
                      # :access_key_id => ENV['AWS_ACCESS_KEY_ID'],
                      # :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY']
                      # },
                      # :path => ":class/:id/:basename_:style.:extension",
                      # :s3_host_name => "s3-ap-southeast-1.amazonaws.com"

  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

end
