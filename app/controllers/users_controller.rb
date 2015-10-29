class UsersController < ApplicationController

  def show
    redirect_to root_path if !current_user
    @contributions = Contributions.new(current_user.screen_name).longest_streak
  end
end
