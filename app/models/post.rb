class Post < ActiveRecord::Base
  def mentions
    @mentions ||= begin
                    regex = /@([\w]+)/
                    body.scan(regex).flatten
                  end
  end

  def mentioned_users
    @mentioned_users ||= User.where(username: mentions)
  end
end
