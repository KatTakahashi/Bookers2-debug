class Relationship < ApplicationRecord
  
  belongs_to :follower, class_name: "User"  # class_name: "User"でUserモデルを参照
  belongs_to :followed, class_name: "User"

end
