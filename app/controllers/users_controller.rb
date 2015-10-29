class UsersController < ApplicationController

  def show
    if !current_user
      redirect_to root_path
    else
      contribution_metrics
      @github_service = GithubService.new(current_user)
      @contributions = Contributions.new(current_user.screen_name).longest_streak
    end
  end

  private

    def contribution_metrics
      contributions = Contributions.new(current_user.screen_name)
      @total = contributions.commits
      @longest_streak = contributions.longest_streak
      @current_streak = contributions.current_streak
    end

end
