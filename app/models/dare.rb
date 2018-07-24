class Dare < ApplicationRecord
	belongs_to :user

	validates :message, presence: true
	validates :message, length: {maximum: 240, too_long: "longiwnded. too much to read too little time"}

end
