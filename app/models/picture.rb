class Picture < ActiveRecord::Base
	has_attached_file :image, :styles => { :medium => "600x300>", :thumb => "200x100#" }, :default_url => "/images/:style/missing.png"
  	validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  	validates_with AttachmentSizeValidator, :attributes => :image, :less_than => 200.kilobytes
end
