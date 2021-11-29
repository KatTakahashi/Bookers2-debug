class Book < ApplicationRecord
	belongs_to :user #9.debug:has_manyをbelongs_toに書き換え
	has_many :favorites, dependent: :destroy

	def favorited_by?(user)
		favorites.where(user_id: user.id).exists?
	end

	validates :title, presence: true
	validates :body, presence: true, length: {maximum: 200}
end
