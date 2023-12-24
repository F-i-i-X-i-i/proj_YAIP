class Post < ApplicationRecord
  validates :title, presence: true, length: {minimum: 5, maximum: 30}
  validates :author, presence: true, length: {minimum: 5}
end
