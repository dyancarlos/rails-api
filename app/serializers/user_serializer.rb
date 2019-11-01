class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :job, :createdAt
  
  def createdAt
    object.created_at.to_date
  end
end