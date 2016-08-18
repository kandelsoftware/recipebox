class Recipe < ApplicationRecord
  has_attached_file :image, styles: { medium: "300x300>"},
  :default_url => "/system/images/:style/missing.png",
   :path => ":rails_root/app/assets/images/system/:attachment/:id/:style/:filename",
   :url => "system/:attachment/:id/:style/:filename"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
