class User < ActiveRecord::Base

  def self.from_omniauth(auth_info)
    where(uid: auth_info[:uid]).first_or_create do |new_user|
      new_user.uid                = auth_info.uid
      new_user.name               = auth_info.info.name
      new_user.screen_name        = auth_info.info.nickname
      new_user.avatar_url         = auth_info.extra.raw_info.avatar_url
      new_user.oauth_token        = auth_info.credentials.token
    end
  end
end
