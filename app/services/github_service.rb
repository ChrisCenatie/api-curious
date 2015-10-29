class GithubService

  attr_reader :connection

  def initialize(current_user = nil)
    @connection = Hurley::Client.new("https://api.github.com")
    if Rails.env.development? || Rails.env.production?
      user = User.find(current_user.id)
      @connection.query[:access_token] = user.oauth_token
    elsif Rails.env.test?
      @connection.query[:access_token] = ENV["github_credentials"]
    end
  end

  def followers
    parse(connection.get('/user/followers'))
  end

  def following
    parse(connection.get('/user/following'))
  end

  def starred
    parse(connection.get('/user/starred'))
  end

  def repos
    parse(connection.get('/user/repos'))
  end

  def events(username)
    parse(connection.get("/users/#{username}/events"))
  end

  def organizations(username)
    parse(connection.get("/users/#{username}/orgs"))
  end

  private

    def parse(response)
      JSON.parse(response.body, symbolize_names: true)
    end
end
