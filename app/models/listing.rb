class Listing < ActiveRecord::Base
  has_attached_file :image, :styles => { :medium => "200x>", :thumb => "100x100>" }, :default_url => "default.jpg",     
  						:storage => :dropbox,
    					:dropbox_credentials => Rails.root.join("config/dropbox.yml")
  do_not_validate_attachment_file_type :image

  validates :name, :description, :price, presence: true
  validates :price, numericality: {greater_than: 0}
  validates_attachment_presence :image

  belongs_to :user
  has_many :orders

end
