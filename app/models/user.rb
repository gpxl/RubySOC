class User < ActiveRecord::Base
  devise :authenticatable, :recoverable, :rememberable
end
