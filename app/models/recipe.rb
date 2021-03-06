class Recipe < ActiveRecord::Base
	mount_uploader :image, ImageUploader

	belongs_to :user
	has_many :ingredients, dependent: :destroy
	has_many :directions, dependent: :destroy
	accepts_nested_attributes_for :ingredients,
								  reject_if: proc { |attributes| attributes['name'].blank? },
								  allow_destroy: true
	accepts_nested_attributes_for :directions,
								  reject_if: proc { |attributes| attributes['step'].blank? },
								  allow_destroy: true
end
