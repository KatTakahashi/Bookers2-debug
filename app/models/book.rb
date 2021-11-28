class Book < ApplicationRecord
	belongs_to :user #9.debug:has_manyをbelongs_toに書き換え

	validates :title, presence: true
	validates :body, presence: true, length: {maximum: 200}
end
