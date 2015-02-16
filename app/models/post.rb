class Post < ActiveRecord::Base
  belongs_to :user

  has_attached_file :poster_image,
    :styles => { :medium => "300x300>", :thumb => "100x100>" },
    :bucket  => 'kbimdbest',
    :default_url => "/images/:style/missing.png",
    :url =>':s3_domain_url',
    :path => ":class/:attachment/:style/missing.png"
  validates_attachment_content_type :poster_image, :content_type => /\Aimage\/.*\Z/
end
