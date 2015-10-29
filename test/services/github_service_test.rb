require './test/test_helper'

class GithubServiceTest < ActiveSupport::TestCase
  attr_reader :service

  def setup
    @service ||= GithubService.new
  end

  test '#followers' do
    VCR.use_cassette("github_service#followers") do
      followers = service.followers
      follower = followers.first

      assert_equal 2, followers.count
      assert_equal 'selfup', follower[:login]
    end
  end

  test '#following' do
    VCR.use_cassette("github_service#following") do
      following = service.following
      following_first = following.first

      assert_equal 4, following.count
      assert_equal 'jmejia', following_first[:login]
    end
  end

  test '#starred' do
    VCR.use_cassette("github_service#starred") do
      starred_repos = service.starred

      assert_equal [], starred_repos
    end
  end

  test '#repos' do
    VCR.use_cassette("github_service#repos") do
      repos = service.repos
      repo = repos.first

      assert_equal 28, repos.count
      assert_equal 'api-curious', repo[:name]
      assert_equal 'https://github.com/ChrisCenatie/api-curious', repo[:html_url]
    end
  end

  test '#events' do
    VCR.use_cassette("github_service#events") do
      events = service.events(ENV["nickname"])

      assert_equal 30, events.count
    end
  end

  test '#organizations' do
    VCR.use_cassette("github_service#organizations") do
      orgs = service.organizations("jcasimir")

      assert_equal 3, orgs.count
      assert_equal 'turingschool', orgs.last[:login]
    end
  end

  test '#recent_commits' do
    VCR.use_cassette("github_service#recent_commits") do
      commits = service.user_commits(ENV["nickname"])

      assert_equal 1, commits.count
      assert_equal 1, commits.first[:payload][:commits].count
      assert_equal "ChrisCenatie/api-curious", commits.first[:repo][:name]
    end
  end
end
