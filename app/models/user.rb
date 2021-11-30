class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :books, dependent: :destroy #9.debug:belongs_to を has_manyに書き換え
  has_many :favorites, dependent: :destroy
  attachment :profile_image, destroy: false
  has_many :book_comments, dependent: :destroy

  #フォロー機能
    #Userモデルは複数のfollowerを持てる, どこのfollower? ⇒ class_name: Relationshipモデルを指定, foregin_key: follower_idカラムを指定
    has_many :relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
    has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
    #一覧画面で使用
    #Userモデルは複数のfollowing_userを持てる, through: 中間テーブルは上記のfollower, source: followed_idを指定
    has_many :followings, through: :relationships, source: :followed   # 自分がフォローしている人
    has_many :followers, through: :reverse_of_relationships, source: :follower    # 自分をフォローしている人

    # フォローしたときの処理
    def follow(user_id)
      relationships.create(followed_id: user_id)
    end
    # フォローを外すときの処理
    def unfollow(user_id)
      relationships.find_by(followed_id: user_id).destroy
    end
    # フォローしているか判定
    def following?(user)
      followings.include?(user)
    end


  validates :name, length: {maximum: 20, minimum: 2}, uniqueness: true
  validates :introduction, length: {maximum:50} #24.debug:追加
end
