# Это класс-копия User, чтобы при работе с friends была возможность User ссылаться на User
# которые содержатся в той же таблице.
class Friendship < ApplicationRecord
  belongs_to :user
  belongs_to :friend, :class_name => 'User'
end
