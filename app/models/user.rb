class User < ApplicationRecord
  validates :name, :job, presence: true
end
