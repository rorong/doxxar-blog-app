class Blog < ApplicationRecord
  belongs_to :user
  serialize :content, JSON

end
