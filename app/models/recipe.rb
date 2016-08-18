class Recipe < ApplicationRecord
  has_many :ingredients
  has_many :directions
  accepts_nested_attributes_for :ingredients,
                                reject_if: proc { |attributes| attributes['name'].blank? },
                                allow_destroy: true
  accepts_nested_attributes_for :directions,
                                reject_if: proc { |attributes| attributes['step'].blank? },
                                allow_destroy: true
  validates :title,:description,:image, presence: true
  has_attached_file :image, styles: { medium: "300x300>"},
  :default_url => "/system/images/:style/missing.png",
   :path => ":rails_root/app/assets/images/system/:attachment/:id/:style/:filename",
   :url => "system/:attachment/:id/:style/:filename"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
